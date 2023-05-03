//
// Created by egor on 23/04/23.
//

#ifndef COURSEWORK_VALIDATORS_LLVM_H
#define COURSEWORK_VALIDATORS_LLVM_H

#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <jsoncons/staj_cursor.hpp>

#include "table_schema.h"


void SayHello();

jsoncons::staj_event_type GetCurrentType(void* ptr);
bool IsDone(void* ptr);
void CallNext(void* ptr);

template<ValueType T>
bool ValidateSimpleType(void* ptr) {
    auto eventType = GetCurrentType(ptr);
    CallNext(ptr);
    if constexpr (T == ValueType::Int) {
        return eventType == jsoncons::staj_event_type::uint64_value || eventType == jsoncons::staj_event_type::int64_value;
    } else if constexpr (T == ValueType::String) {
        return eventType == jsoncons::staj_event_type::string_value || eventType == jsoncons::staj_event_type::byte_string_value;
    }
}

template<jsoncons::staj_event_type T>
bool IsType(void* ptr) {
    return GetCurrentType(ptr) == T;
}

llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema);

#endif //COURSEWORK_VALIDATORS_LLVM_H
