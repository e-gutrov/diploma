#include <jsoncons/json_cursor.hpp>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IRReader/IRReader.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/SourceMgr.h>

#include "validators_llvm.h"
#include "helpers.h"

using namespace jsoncons;

json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<json_cursor*>(ptr);
}

bool IsDone(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    return cursor->done();
}

staj_event_type GetCurrentType(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    return cursor->current().event_type();
}

void CallNext(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    cursor->next();
}

llvm::Function* DoCreateTypeValidator(
    const TypeBasePtr& schema,
    llvm::LLVMContext* context,
    llvm::IRBuilder<>* builder,
    llvm::Module* module,
    const std::unordered_map<std::string, llvm::Function*>& functions,
    const std::string& suffix = "") {

    auto funcType = llvm::FunctionType::get(builder->getInt1Ty(), {builder->getInt8PtrTy()}, false);
    auto funcName = "validate" + suffix;

    switch (schema->GetType()) {
        case ValueType::Int: {
            return functions.at("ValidateInt");
        }
        case ValueType::String: {
            return functions.at("ValidateString");
        }
        case ValueType::Optional: {
            auto validateChild = DoCreateTypeValidator(schema->Child(), context, builder, module, functions, suffix + "OptionalChild");
            auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);
            auto entry = llvm::BasicBlock::Create(*context, "entry", func);
            builder->SetInsertPoint(entry);
            // TODO: IsNullAndCallNext()?
            auto isNullCall = builder->CreateCall(functions.at("IsNull"), {func->arg_begin()});
            auto nullCase = llvm::BasicBlock::Create(*context, "null", func);
            auto nonNullCase = llvm::BasicBlock::Create(*context, "nonNull", func);
            builder->CreateCondBr(isNullCall, nullCase, nonNullCase);

            builder->SetInsertPoint(nullCase);
            auto nextCall = builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
            builder->CreateRet(builder->getInt1(true));

            builder->SetInsertPoint(nonNullCase);
            auto childCall = builder->CreateCall(validateChild, {func->arg_begin()});
            builder->CreateRet(childCall);
            return func;
        }
        case ValueType::List: {
            auto validateChild = DoCreateTypeValidator(schema->Child(), context, builder, module, functions, suffix + "ListChild");
            auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);

            auto entry = llvm::BasicBlock::Create(*context, "entry", func);
            builder->SetInsertPoint(entry);
            auto isBeginArray = builder->CreateCall(functions.at("IsBeginArray"), {func->arg_begin()});

            auto retFalse = llvm::BasicBlock::Create(*context, "retFalse", func);
            auto preLoop = llvm::BasicBlock::Create(*context, "preLoop", func);
            builder->CreateCondBr(isBeginArray, preLoop, retFalse);
            {
                builder->SetInsertPoint(retFalse);
                builder->CreateRet(builder->getInt1(false));
            }
            auto callNextAndRetTrue = llvm::BasicBlock::Create(*context, "callNextAndRetTrue", func);
            {
                builder->SetInsertPoint(callNextAndRetTrue);
                auto nextCall = builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
                builder->CreateRet(builder->getInt1(true));
            }
            {
                builder->SetInsertPoint(preLoop);
                auto nextCall = builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
            }
            auto while_ = llvm::BasicBlock::Create(*context, "while", func);
            auto whileBody = llvm::BasicBlock::Create(*context, "whileBody", func);
            builder->CreateBr(while_);
            builder->SetInsertPoint(while_);
            auto isEndArray = builder->CreateCall(functions.at("IsEndArray"), {func->arg_begin()});
            builder->CreateCondBr(isEndArray, callNextAndRetTrue, whileBody);

            builder->SetInsertPoint(whileBody);
            auto childCall = builder->CreateCall(validateChild, {func->arg_begin()});
            builder->CreateCondBr(childCall, while_, retFalse);
            return func;
        }
        case ValueType::Tuple: {
            std::vector<llvm::Function*> childValidators;
            int childCount = 0;
            for (const auto& child: schema->Children()) {
                ++childCount;
                childValidators.emplace_back(DoCreateTypeValidator(
                        child->Schema,
                        context,
                        builder,
                        module,
                        functions,
                        suffix + std::to_string(childCount)));
            }
            auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);

            auto entry = llvm::BasicBlock::Create(*context, "entry", func);
            builder->SetInsertPoint(entry);
            auto isBeginArray = builder->CreateCall(functions.at("IsBeginArray"), {func->arg_begin()});

            auto retFalse = llvm::BasicBlock::Create(*context, "retFalse", func);
            auto nextField = llvm::BasicBlock::Create(*context, "field0", func);
            builder->CreateCondBr(isBeginArray, nextField, retFalse);
            {
                builder->SetInsertPoint(retFalse);
                builder->CreateRet(builder->getInt1(false));
            }
            for (int i = 0; i < childValidators.size(); ++i) {
                builder->SetInsertPoint(nextField);
                if (i == 0) {
                    builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
                }
                nextField = llvm::BasicBlock::Create(*context, "field" + std::to_string(i + 1), func);
                auto childCall = builder->CreateCall(childValidators[i], {func->arg_begin()});
                builder->CreateCondBr(childCall, nextField, retFalse);
            }
            builder->SetInsertPoint(nextField);
            auto callNextAndRetTrue = llvm::BasicBlock::Create(*context, "callNextAndRetTrue", func);
            auto isEndArray = builder->CreateCall(functions.at("IsEndArray"), {func->arg_begin()});
            builder->CreateCondBr(isEndArray, callNextAndRetTrue, retFalse);
            builder->SetInsertPoint(callNextAndRetTrue);
            builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
            builder->CreateRet(builder->getInt1(true));
            return func;
        }
        case ValueType::Object: {
            // TODO: in case of structs, map each field name to a number and lookup it in a map with an external function?
            // based on the index, call the needed function (ptrs will be stored in an array?) and mark the field used
            // Check that all required fields are met
            assert(0);
        }
        default:
            assert(false);
    }

}

llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema) {
    auto context = std::make_unique<llvm::LLVMContext>();
    llvm::IRBuilder<> builder(*context);
    llvm::SMDiagnostic err;
    auto module = llvm::parseIRFile("/home/egor/CLionProjects/coursework/llvm-ir-helpers/llvm_jsoncons_helpers.ll", err, *context);
    auto functions = GenerateFunctionDeclarations(&builder, module.get());

    auto validateRoot = DoCreateTypeValidator(schema, context.get(), &builder, module.get(), functions);

    auto mainType = llvm::FunctionType::get(builder.getInt1Ty(), {builder.getInt8PtrTy()}, false);
    auto mainFunc = llvm::Function::Create(mainType, llvm::Function::ExternalLinkage, "main", module.get());

    auto entry = llvm::BasicBlock::Create(*context, "entry", mainFunc);
    builder.SetInsertPoint(entry);

    auto callValidateRoot = builder.CreateCall(validateRoot, {mainFunc->arg_begin()});
    llvm::Value* validateResult = callValidateRoot;
    auto callIsDone = builder.CreateCall(functions.at("IsDone"), {mainFunc->arg_begin()});
    llvm::Value* isDone = callIsDone;

    auto result = builder.CreateAnd(validateResult, isDone);
    builder.CreateRet(result);

    return FinalizeModule(std::move(module), std::move(context));
}