//
// Created by egor on 16/04/23.
//

#include "validators_jsoncons.h"

#include <jsoncons/json_cursor.hpp>
#include <jsoncons/basic_json.hpp>

using namespace jsoncons;

jsoncons::json generateTypeJson(const std::string& type) {
    jsoncons::json result;
    result["type"] = type;
    return result;
}

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
        case ValueType::Object: {
            auto result = generateTypeJson("object");
//            result["properties"] = jsoncons::json();
            std::vector<std::string> required;
            for (const auto& child : type->Children()) {
                result["properties"][child->Name] = GenerateJsonSchema(child->Schema);
                if (!child->Optional) {
                    required.push_back(child->Name);
                }
            }
            result["required"] = required;
            result["additionalProperties"] = false;
            return result;
        }
        default:
            assert(false);
    }
}
