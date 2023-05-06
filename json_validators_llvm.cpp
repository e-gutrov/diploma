#include <jsoncons/json_cursor.hpp>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IRReader/IRReader.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/SourceMgr.h>

#include "json_validators_llvm.h"
#include "helpers.h"

namespace JsonValidators {
    jsoncons::json_cursor* toJsonCursor(void* ptr) {
        return reinterpret_cast<jsoncons::json_cursor*>(ptr);
    }

    bool IsDone(void* ptr) {
        auto cursor = toJsonCursor(ptr);
        return cursor->done();
    }

    jsoncons::staj_event_type GetCurrentType(void* ptr) {
        auto cursor = toJsonCursor(ptr);
        return cursor->current().event_type();
    }

    void CallNext(void* ptr) {
        auto cursor = toJsonCursor(ptr);
        cursor->next();
    }

    llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema) {
        auto context = std::make_unique<llvm::LLVMContext>();
        llvm::IRBuilder<> builder(*context);
        llvm::SMDiagnostic err;
        auto module = llvm::parseIRFile("/home/egor/CLionProjects/coursework/llvm-ir-helpers/llvm_jsoncons_helpers.ll", err, *context);
        auto functions = GenerateFunctionDeclarations(&builder, module.get());

        auto validateRoot = CreateTypeValidator(schema, context.get(), &builder, module.get(), functions);

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
}