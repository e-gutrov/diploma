#include <ytsaurus/yt/yt/core/yson/pull_parser.h>

using namespace NYT::NYson;

extern "C" TYsonPullParserCursor* toYsonCursor(void* ptr) {
    return reinterpret_cast<TYsonPullParserCursor*>(ptr);
}

extern "C" bool IsDone(void* ptr) {
    auto cursor = toYsonCursor(ptr);
    return cursor->GetCurrent().IsEndOfStream();
}

extern "C" EYsonItemType GetCurrentType(void* ptr) {
    auto cursor = toYsonCursor(ptr);
    return cursor->GetCurrent().GetType();
}

extern "C" void CallNext(void* ptr) {
    auto cursor = toYsonCursor(ptr);
    cursor->Next();
}

extern "C" bool ValidateInt(void* ptr) {
    // TODO: do optimally
    auto eventType = GetCurrentType(ptr);
    auto cursor = toYsonCursor(ptr);
    cursor->Next();
    return eventType == EYsonItemType::Uint64Value || eventType == EYsonItemType::Int64Value;
}

extern "C" bool ValidateString(void* ptr) {
    // TODO: do optimally
    auto eventType = GetCurrentType(ptr);
    auto cursor = toYsonCursor(ptr);;
    cursor->Next();
    return eventType == EYsonItemType::StringValue;
}

extern "C" bool IsBeginArray(void* ptr) {
    return GetCurrentType(ptr) == EYsonItemType::BeginList;
}

extern "C" bool IsEndArray(void* ptr) {
    return GetCurrentType(ptr) == EYsonItemType::EndList;
}

extern "C" bool IsNull(void* ptr) {
    return GetCurrentType(ptr) == EYsonItemType::EntityValue;
}