#include <jsoncons/json_cursor.hpp>

using namespace jsoncons;

extern "C" json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<json_cursor*>(ptr);
}

extern "C" bool IsDone(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    return cursor->done();
}

extern "C" staj_event_type GetCurrentType(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    return cursor->current().event_type();
}

extern "C" void CallNext(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    cursor->next();
}

extern "C" bool ValidateInt(void* ptr) {
    auto eventType = GetCurrentType(ptr);
    auto cursor = reinterpret_cast<jsoncons::json_cursor*>(ptr);
    cursor->next();
    return eventType == jsoncons::staj_event_type::uint64_value || eventType == jsoncons::staj_event_type::int64_value;
}

extern "C" bool ValidateString(void* ptr) {
    auto eventType = GetCurrentType(ptr);
    auto cursor = reinterpret_cast<jsoncons::json_cursor*>(ptr);;
    cursor->next();
    return eventType == jsoncons::staj_event_type::string_value || eventType == jsoncons::staj_event_type::byte_string_value;
}

extern "C" bool IsBeginArray(void* ptr) {
    return GetCurrentType(ptr) == jsoncons::staj_event_type::begin_array;
}

extern "C" bool IsEndArray(void* ptr) {
    return GetCurrentType(ptr) == jsoncons::staj_event_type::end_array;
}

extern "C" bool IsNull(void* ptr) {
    return GetCurrentType(ptr) == jsoncons::staj_event_type::null_value;
}

