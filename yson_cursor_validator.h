#ifndef COURSEWORK_YSON_CURSOR_VALIDATOR_H
#define COURSEWORK_YSON_CURSOR_VALIDATOR_H

#include <yt/yt/core/yson/pull_parser.h>

#include "table_schema.h"

class YsonCursorValidator {
public:
    virtual bool Validate(NYT::NYson::TYsonPullParserCursor*) = 0;
    virtual ~YsonCursorValidator() = default;
};

std::unique_ptr<YsonCursorValidator> CreateYsonCursorValidator(const TypeBasePtr& schema, int depth = 0);

#endif //COURSEWORK_YSON_CURSOR_VALIDATOR_H
