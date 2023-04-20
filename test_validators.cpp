//
// Created by egor on 20/04/23.
//
#include <catch2/catch_test_macros.hpp>

#include "table_schema.h"
#include "validators.h"

TEST_CASE("Test int schema") {
    auto intSchema = GenerateJsonSchema(CreateSimple(ValueType::Int));
    auto expected = jsoncons::json::parse(R"({"type": "integer"})");
    REQUIRE(intSchema == expected);
}

TEST_CASE("Test list schema") {
    auto listOfInts = GenerateJsonSchema(CreateList(CreateSimple(ValueType::Int)));
    auto expected = jsoncons::json::parse(R"(
    {
        "type": "array",
        "items": {"type": "integer"}
    })");
    REQUIRE(listOfInts == expected);
}

TEST_CASE("Test object with optional and required fields") {
    auto fields = std::vector{
        MakeStructField("name", CreateSimple(ValueType::String), false),
        MakeStructField("age", CreateSimple(ValueType::Int), true),
    };
    auto obj = CreateObject(std::move(fields));
    auto objectSchema = GenerateJsonSchema(obj);
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
    REQUIRE(objectSchema == expected);
}

TEST_CASE("Test list of optionals") {
    auto listType = CreateList(CreateOptional(CreateSimple(ValueType::Int)));
    auto listSchema = GenerateJsonSchema(listType);
    auto expected = jsoncons::json::parse(R"(
    {
        "type": "array",
        "items": {
            "anyOf": [{"type": "null"}, {"type": "integer"}]
        }
    })");
    REQUIRE(listSchema == expected);
}
