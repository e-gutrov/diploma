#ifndef COURSEWORK_YSON_VALIDATORS_LLVM_H
#define COURSEWORK_YSON_VALIDATORS_LLVM_H

#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <ytsaurus/yt/yt/core/yson/pull_parser.h>

#include "table_schema.h"

namespace YsonValidators {
    NYT::NYson::EYsonItemType GetCurrentType(void* ptr);
    bool IsDone(void* ptr);
    void CallNext(void* ptr);

    template<ValueType T>
    bool ValidateSimpleType(void* ptr) {
        auto eventType = GetCurrentType(ptr);
        CallNext(ptr);
        if constexpr (T == ValueType::Int) {
            return eventType == NYT::NYson::EYsonItemType::Uint64Value || eventType == NYT::NYson::EYsonItemType::Int64Value;
        } else if constexpr (T == ValueType::String) {
            return eventType == NYT::NYson::EYsonItemType::StringValue;
        }
    }

    template<NYT::NYson::EYsonItemType T>
    bool IsType(void* ptr) {
        return GetCurrentType(ptr) == T;
    }

    llvm::orc::ThreadSafeModule CreateTableSchemaValidator(const TypeBasePtr& schema);
}

#endif //COURSEWORK_YSON_VALIDATORS_LLVM_H
