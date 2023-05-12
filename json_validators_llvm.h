#ifndef COURSEWORK_JSON_VALIDATORS_LLVM_H
#define COURSEWORK_JSON_VALIDATORS_LLVM_H

#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <jsoncons/staj_cursor.hpp>

#include "table_schema.h"

namespace JsonValidators {
    int FillWithEvents(int8_t* arr, int capacity, void* c);

    llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema);
}

#endif //COURSEWORK_JSON_VALIDATORS_LLVM_H
