#ifndef COURSEWORK_YT_YSON_VALIDATOR_H
#define COURSEWORK_YT_YSON_VALIDATOR_H

#include <yt/yt/client/table_client/validate_logical_type.h>

#include "table_schema.h"

NYT::NTableClient::TLogicalTypePtr YtLogicalTypeFromTableSchema(const TypeBasePtr& type);

#endif //COURSEWORK_YT_YSON_VALIDATOR_H
