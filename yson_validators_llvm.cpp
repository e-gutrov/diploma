#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IRReader/IRReader.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/SourceMgr.h>

#include "yson_validators_llvm.h"
#include "helpers.h"

namespace YsonValidators {
    NYT::NYson::TYsonPullParserCursor* toYsonCursor(void* ptr) {
        return reinterpret_cast<NYT::NYson::TYsonPullParserCursor*>(ptr);
    }

    bool IsDone(void* ptr) {
        auto cursor = toYsonCursor(ptr);
        return cursor->GetCurrent().IsEndOfStream();
    }

    NYT::NYson::EYsonItemType GetCurrentType(void* ptr) {
        auto cursor = toYsonCursor(ptr);
        return cursor->GetCurrent().GetType();
    }

    void CallNext(void* ptr) {
        auto cursor = toYsonCursor(ptr);
        cursor->Next();
    }

    llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema) {
        auto context = std::make_unique<llvm::LLVMContext>();
        llvm::IRBuilder<> builder(*context);
        llvm::SMDiagnostic err;
        auto module = std::make_unique<llvm::Module>("validating_module", *context);
//        auto module = llvm::parseIRFile("/home/egor/CLionProjects/coursework/llvm-ir-helpers/llvm_yson_helpers.ll", err, *context);
        auto functions = GenerateFunctionDeclarations(&builder, module.get(), false);

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