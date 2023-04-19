//
// Created by egor on 16/04/23.
//

#include "validators.h"
#include <jsoncons/json_cursor.hpp>

using namespace jsoncons;

void sayHello() {
    std::cout << "Hello LLVM!" << '\n';
}

jsoncons::json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<jsoncons::json_cursor*>(ptr);
}

void debugPrint(const std::string& funcName, json_cursor* cursor) {
    std::cerr << "debugPrint called, " << funcName << " " << cursor->current().event_type() << std::endl;
}

bool validateInt(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    debugPrint("validateInt", cursor);
    return true;
}

bool isDone(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    debugPrint("isDone", cursor);
    return cursor->done();
}

void callNext(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    debugPrint("callNext", cursor);
    cursor->next();
}

