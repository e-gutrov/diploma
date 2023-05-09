#include <jsoncons/json_cursor.hpp>

using namespace jsoncons;

extern "C" json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<json_cursor*>(ptr);
}

extern "C" int FillWithEvents(int8_t* arr, int capacity, void* c);

extern "C" int8_t GetCurrentType(int8_t* arr, int* next) {
//    printf("GetCurrentType called, next=%d, current=%d\n", *next, arr[*next]);
    return arr[*next];
}

extern "C" void CallNext(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
//    printf("CallNext, next=%d, size=%d\n", *next, *size);
    if (++(*next) == *size) {
        *next = 0;
        *size = FillWithEvents(arr, capacity, cursor);
    }
}

extern "C" bool IsDone(int8_t* arr, int* next) {
    return GetCurrentType(arr, next) == -1;
}

//extern "C" staj_event_type GetCurrentType(void* ptr) {
//    auto cursor = toJsonCursor(ptr);
//    return cursor->current().event_type();
//}

//extern "C" void CallNext(void* ptr) {
//    auto cursor = toJsonCursor(ptr);
//    cursor->next();
//}

extern "C" bool ValidateInt(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    CallNext(arr, next, size, capacity, cursor);
    return eventType == jsoncons::staj_event_type::uint64_value || eventType == jsoncons::staj_event_type::int64_value;
}

extern "C" bool ValidateString(int8_t* arr, int* next, int* size, int capacity, void* cursor) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    CallNext(arr, next, size, capacity, cursor);
    return eventType == jsoncons::staj_event_type::string_value || eventType == jsoncons::staj_event_type::byte_string_value;
}

// TODO: move to the generated function
extern "C" bool IsBeginArray(int8_t* arr, int* next) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    return eventType == jsoncons::staj_event_type::begin_array;
}

extern "C" bool IsEndArray(int8_t* arr, int* next) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    return eventType == jsoncons::staj_event_type::end_array;
}

extern "C" bool IsNull(int8_t* arr, int* next) {
    auto eventType = static_cast<staj_event_type>(GetCurrentType(arr, next));
    auto result = eventType == jsoncons::staj_event_type::null_value;
//    printf("IsNull called, result=%d\n", result);
    return result;
}

