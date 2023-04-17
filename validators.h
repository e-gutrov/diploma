//
// Created by egor on 16/04/23.
//

#ifndef COURSEWORK_VALIDATORS_H
#define COURSEWORK_VALIDATORS_H

#include <jsoncons/json_cursor.hpp>

void sayHello();
bool validateInt(void* cursor);
void callNext(void* cursor);

#endif //COURSEWORK_VALIDATORS_H
