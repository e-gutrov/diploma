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

    int FillWithEvents(int8_t* arr, int capacity, void* c) {
//        printf("FillWithEvents called, capacity=%d\n", capacity);
        auto cursor = toJsonCursor(c);
        int res = 0;
        while (res < capacity && !cursor->done()) {
            arr[res++] = static_cast<int8_t>(cursor->current().event_type());
            cursor->next();
        }
        if (res < capacity) {
            arr[res++] = -1;
        }
//        printf("FillWithEvents finished, res=%d\n", res);
        return res;
    }

    llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema) {
        auto context = std::make_unique<llvm::LLVMContext>();
        llvm::IRBuilder<> builder(*context);
        llvm::SMDiagnostic err;
        auto module = llvm::parseIRFile("/home/egor/CLionProjects/coursework/llvm-ir-helpers/llvm_jsoncons_helpers.ll", err, *context);
        auto functions = GenerateFunctionDeclarations(&builder, module.get(), true);

        auto validateRoot = CreateTypeValidatorNew(schema, context.get(), &builder, module.get(), functions);

        auto mainType = llvm::FunctionType::get(builder.getInt1Ty(), {builder.getInt8PtrTy()}, false);
        auto mainFunc = llvm::Function::Create(mainType, llvm::Function::ExternalLinkage, "main", module.get());

        auto entry = llvm::BasicBlock::Create(*context, "entry", mainFunc);
        builder.SetInsertPoint(entry);


        auto capacity = builder.getInt32(100);
        auto arr = builder.CreateAlloca(builder.getInt8Ty(), capacity, "array_ptr");
        auto next = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "next");
        builder.CreateStore(builder.getInt32(-1), next);
        auto size = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "size");
        builder.CreateStore(builder.getInt32(0), size);

        auto initArr = builder.CreateCall(functions.at("CallNext"), {arr, next, size, capacity, mainFunc->arg_begin()});

        auto callValidateRoot = builder.CreateCall(validateRoot, {arr, next, size, capacity, mainFunc->arg_begin()});
        llvm::Value* validateResult = callValidateRoot;
        auto callIsDone = builder.CreateCall(functions.at("IsDone"), {arr, next});
        llvm::Value* isDone = callIsDone;

        auto result = builder.CreateAnd(validateResult, isDone);
        builder.CreateRet(result);

//        module->dump();
        return FinalizeModule(std::move(module), std::move(context));
    }
}