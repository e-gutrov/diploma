#include "validators_jsoncons.h"

#include <jsoncons/basic_json.hpp>
#include <jsoncons/json_cursor.hpp>

using namespace jsoncons;

namespace {
jsoncons::json generateTypeJson(const std::string& type) {
    jsoncons::json result;
    result["type"] = type;
    return result;
}
} // namespace

jsoncons::json GenerateJsonSchema(const TypeBasePtr& type) {
    auto metaType = type->GetType();
    switch (metaType) {
        case ValueType::Int: {
            return generateTypeJson("integer");
        }
        case ValueType::String: {
            return generateTypeJson("string");
        }
        case ValueType::Optional: {
            std::vector<jsoncons::json> types;
            types.push_back(generateTypeJson("null"));
            types.push_back(GenerateJsonSchema(type->Child()));
            jsoncons::json result;
            result["anyOf"] = types;
            return result;
        }
        case ValueType::List: {
            auto result = generateTypeJson("array");
            result["items"] = GenerateJsonSchema(type->Child());
            return result;
        }
        case ValueType::Tuple: {
            auto result = generateTypeJson("array");
            std::vector<jsoncons::json> items;
            for (const auto& child : type->Children()) {
                items.push_back(GenerateJsonSchema(child->Schema));
            }
            result["items"] = items;
            result["minItems"] = items.size();
            result["maxItems"] = items.size();
            return result;
        }
        case ValueType::Object: {
            auto result = generateTypeJson("object");
            std::vector<std::string> required;
            for (const auto& child : type->Children()) {
                result["properties"][child->Name] =
                    GenerateJsonSchema(child->Schema);
                if (!child->Optional) {
                    required.push_back(child->Name);
                }
            }
            result["required"] = required;
            result["additionalProperties"] = false;
            return result;
        }
        default:
            assert(0);
    }
}
