#ifndef COURSEWORK_VALIDATORS_JSONCONS_H
#define COURSEWORK_VALIDATORS_JSONCONS_H

#include <jsoncons/json.hpp>

#include "table_schema.h"

jsoncons::json GenerateJsonSchema(const TypeBasePtr&);

#endif //COURSEWORK_VALIDATORS_JSONCONS_H
