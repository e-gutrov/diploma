//
// Created by egor on 23/04/23.
//

#include <jsoncons/json_cursor.hpp>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include "validators_llvm.h"
#include "helpers.h"

using namespace jsoncons;

void SayHello() {
    std::cout << "Hello LLVM!" << '\n';
}

json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<json_cursor*>(ptr);
}

//void debugPrint(const std::string& funcName, json_cursor* cursor) {
//    std::cerr << "debugPrint called, " << funcName << " " << cursor->current().event_type() << std::endl;
//}

extern "C" bool IsDone(void* ptr) {
    auto cursor = toJsonCursor(ptr);
//    debugPrint("isDone", cursor);
    return cursor->done();
}

extern "C" staj_event_type GetCurrentType(void* ptr) {
    auto cursor = toJsonCursor(ptr);
//    debugPrint("GetCurrentType", cursor);
    return cursor->current().event_type();
}

extern "C" void CallNext(void* ptr) {
    auto cursor = toJsonCursor(ptr);
//    debugPrint("CallNext", cursor);
    cursor->next();
}

// TODO: in case of structs, map each field name to a number and lookup it in a map with an external function?
// based on the index, call the needed function (ptrs will be stored in an array?) and mark the field used
// Check that all required fields are met

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
        case ValueType::Object: {
            // auto children
            // TODO
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
    auto module = llvm::parseIRFile("/home/egor/CLionProjects/coursework/llvm_madness.ll", err, *context);
    std::cerr << "Loaded module " << err.getFilename().data() << std::endl;
//    module->dump();
//    auto module = std::make_unique<llvm::Module>("validating_module", *context);
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

//    module->print(llvm::outs(), nullptr);
    return FinalizeModule(std::move(module), std::move(context));
}