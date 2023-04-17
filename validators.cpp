//
// Created by egor on 16/04/23.
//

#include "validators.h"
#include <jsoncons/json_cursor.hpp>

void sayHello() {
    std::cout << "Hello LLVM!" << '\n';
}

bool validateInt(void* cursor) {
    return false;
}

void callNext(void* cursor) {
}

