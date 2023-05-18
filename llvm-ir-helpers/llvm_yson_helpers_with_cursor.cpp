#include <cstdint>
#include <ytsaurus/yt/yt/core/yson/pull_parser.h>

// generate LLVM IR: clang++-12 -S -emit-llvm llvm_yson_helpers.cpp -I../include/ -I../include/ytsaurus -I../include/ytsaurus/contrib/libs/cxxsupp/libcxx/include -stdlib=libc++ -std=c++20 -O3

enum class MyYsonItemType {
    EndOfStream,
    BeginMap,
    EndMap,
    BeginAttributes,
    EndAttributes,
    BeginList,
    EndList,
    EntityValue,
    BooleanValue,
    Int64Value,
    Uint64Value,
    DoubleValue,
    StringValue,
};

extern "C" int FillWithEvents(int8_t* arr, int capacity, void* c);

__attribute__((always_inline))
extern "C" int8_t GetCurrentType(int8_t* arr, int* next) {
    return arr[*next];
}

__attribute__((always_inline))
extern "C" void CallNextOnCursor(void* cursor) {
    reinterpret_cast<NYT::NYson::TYsonPullParserCursor*>(cursor)->Next();
}

__attribute__((always_inline))
extern "C" int8_t GetCurrentTypeOnCursor(void* cursor) {
    auto tp = reinterpret_cast<NYT::NYson::TYsonPullParserCursor*>(cursor)->GetCurrent().GetType();
    return static_cast<int8_t>(tp);
}

__attribute__((always_inline))
extern "C" void CallNext(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
    if (++(*next) == *size) {
        *next = 0;
        *size = FillWithEvents(arr, capacity, cursor);
    }
}

__attribute__((always_inline))
extern "C" bool IsDone(int8_t* arr, int* next) {
    return GetCurrentType(arr, next) == -1;
}

__attribute__((always_inline))
extern "C" bool ValidateInt(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
    auto eventType = static_cast<MyYsonItemType>(GetCurrentType(arr, next));
    CallNext(arr, next, size, capacity, cursor);
    return eventType == MyYsonItemType::Uint64Value || eventType == MyYsonItemType::Int64Value;
}

__attribute__((always_inline))
extern "C" bool ValidateString(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
    auto eventType = static_cast<MyYsonItemType>(GetCurrentType(arr, next));
    CallNext(arr, next, size, capacity, cursor);
    return eventType == MyYsonItemType::StringValue;
}

__attribute__((always_inline))
extern "C" bool IsBeginArray(int8_t* arr, int* next) {
    auto eventType = static_cast<MyYsonItemType>(GetCurrentType(arr, next));
    return eventType == MyYsonItemType::BeginList;
}

__attribute__((always_inline))
extern "C" bool IsEndArray(int8_t* arr, int* next) {
    auto eventType = static_cast<MyYsonItemType>(GetCurrentType(arr, next));
    return eventType == MyYsonItemType::EndList;
}

__attribute__((always_inline))
extern "C" bool IsNull(int8_t* arr, int* next) {
    auto eventType = static_cast<MyYsonItemType>(GetCurrentType(arr, next));
    return eventType == MyYsonItemType::EntityValue;
}