//
// Created by egor on 16/04/23.
//

#include "validators.h"

#include <jsoncons/json_cursor.hpp>
#include <jsoncons/basic_json.hpp>

using namespace jsoncons;

void sayHello() {
    std::cout << "Hello LLVM!" << '\n';
}

jsoncons::json_cursor* toJsonCursor(void* ptr) {
    return reinterpret_cast<jsoncons::json_cursor*>(ptr);
}

void debugPrint(const std::string& funcName, json_cursor* cursor) {
    std::cerr << "debugPrint called, " << funcName << " " << cursor->current().event_type() << std::endl;
}

bool validateInt(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    debugPrint("validateInt", cursor);
    return true;
}

bool isDone(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    debugPrint("isDone", cursor);
    return cursor->done();
}

void callNext(void* ptr) {
    auto cursor = toJsonCursor(ptr);
    debugPrint("callNext", cursor);
    cursor->next();
}

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
