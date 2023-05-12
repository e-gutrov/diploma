//#include <ytsaurus/yt/yt/core/yson/syntax_checker.h>
//
//using namespace NYT::NYson;

#include <cstdint>

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

//__attribute__((always_inline))
//extern "C" TYsonPullParserCursor* toYsonCursor(void* ptr) {
//    return reinterpret_cast<TYsonPullParserCursor*>(ptr);
//}

extern "C" int FillWithEvents(int8_t* arr, int capacity, void* c);

__attribute__((always_inline))
extern "C" int8_t GetCurrentType(int8_t* arr, int* next) {
//    printf("GetCurrentType called, next=%d, current=%d\n", *next, arr[*next]);
    return arr[*next];
}

__attribute__((always_inline))
extern "C" void CallNext(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
//    printf("CallNext, next=%d, size=%d\n", *next, *size);
    if (++(*next) == *size) {
        *next = 0;
        *size = FillWithEvents(arr, capacity, cursor);
    }
}

__attribute__((always_inline))
extern "C" bool IsDone(int8_t* arr, int* next) {
    return GetCurrentType(arr, next) == -1;
}

//extern "C" MyYsonItemType GetCurrentType(void* ptr) {
//    auto cursor = toYsonCursor(ptr);
//    return cursor->GetCurrent().GetType();
//}
//
//extern "C" void CallNext(void* ptr) {
//    auto cursor = toYsonCursor(ptr);
//    cursor->Next();
//}

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