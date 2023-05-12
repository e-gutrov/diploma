#ifndef COURSEWORK_YSON_CURSOR_VALIDATOR_H
#define COURSEWORK_YSON_CURSOR_VALIDATOR_H

#include <yt/yt/core/yson/pull_parser.h>

#include "table_schema.h"

namespace YsonValidators {
    class PolymorphicValidator {
    public:
        virtual bool Validate(NYT::NYson::TYsonPullParserCursor *) = 0;

        virtual ~PolymorphicValidator() = default;
    };

    std::unique_ptr<PolymorphicValidator> CreatePolymorphicValidator(const TypeBasePtr &schema, int depth = 0);
}

#endif //COURSEWORK_YSON_CURSOR_VALIDATOR_H
