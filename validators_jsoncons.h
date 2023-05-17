#ifndef COURSEWORK_VALIDATORS_JSONCONS_H
#define COURSEWORK_VALIDATORS_JSONCONS_H

#include "table_schema.h"

#include <jsoncons/json.hpp>

// TODO: think about moving it/something like that
jsoncons::json GenerateJsonSchema(const TypeBasePtr&);

#endif // COURSEWORK_VALIDATORS_JSONCONS_H
