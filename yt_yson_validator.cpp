#include "yt_yson_validator.h"

NYT::NTableClient::TLogicalTypePtr YtLogicalTypeFromTableSchema(const TypeBasePtr& type) {
    switch (type->GetType()) {
        case ValueType::Int: {
            return NYT::NTableClient::SimpleLogicalType(NYT::NTableClient::ESimpleLogicalValueType::Int64);
        }
        case ValueType::String: {
            return NYT::NTableClient::SimpleLogicalType(NYT::NTableClient::ESimpleLogicalValueType::String);
        }
        case ValueType::Optional: {
            return NYT::NTableClient::OptionalLogicalType(YtLogicalTypeFromTableSchema(type->Child()));
        }
        case ValueType::List: {
            return NYT::NTableClient::ListLogicalType(YtLogicalTypeFromTableSchema(type->Child()));
        }
        case ValueType::Tuple: {
            std::vector<NYT::NTableClient::TLogicalTypePtr> children;
            for (const auto& child : type->Children()) {
                children.emplace_back(YtLogicalTypeFromTableSchema(child->Schema));
            }
            return NYT::NTableClient::TupleLogicalType(std::move(children));
        }
        case ValueType::Object: {
            assert(0);
        }
    }
}
