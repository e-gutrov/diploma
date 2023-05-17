#include <iostream>

#include <jsoncons/json_cursor.hpp>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IRReader/IRReader.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/SourceMgr.h>

#include "helpers.h"
#include "json_validators_llvm.h"

namespace JsonValidators {
int FillWithEvents(int8_t *arr, int capacity, void *c) {
  auto cursor = reinterpret_cast<jsoncons::json_cursor *>(c);
  int res = 0;
  // TODO: eliminate this part, probably memcpy is not needed
  int8_t result[1000];
  while (res < capacity && !cursor->done()) {
    result[res++] = static_cast<int8_t>(cursor->current().event_type());
    cursor->next();
  }
  if (res < capacity) {
    result[res++] = -1;
  }
  memcpy(arr, result, res);
  return res;
}

// TODO: this code is completely the same as in YSON, share it
llvm::orc::ThreadSafeModule
CreateTableSchemaValidator(const TypeBasePtr &schema) {
  auto context = std::make_unique<llvm::LLVMContext>();
  llvm::IRBuilder<> builder(*context);
  llvm::SMDiagnostic err;
  // TODO: path
  auto module = llvm::parseIRFile("/home/egor/CLionProjects/coursework/"
                                  "llvm-ir-helpers/llvm_jsoncons_helpers.ll",
                                  err, *context);
  auto functions = GetFunctionAddresses(&builder, module.get());

  auto validateRoot = CreateTypeValidatorNew(schema, context.get(), &builder,
                                             module.get(), functions);

  auto mainType = llvm::FunctionType::get(builder.getInt1Ty(),
                                          {builder.getInt8PtrTy()}, false);
  auto mainFunc = llvm::Function::Create(
      mainType, llvm::Function::ExternalLinkage, "main", module.get());

  auto entry = llvm::BasicBlock::Create(*context, "entry", mainFunc);
  builder.SetInsertPoint(entry);

  auto capacity = builder.getInt32(1000);
  auto arr = builder.CreateAlloca(builder.getInt8Ty(), capacity, "array_ptr");
  auto next = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "next");
  builder.CreateStore(builder.getInt32(-1), next);
  auto size = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "size");
  builder.CreateStore(builder.getInt32(0), size);

  auto initArr =
      builder.CreateCall(functions.at("CallNext"),
                         {arr, next, size, capacity, mainFunc->arg_begin()});

  auto callValidateRoot = builder.CreateCall(
      validateRoot, {arr, next, size, capacity, mainFunc->arg_begin()});
  llvm::Value *validateResult = callValidateRoot;
  auto isDone = builder.CreateCall(functions.at("IsDone"), {arr, next});

  auto result = builder.CreateAnd(validateResult, isDone);
  builder.CreateRet(result);

  return FinalizeModule(std::move(module), std::move(context));
}
} // namespace JsonValidators