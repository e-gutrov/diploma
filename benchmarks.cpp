#include <ctime>

#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/TargetSelect.h>

#include <nanobench/nanobench.h>

#include <util/stream/mem.h>

#include "table_schema.h"
#include "json_validators_llvm.h"
#include "yson_validators_llvm.h"
#include "validators_jsoncons.h"
#include "helpers.h"
#include "rapidjson/document.h"
#include "rapidjson/schema.h"
#include "jsoncons_cursor_validator.h"
#include "yson_cursor_validator.h"

// TODO: think about refactoring

void benchJsonconsValidation(const std::string& schemaName, const std::string& data, const jsoncons::json& jsonSchema) {
    auto schema = jsoncons::jsonschema::make_schema(jsonSchema);
    jsoncons::jsonschema::json_validator<jsoncons::json> validator(schema);
    int res = 0;
    auto jsonObj = jsoncons::json::parse(data);
    ankerl::nanobench::Bench().run("jsoncons " + schemaName, [&] () {
        res += validator.is_valid(jsonObj);
    });
}

void benchJsonconsCursorValidation(const std::string& schemaName, const std::string& data, const TypeBasePtr& type) {
    auto validator = CreateJsonconsCursorValidator(type);
    int res = 0;
    ankerl::nanobench::Bench().run("poly jsoncons " + schemaName, [&] () {
        jsoncons::json_cursor cursor(data);
        res += validator->Validate(&cursor);
    });
}

void benchRapidJsonValidation(const std::string& schemaName, const std::string& data, const std::string& schemaStr) {
    rapidjson::Document d;
    d.Parse(schemaStr.c_str());
    rapidjson::SchemaDocument sd(d);
    int res = 0;
    rapidjson::SchemaValidator validator(sd);
    ankerl::nanobench::Bench().run("RapidJSON " + schemaName, [&] () {
        rapidjson::Reader reader;
        rapidjson::MemoryStream is(data.c_str(), data.size());
        if (!reader.Parse(is, validator) && reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
            throw std::exception();
        }
        res += validator.IsValid();
        validator.Reset();
    });
}

void benchJsonLlvmValidation(const std::string& schemaName, const std::string& data, const TypeBasePtr& type) {
    auto jit = PrepareJit(PrepareJitFor::Json, false);
    if (auto err = jit->addIRModule(JsonValidators::CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool(*)(void*)>(sym.get().getValue());
        ankerl::nanobench::Bench().run("JSON LLVM " + schemaName, [&] () {
            jsoncons::json_cursor cursor(data);
            func(&cursor);
        });
    }
}

void benchYsonValidation(const std::string& schemaName, const std::string& data, const TypeBasePtr& type, const std::string& format) {
    auto validator = YsonValidators::CreatePolymorphicValidator(type);
    ankerl::nanobench::Bench().run("YSON polymorphic " + schemaName, [&] () {
        TMemoryInput memoryInput(data);
        NYT::NYson::TYsonPullParser parser(&memoryInput, NYT::NYson::EYsonType::Node);
        NYT::NYson::TYsonPullParserCursor cursor(&parser);
        validator->Validate(&cursor);
    });
}

void benchYsonLlvmValidation(const std::string& schemaName, const std::string& data, const TypeBasePtr& type, const std::string& format) {
    auto jit = PrepareJit(PrepareJitFor::Yson, false);
    if (auto err = jit->addIRModule(YsonValidators::CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool(*)(void*)>(sym.get().getValue());
        ankerl::nanobench::Bench().run("YSON LLVM " + schemaName, [&] () {
            TMemoryInput memoryInput(data);
            NYT::NYson::TYsonPullParser parser(&memoryInput, NYT::NYson::EYsonType::Node);
            NYT::NYson::TYsonPullParserCursor cursor(&parser);
            func(&cursor);
        });
    }
}

void runAllBenchmarks(
        const std::string& schemaName,
        const std::vector<std::pair<std::string, std::string>>& inputs,
        const TypeBasePtr& schema) {
    auto jsonSchema = GenerateJsonSchema(schema);

    for (const auto& [name, data] : inputs) {
        auto caseName = schemaName + ";" + name;
        benchJsonconsValidation(caseName, data, jsonSchema);
        benchJsonconsCursorValidation(caseName, data, schema);
        benchRapidJsonValidation(caseName, data, jsonSchema.to_string());
        benchJsonLlvmValidation(caseName, data, schema);
        auto ysonBinary = ConvertJsonToYson(data, NYT::NYson::EYsonFormat::Binary);
        benchYsonValidation(caseName, ysonBinary, schema, "binary");
//        benchYsonValidation(caseName, yson, schema, iterations, "text");
        benchYsonLlvmValidation(caseName, ysonBinary, schema, "binary");
    }
}

std::string createListOfTokens(int elems, const std::string& token) {
    std::string result = "[";
    for (int i = 0; i < elems; ++i) {
        if (i > 0) {
            result += ", ";
        }
        result += token;
    }
    result += "]";
    return result;
}

std::string createListOfAlternatingTokens(int elems, const std::string& tokenEven, const std::string& tokenOdd) {
    std::string result = "[";
    for (int i = 0; i < elems; ++i) {
        if (i > 0) {
            result += ", ";
        }
        result += (i % 2 == 0 ? tokenEven : tokenOdd);
    }
    result += "]";
    return result;
}

void benchListOfInts(int elems) {
    auto schema = CreateList(CreateSimple(ValueType::Int));
    std::vector<std::pair<std::string, std::string>> data{{"Basic", jsoncons::json(std::vector<int>(elems)).to_string()}};
    runAllBenchmarks("List of ints", data, schema);
}

void benchListOfOptionalInts(int elems) {
    auto schema = CreateList(CreateOptional(CreateSimple(ValueType::Int)));
    std::vector<std::pair<std::string, std::string>> data{
        {"All nulls", createListOfTokens(elems, "null")},
        {"Every other null", createListOfAlternatingTokens(elems, "null", "123")},
        {"All ints", createListOfTokens(elems, "123")},
    };
    runAllBenchmarks("List of optional ints", data, schema);
}

void benchListOf5xOptionalInts(int elems) {
    auto schema = CreateList(
            CreateOptional(CreateOptional(CreateOptional(CreateOptional(CreateOptional(
                    CreateSimple(ValueType::Int)))))));
    std::vector<std::pair<std::string, std::string>> data{
        {"All nulls", createListOfTokens(elems, "null")},
        {"Every other null", createListOfAlternatingTokens(elems, "null", "123")},
        {"All ints", createListOfTokens(elems, "123")},
    };
    runAllBenchmarks("List of optional x5 ints", data, schema);
}

void benchListOfStrings(int elems) {
    auto schema = CreateList(CreateSimple(ValueType::String));
    std::vector<std::pair<std::string, std::string>> data{
        {"Basic", createListOfTokens(elems, "\"abracadabra\"")},
    };
    runAllBenchmarks("List of strings", data, schema);
}

void benchListOfOptionalStrings(int elems) {
    auto schema = CreateList(CreateOptional(CreateSimple(ValueType::String)));
    std::vector<std::pair<std::string, std::string>> data{
            {"All nulls", createListOfTokens(elems, "null")},
            {"Every other null", createListOfAlternatingTokens(elems, "null", "\"abracadabra\"")},
            {"All strings", createListOfTokens(elems, "\"abracadabra\"")},
    };
    runAllBenchmarks("List of optional strings", data, schema);
}

void benchListOfListOfOptionalListOfInts(int elems) {
    auto schema = CreateList(CreateList(CreateOptional(CreateList(CreateSimple(ValueType::Int)))));
    std::vector<std::pair<std::string, std::string>> data{
        {"Basic", createListOfAlternatingTokens(elems, "[[1, 2, 3], [], null]", "[[]]")},
    };
    runAllBenchmarks("List of list of list of ints", data, schema);
}

void benchListOfTuplesOfStringIntAndOptionalListOfOptionalStrings(int elems) {
    auto schema = CreateList(CreateTuple({
         CreateSimple(ValueType::String),
         CreateSimple(ValueType::Int),
         CreateOptional(CreateList(CreateOptional(CreateSimple(ValueType::String))))}));
    std::vector<std::pair<std::string, std::string>> data{
            {"Basic", createListOfAlternatingTokens(
                    elems,
                    R"(["abra", 12, ["cadabra", "second"]])",
                    R"(["abra", 12, [null, "second"]])")}};
    runAllBenchmarks("List of tuples of string, int, and optional list of optional strings", data, schema);
}

int main() {
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    benchListOfInts(40);
    benchListOfOptionalInts(40);
    benchListOfStrings(40);
    benchListOfOptionalStrings(40);

    benchListOf5xOptionalInts(40);
    benchListOfListOfOptionalListOfInts(40);
    benchListOfTuplesOfStringIntAndOptionalListOfOptionalStrings(40);
    return 0;
}
