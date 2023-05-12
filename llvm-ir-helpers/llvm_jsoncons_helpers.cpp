#include <jsoncons/json_cursor.hpp>

using namespace jsoncons;

__attribute__((always_inline))
extern "C" json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<json_cursor*>(ptr);
}

extern "C" int FillWithEvents(int8_t* arr, int capacity, void* c);

__attribute__((always_inline))
extern "C" int8_t GetCurrentType(int8_t* arr, int* next) {
    return arr[*next];
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
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    CallNext(arr, next, size, capacity, cursor);
    return eventType == jsoncons::staj_event_type::uint64_value || eventType == jsoncons::staj_event_type::int64_value;
}

__attribute__((always_inline))
extern "C" bool ValidateString(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    CallNext(arr, next, size, capacity, cursor);
    return eventType == jsoncons::staj_event_type::string_value || eventType == jsoncons::staj_event_type::byte_string_value;
}

__attribute__((always_inline))
extern "C" bool IsBeginArray(int8_t* arr, int* next) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    return eventType == jsoncons::staj_event_type::begin_array;
}

__attribute__((always_inline))
extern "C" bool IsEndArray(int8_t* arr, int* next) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    return eventType == jsoncons::staj_event_type::end_array;
}

__attribute__((always_inline))
extern "C" bool IsNull(int8_t* arr, int* next) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    auto result = eventType == jsoncons::staj_event_type::null_value;
    return result;
}
