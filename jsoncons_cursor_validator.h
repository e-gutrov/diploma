#ifndef COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H
#define COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H

#include <jsoncons/json_cursor.hpp>

#include "table_schema.h"

// TODO: think about refactoring

class JsonconsCursorValidator {
public:
  virtual bool Validate(jsoncons::json_cursor *) = 0;
  virtual ~JsonconsCursorValidator() = default;
};

std::unique_ptr<JsonconsCursorValidator>
CreateJsonconsCursorValidator(const TypeBasePtr &schema, int depth = 0);

#endif // COURSEWORK_JSONCONS_CURSOR_VALIDATOR_H
