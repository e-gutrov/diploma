//
// Created by egor on 16/04/23.
//

#ifndef COURSEWORK_VALIDATORS_H
#define COURSEWORK_VALIDATORS_H

#include <jsoncons/json.hpp>

#include "table_schema.h"

// TODO: move to helpers
void sayHello();
bool validateInt(void* ptr);
bool isDone(void* ptr);
void callNext(void* ptr);

jsoncons::json GenerateJsonSchema(const TypeBasePtr&);

#endif //COURSEWORK_VALIDATORS_H
