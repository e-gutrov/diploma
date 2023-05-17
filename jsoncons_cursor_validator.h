#ifndef COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H
#define COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H

#include "table_schema.h"

#include <jsoncons/json_cursor.hpp>

// TODO: think about refactoring

class JsonconsCursorValidator {
public:
    virtual bool Validate(jsoncons::json_cursor*) = 0;
    virtual ~JsonconsCursorValidator() = default;
};

std::unique_ptr<JsonconsCursorValidator>
CreateJsonconsCursorValidator(const TypeBasePtr& schema, int depth = 0);

#endif // COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H
