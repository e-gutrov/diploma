#ifndef COURSEWORK_YSON_VALIDATORS_LLVM_H
#define COURSEWORK_YSON_VALIDATORS_LLVM_H

#include "table_schema.h"

#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/ThreadSafeModule.h>

namespace YsonValidators {
int FillWithEvents(int8_t* arr, int capacity, void* c);

llvm::orc::ThreadSafeModule
CreateTableSchemaValidator(const TypeBasePtr& schema);
} // namespace YsonValidators

#endif // COURSEWORK_YSON_VALIDATORS_LLVM_H
