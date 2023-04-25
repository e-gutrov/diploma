//
// Created by egor on 25/04/23.
//

#ifndef COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H
#define COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H

#include <jsoncons/json_cursor.hpp>

#include "table_schema.h"

class CursorValidator {
public:
    virtual bool Validate(jsoncons::json_cursor*) = 0;
    virtual ~CursorValidator() = default;
};

std::unique_ptr<CursorValidator> CreateCursorValidator(const TypeBasePtr& schema, int depth = 0);

#endif //COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H
