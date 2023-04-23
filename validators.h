//
// Created by egor on 16/04/23.
//

#ifndef COURSEWORK_VALIDATORS_H
#define COURSEWORK_VALIDATORS_H

#include <jsoncons/json.hpp>

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

jsoncons::json GenerateJsonSchema(const TypeBasePtr&);

#endif //COURSEWORK_VALIDATORS_H
