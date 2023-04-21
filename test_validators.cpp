//
// Created by egor on 20/04/23.
//
#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>
#include <catch2/catch_test_macros.hpp>

#include "table_schema.h"
#include "validators.h"

void testJsonconsValidation(const std::vector<std::pair<std::string, bool>>& tests, const jsoncons::json& jsonSchema) {
    auto schema = jsoncons::jsonschema::make_schema(jsonSchema);
    jsoncons::jsonschema::json_validator<jsoncons::json> validator(schema);
    for (const auto& [json, expected] : tests) {
        INFO("JSON is: " << json);
        auto validationResult = validator.is_valid(jsoncons::json::parse(json));
        CHECK(validationResult == expected);
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

    SECTION("Test generated LLVM IR schema validation") {

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

    SECTION("Test generated LLVM IR schema validation") {

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

    SECTION("Test generated LLVM IR schema validation") {

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

    SECTION("Test generated LLVM IR schema validation") {

    }
}
