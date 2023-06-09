#include "helpers.h"
#include "json_validators_llvm.h"
#include "jsoncons_cursor_validator.h"
#include "table_schema.h"
#include "validators_jsoncons.h"
#include "yson_cursor_validator.h"
#include "yson_validators_llvm.h"
#include "yt_yson_validator.h"

#include <Catch2/extras/catch_amalgamated.hpp>
#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>
#include <rapidjson/document.h>
#include <rapidjson/schema.h>
#include <util/stream/mem.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/TargetSelect.h>

// TODO: check&refactor contents

void testJsonconsValidation(
    const std::vector<std::pair<std::string, bool>>& tests,
    const jsoncons::json& jsonSchema) {
    auto schema = jsoncons::jsonschema::make_schema(jsonSchema);
    jsoncons::jsonschema::json_validator<jsoncons::json> validator(schema);
    for (const auto& [json, expected] : tests) {
        INFO("JSON is: " << json);
        auto validationResult = validator.is_valid(jsoncons::json::parse(json));
        CHECK(validationResult == expected);
    }
}

void testJsonconsCursorValidation(
    const std::vector<std::pair<std::string, bool>>& tests,
    const TypeBasePtr& type) {
    auto validator = CreateJsonconsCursorValidator(type);
    for (const auto& [json, expected] : tests) {
        INFO("JSON is: " << json);
        jsoncons::json_cursor cursor(json);
        auto validationResult = validator->Validate(&cursor);
        CHECK(validationResult == expected);
    }
}

void testRapidJsonValidation(
    const std::vector<std::pair<std::string, bool>>& tests,
    const std::string& schemaStr) {
    rapidjson::Document d;
    d.Parse(schemaStr.c_str());
    rapidjson::SchemaDocument sd(d);
    for (const auto& [json, expected] : tests) {
        INFO("JSON is: " << json);
        rapidjson::SchemaValidator validator(sd);
        rapidjson::Reader reader;
        rapidjson::MemoryStream is(json.c_str(), json.size());
        if (!reader.Parse(is, validator) &&
            reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
            throw std::exception();
        }
        CHECK(validator.IsValid() == expected);
    }
}

void testJsonLlvmValidation(
    const std::vector<std::pair<std::string, bool>>& tests,
    const TypeBasePtr& type) {
    auto jit = PrepareJit(PrepareJitFor::Json, false);
    if (auto err = jit->addIRModule(
            JsonValidators::CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool (*)(void*)>(sym.get().getValue());
        for (const auto& [json, expected] : tests) {
            INFO("JSON is: " << json);
            jsoncons::json_cursor cursor(json);
            CHECK(func(&cursor) == expected);
        }
    }
}

void testYsonCursorValidation(
    const std::vector<std::pair<std::string, bool>>& tests,
    const TypeBasePtr& type) {
    auto validator = YsonValidators::CreatePolymorphicValidator(type);
    for (const auto& [json, expected] : tests) {
        auto yson = ConvertJsonToYson(json);
        INFO("YSON is: " << yson);
        TMemoryInput memoryInput(yson);
        NYT::NYson::TYsonPullParser parser(
            &memoryInput, NYT::NYson::EYsonType::Node);
        NYT::NYson::TYsonPullParserCursor cursor(&parser);
        auto validationResult = validator->Validate(&cursor);
        CHECK(validationResult == expected);
    }
}

void testYsonLlvmValidation(
    const std::vector<std::pair<std::string, bool>>& tests,
    const TypeBasePtr& type) {
    auto jit = PrepareJit(PrepareJitFor::Yson, false);
    if (auto err = jit->addIRModule(
            YsonValidators::CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool (*)(void*)>(sym.get().getValue());
        for (const auto& [json, expected] : tests) {
            auto yson = ConvertJsonToYson(json);
            INFO("YSON is: " << yson);
            TMemoryInput memoryInput(yson);
            NYT::NYson::TYsonPullParser parser(
                &memoryInput, NYT::NYson::EYsonType::Node);
            NYT::NYson::TYsonPullParserCursor cursor(&parser);
            CHECK(func(&cursor) == expected);
        }
    }
}

void testYtYsonValidators(const std::vector<std::pair<std::string, bool>>& tests,
                          const TypeBasePtr& type) {
    auto ytType = YtLogicalTypeFromTableSchema(type);
    for (const auto& [json, expected] : tests) {
        auto yson = ConvertJsonToYson(json);
        INFO("YSON is: " << yson);
        auto validationResult = true;
        try {
            NYT::NTableClient::ValidateComplexLogicalType(yson, ytType);
        } catch (const std::exception& e) {
            validationResult = false;
        }
        CHECK(validationResult == expected);
    }
}

// TODO: move to another file

TEST_CASE("Test JSON to YSON text conversion") {
    auto format = NYT::NYson::EYsonFormat::Text;
    SECTION("Test list of optional ints") {
        auto json = "[1, null, null, 4]";
        auto yson = ConvertJsonToYson(json, format);
        auto expected = "[1;#;#;4]";
        REQUIRE(yson == expected);
    }

    SECTION("Test map from string to int") {
        auto json = R"({"name": "Ivan", "surname": "Kekov"})";
        auto yson = ConvertJsonToYson(json, format);
        auto expected = R"({"name"="Ivan";"surname"="Kekov"})";
        REQUIRE(yson == expected);
    }
}

TEST_CASE("Test JSON to YSON binary conversion") {
    auto format = NYT::NYson::EYsonFormat::Binary;
    SECTION("Test list of optional ints") {
        auto json = "[1, null, null, 4]";
        auto yson = ConvertJsonToYson(json, format);
        auto expected = "[\x02\x02;#;#;\x02\x08]";
        REQUIRE(yson == expected);
    }

    SECTION("Test map from string to int") {
        auto json = R"({"name": "Ivan", "surname": "Kekov"})";
        auto yson = ConvertJsonToYson(json, format);
        auto expected =
            "{\x01\x08name=\x01\x08Ivan;\x01\x0esurname=\x01\x0aKekov}";
        REQUIRE(yson == expected);
    }
}

TEST_CASE("Test int") {
    auto type = CreateSimple(ValueType::Int);
    auto jsonSchema = GenerateJsonSchema(type);

    SECTION("Test JSON Schema generation") {
        auto expected = jsoncons::json::parse(R"({"type": "integer"})");
        REQUIRE(jsonSchema == expected);
    }

    auto tests = std::vector<std::pair<std::string, bool>>{
        {"0", true},
        {"5", true},
        {"5.1", false},
        {"null", false},
        {R"("abracadabra")", false},
        {"[]", false},
        {"[1]", false},
        {"[null]", false},
        {"[null, 1, 2, null, 4]", false},
        {"[5.1]", false},
        {R"(["1"])", false},
        {"{}", false},
        {R"({"x": 1})", false},
    };

    SECTION("Test jsoncons schema validation") {
        testJsonconsValidation(tests, jsonSchema);
    }

    SECTION("Test jsoncons cursor validator") {
        testJsonconsCursorValidation(tests, type);
    }

    SECTION("Test rapidjson schema validation") {
        testRapidJsonValidation(tests, jsonSchema.to_string());
    }

    SECTION("Test JSON LLVM validation") {
        testJsonLlvmValidation(tests, type);
    }

    SECTION("Test YSON cursor validator") {
        testYsonCursorValidation(tests, type);
    }

    SECTION("Test YSON LLVM validation") {
        testYsonLlvmValidation(tests, type);
    }

    SECTION("Test YT YSON validation") {
        testYtYsonValidators(tests, type);
    }
}

TEST_CASE("Test optional int") {
    auto type = CreateOptional(CreateSimple(ValueType::Int));
    auto jsonSchema = GenerateJsonSchema(type);

    SECTION("Test JSON Schema generation") {
        auto expected = jsoncons::json::parse(
            R"({"anyOf": [{"type": "null"}, {"type": "integer"}]})");
        REQUIRE(jsonSchema == expected);
    }

    auto tests = std::vector<std::pair<std::string, bool>>{
        {"0", true},
        {"5", true},
        {"5.1", false},
        {"null", true},
        {R"("abracadabra")", false},
        {"[]", false},
        {"[1]", false},
        {"[null]", false},
        {"[null, 1, 2, null, 4]", false},
        {"[5.1]", false},
        {R"(["1"])", false},
        {"{}", false},
        {R"({"x": 1})", false},
    };

    SECTION("Test jsoncons schema validation") {
        testJsonconsValidation(tests, jsonSchema);
    }

    SECTION("Test jsoncons cursor validator") {
        testJsonconsCursorValidation(tests, type);
    }

    SECTION("Test rapidjson schema validation") {
        testRapidJsonValidation(tests, jsonSchema.to_string());
    }

    SECTION("Test JSON LLVM validation") {
        testJsonLlvmValidation(tests, type);
    }

    SECTION("Test YSON cursor validator") {
        testYsonCursorValidation(tests, type);
    }

    SECTION("Test YSON LLVM validation") {
        testYsonLlvmValidation(tests, type);
    }

    SECTION("Test YT YSON validation") {
        testYtYsonValidators(tests, type);
    }
}

TEST_CASE("Test list") {
    auto type = CreateList(CreateSimple(ValueType::Int));
    auto jsonSchema = GenerateJsonSchema(type);

    SECTION("Test JSON Schema generation") {
        auto expected = jsoncons::json::parse(R"(
        {
            "type": "array",
            "items": {"type": "integer"}
        })");
        REQUIRE(jsonSchema == expected);
    }

    auto tests = std::vector<std::pair<std::string, bool>>{
        {"0", false},
        {"5", false},
        {"5.1", false},
        {R"("abracadabra")", false},
        {"[]", true},
        {"[1]", true},
        {"[null]", false},
        {"[null, 1, 2, null, 4]", false},
        {"[5.1]", false},
        {R"(["1"])", false},
        {"{}", false},
        {R"({"x": 1})", false},
    };

    SECTION("Test jsoncons schema validation") {
        testJsonconsValidation(tests, jsonSchema);
    }

    SECTION("Test jsoncons cursor validator") {
        testJsonconsCursorValidation(tests, type);
    }

    SECTION("Test rapidjson schema validation") {
        testRapidJsonValidation(tests, jsonSchema.to_string());
    }

    SECTION("Test JSON LLVM validation") {
        testJsonLlvmValidation(tests, type);
    }

    SECTION("Test YSON cursor validator") {
        testYsonCursorValidation(tests, type);
    }

    SECTION("Test YSON LLVM validation") {
        testYsonLlvmValidation(tests, type);
    }

    SECTION("Test YT YSON validation") {
        testYtYsonValidators(tests, type);
    }
}

TEST_CASE("Test object with optional string and required int fields") {
    auto type = CreateObject({
        MakeStructField("name", CreateSimple(ValueType::String), false),
        MakeStructField("age", CreateSimple(ValueType::Int), true),
    });
    auto jsonSchema = GenerateJsonSchema(type);

    SECTION("Test JSON Schema generation") {
        auto expected = jsoncons::json::parse(R"(
        {
            "type": "object",
            "properties": {
                "age": {"type": "integer"},
                "name": {"type": "string"}
            },
            "required": ["name"],
            "additionalProperties": false
        })");
        REQUIRE(jsonSchema == expected);
    }

    auto tests = std::vector<std::pair<std::string, bool>>{
        {"0", false},
        {"5", false},
        {"5.1", false},
        {R"("abracadabra")", false},
        {"[]", false},
        {"[1]", false},
        {"[null]", false},
        {"[null, 1, 2, null, 4]", false},
        {"[5.1]", false},
        {R"(["1"])", false},
        {"{}", false},
        {R"({"x": 1})", false},

        {R"({"name": "Ivan"})", true},
        {R"({"name": "Ivan", "age": 20})", true},
        {R"({"age": 20})", false},
        {R"({"name": []})", false},
        {R"({"name": "Ivan", "age": 5.1})", false},
        {R"({"name": "Ivan", "otherField": 20})", false},
    };

    SECTION("Test jsoncons schema validation") {
        testJsonconsValidation(tests, jsonSchema);
    }

    SECTION("Test jsoncons cursor validator") {
        //        testJsonconsCursorValidation(tests, type);
    }

    SECTION("Test rapidjson schema validation") {
        testRapidJsonValidation(tests, jsonSchema.to_string());
    }

    SECTION("Test JSON LLVM validation") {
        //        testJsonLlvmValidation(tests, type);
    }

    SECTION("Test YSON cursor validator") {
        //        testYsonCursorValidation(tests, type);
    }

    SECTION("Test YSON LLVM validation") {
        //        testYsonLlvmValidation(tests, type);
    }

    SECTION("Test YT YSON validation") {
//        testYtYsonValidators(tests, type);
    }
}

TEST_CASE("Test list of optional ints") {
    auto type = CreateList(CreateOptional(CreateSimple(ValueType::Int)));
    auto jsonSchema = GenerateJsonSchema(type);

    SECTION("Test JSON Schema generation") {
        auto expected = jsoncons::json::parse(R"(
        {
            "type": "array",
            "items": {
                "anyOf": [{"type": "null"}, {"type": "integer"}]
            }
        })");
        REQUIRE(jsonSchema == expected);
    }

    auto tests = std::vector<std::pair<std::string, bool>>{
        {"0", false},
        {"5", false},
        {"5.1", false},
        {R"("abracadabra")", false},
        {"[]", true},
        {"[1]", true},
        {"[null]", true},
        {"[null, 1, 2, null, 4]", true},
        {"[5.1]", false},
        {R"(["1"])", false},
        {"{}", false},
    };

    SECTION("Test jsoncons schema validation") {
        testJsonconsValidation(tests, jsonSchema);
    }

    SECTION("Test jsoncons cursor validator") {
        testJsonconsCursorValidation(tests, type);
    }

    SECTION("Test rapidjson schema validation") {
        testRapidJsonValidation(tests, jsonSchema.to_string());
    }

    SECTION("Test JSON LLVM validation") {
        testJsonLlvmValidation(tests, type);
    }

    SECTION("Test YSON cursor validator") {
        testYsonCursorValidation(tests, type);
    }

    SECTION("Test YSON LLVM validation") {
        testYsonLlvmValidation(tests, type);
    }

    SECTION("Test YT YSON validation") {
        testYtYsonValidators(tests, type);
    }
}

TEST_CASE("Test tuple of string, int, and list of optional strings") {
    auto type = CreateTuple(
        {CreateSimple(ValueType::String),
         CreateSimple(ValueType::Int),
         CreateList(CreateOptional(CreateSimple(ValueType::String)))});
    auto jsonSchema = GenerateJsonSchema(type);

    SECTION("Test JSON Schema generation") {
        auto expected = jsoncons::json::parse(R"(
        {
            "items": [
                {"type":"string"},
                {"type":"integer"},
                {"items":{"anyOf":[{"type":"null"},{"type":"string"}]}, "type":"array"}],
            "maxItems":3,
            "minItems":3,
            "type":"array"
        })");
        REQUIRE(jsonSchema == expected);
    }

    auto tests = std::vector<std::pair<std::string, bool>>{
        {R"(["abra", 12, ["cadabra", "second"]])", true},
        {R"(["abra", 12, [null]])", true},
        {R"(["abra", 12, []])", true},
        {R"(["abra", 12, [], 100])", false},
        {R"(["abra", 12])", false},
        {R"(["abra"])", false},
        {R"([])", false},
        {R"(["abra", 12, "cadabra"])", false},
        {R"(["abra", 12, [["cadabra"]]])", false},
    };

    SECTION("Test jsoncons schema validation") {
        testJsonconsValidation(tests, jsonSchema);
    }

    SECTION("Test jsoncons cursor validator") {
        testJsonconsCursorValidation(tests, type);
    }

    SECTION("Test rapidjson schema validation") {
        testRapidJsonValidation(tests, jsonSchema.to_string());
    }

    SECTION("Test JSON LLVM validation") {
        testJsonLlvmValidation(tests, type);
    }

    SECTION("Test YSON cursor validator") {
        testYsonCursorValidation(tests, type);
    }

    SECTION("Test YSON LLVM validation") {
        testYsonLlvmValidation(tests, type);
    }

    SECTION("Test YT YSON validation") {
        testYtYsonValidators(tests, type);
    }
}

int main(int argc, char** argv) {
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    int result = Catch::Session().run(argc, argv);

    return result;
}
