#include "benchmark_helpers.h"
#include "helpers.h"
#include "json_validators_llvm.h"
#include "jsoncons_cursor_validator.h"
#include "table_schema.h"
#include "validators_jsoncons.h"
#include "yson_cursor_validator.h"
#include "yson_validators_llvm.h"

#include <ctime>
#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>
#include <nanobench/src/include/nanobench.h>
#include <rapidjson/document.h>
#include <rapidjson/schema.h>
#include <util/stream/mem.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/TargetSelect.h>

// TODO: think about refactoring

const int BATCH_SIZE = 100'000;

void benchJsonconsValidation(
    const std::string& schemaName,
    const std::string& data,
    const jsoncons::json& jsonSchema) {
    auto schema = jsoncons::jsonschema::make_schema(jsonSchema);
    jsoncons::jsonschema::json_validator<jsoncons::json> validator(schema);
    int res = 0;
    auto jsonObj = jsoncons::json::parse(data);
    ankerl::nanobench::Bench().run("jsoncons " + schemaName, [&]() {
        res += validator.is_valid(jsonObj);
    });
    if (res == 0) {
        assert(0);
    }
}

void benchJsonconsCursorValidation(
    const std::string& schemaName,
    const std::string& data,
    const TypeBasePtr& type) {
    auto validator = CreateJsonconsCursorValidator(type);
    int res = 0;
    ankerl::nanobench::Bench().minEpochIterations(40000).epochs(10).run(
        "poly jsoncons " + schemaName, [&]() {
            jsoncons::json_cursor cursor(data);
            res += validator->Validate(&cursor);
        });
    if (res == 0) {
        assert(0);
    }
}

void benchRapidJsonValidation(
    const std::string& schemaName,
    const std::string& data,
    const std::string& schemaStr) {
    rapidjson::Document d;
    d.Parse(schemaStr.c_str());
    rapidjson::SchemaDocument sd(d);
    int res = 0;
    rapidjson::SchemaValidator validator(sd);
    ankerl::nanobench::Bench().run("RapidJSON " + schemaName, [&]() {
        rapidjson::Reader reader;
        rapidjson::MemoryStream is(data.c_str(), data.size());
        if (!reader.Parse(is, validator) &&
            reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
            throw std::exception();
        }
        res += validator.IsValid();
        validator.Reset();
    });
    if (res == 0) {
        assert(0);
    }
}

void benchJsonLlvmValidation(
    const std::string& schemaName,
    const std::string& data,
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
        int res = 0;
        auto func = reinterpret_cast<bool (*)(void*)>(sym.get().getValue());
        ankerl::nanobench::Bench().minEpochIterations(40000).epochs(10).run(
            "JSON LLVM " + schemaName, [&]() {
                jsoncons::json_cursor cursor(data);
                res += func(&cursor);
            });
        if (res == 0) {
            assert(0);
        }
    }
}

void benchYsonValidation(
    const std::string& schemaName,
    const std::vector<std::string>& data,
    const TypeBasePtr& type,
    const std::string& format) {
    auto validator = YsonValidators::CreatePolymorphicValidator(type);
    int res = 0;
    ankerl::nanobench::Bench().run("YSON polymorphic " + schemaName, [&]() {
        for (const auto& row : data) {
            TMemoryInput memoryInput(row);
            NYT::NYson::TYsonPullParser parser(
                &memoryInput, NYT::NYson::EYsonType::Node);
            NYT::NYson::TYsonPullParserCursor cursor(&parser);
            res += validator->Validate(&cursor);
        }
    });
    if (res == 0) {
        assert(0);
    }
}

void benchYsonLlvmValidation(
    const std::string& schemaName,
    const std::vector<std::string>& data,
    const TypeBasePtr& type,
    const std::string& format) {
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
        int res = 0;
        ankerl::nanobench::Bench().run("YSON LLVM " + schemaName, [&]() {
            for (const auto& row : data) {
                TMemoryInput memoryInput(row);
                NYT::NYson::TYsonPullParser parser(
                    &memoryInput, NYT::NYson::EYsonType::Node);
                NYT::NYson::TYsonPullParserCursor cursor(&parser);
                res += func(&cursor);
            }
        });
        if (res == 0) {
            assert(0);
        }
    }
}

void runAllBenchmarks(
    const std::string& schemaName,
    const std::vector<std::pair<std::string, std::vector<std::string>>>& inputs,
    const TypeBasePtr& schema) {
    auto jsonSchema = GenerateJsonSchema(schema);

    for (const auto& [name, data] : inputs) {
        auto caseName = schemaName + ";" + name;
        //        benchJsonconsValidation(caseName, data, jsonSchema);
        //        benchJsonconsCursorValidation(caseName, data, schema);
        //        benchRapidJsonValidation(caseName, data,
        //        jsonSchema.to_string()); benchJsonLlvmValidation(caseName,
        //        data, schema);
        std::vector<std::string> ysonBinaryData;
        for (const auto& json : data) {
            ysonBinaryData.emplace_back(
                ConvertJsonToYson(json, NYT::NYson::EYsonFormat::Binary));
        }
        benchYsonValidation(caseName, ysonBinaryData, schema, "binary");
        //        benchYsonValidation(caseName, yson, schema, iterations,
        //        "text");
        benchYsonLlvmValidation(caseName, ysonBinaryData, schema, "binary");
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

std::string createListOfAlternatingTokens(
    int elems, const std::string& tokenEven, const std::string& tokenOdd) {
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
    GeneratorBase g;
    auto schema = CreateList(CreateSimple(ValueType::Int));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)}};
    runAllBenchmarks("List of ints", data, schema);
}

void benchListOfOptionalInts(int elems) {
    GeneratorBase g;
    ConstForOptionsGenerator alwaysNull(true);
    ConstForOptionsGenerator alwaysSome(false);
    auto schema = CreateList(CreateOptional(CreateSimple(ValueType::Int)));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"All nulls",
         GenerateObjectWithSchema(schema, &alwaysNull, BATCH_SIZE)},
        {"All ints", GenerateObjectWithSchema(schema, &alwaysSome, BATCH_SIZE)},
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks("List of optional ints", data, schema);
}

void benchListOf5xOptionalInts(int elems) {
    GeneratorBase g;
    ConstForOptionsGenerator alwaysNull(true);
    ConstForOptionsGenerator alwaysSome(false);
    auto schema = CreateList(CreateOptional(CreateOptional(CreateOptional(
        CreateOptional(CreateOptional(CreateSimple(ValueType::Int)))))));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"All nulls",
         GenerateObjectWithSchema(schema, &alwaysNull, BATCH_SIZE)},
        {"All ints", GenerateObjectWithSchema(schema, &alwaysSome, BATCH_SIZE)},
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks("List of optional x5 ints", data, schema);
}

void benchListOfStrings(int elems) {
    GeneratorBase g;
    auto schema = CreateList(CreateSimple(ValueType::String));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks("List of strings", data, schema);
}

void benchListOfOptionalStrings(int elems) {
    GeneratorBase g;
    ConstForOptionsGenerator alwaysNull(true);
    ConstForOptionsGenerator alwaysSome(false);
    auto schema = CreateList(CreateOptional(CreateSimple(ValueType::String)));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"All nulls",
         GenerateObjectWithSchema(schema, &alwaysNull, BATCH_SIZE)},
        {"All strings",
         GenerateObjectWithSchema(schema, &alwaysSome, BATCH_SIZE)},
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks("List of optional strings", data, schema);
}

void benchListOfListOfOptionalListOfInts(int elems) {
    GeneratorBase g;
    auto schema = CreateList(
        CreateList(CreateOptional(CreateList(CreateSimple(ValueType::Int)))));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"Basic",
         {createListOfAlternatingTokens(
             elems, "[[1, 2, 3], [], null]", "[[]]")}},
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks("List of list of list of ints", data, schema);
}

void benchListOfTuplesOfStringIntAndOptionalListOfOptionalStrings(int elems) {
    GeneratorBase g;
    auto schema = CreateList(CreateTuple(
        {CreateSimple(ValueType::String),
         CreateSimple(ValueType::Int),
         CreateOptional(
             CreateList(CreateOptional(CreateSimple(ValueType::String))))}));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks(
        "List of tuples of string, int, and optional list of optional strings",
        data,
        schema);
}

void benchListOfTuples2() {
    GeneratorBase g;

    auto intType = CreateSimple(ValueType::Int);
    auto stringType = CreateSimple(ValueType::String);
    auto schema = CreateList(CreateTuple(
        {CreateTuple({stringType, intType}),
         CreateTuple({intType, stringType, CreateOptional(intType)}),
         CreateTuple({intType, CreateTuple({stringType, intType}), intType})}));
    std::vector<std::pair<std::string, std::vector<std::string>>> data{
        {"Random", GenerateObjectWithSchema(schema, &g, BATCH_SIZE)},
    };
    runAllBenchmarks(
        "list<tuple<tuple<string, int>, tuple<int, string, optional<int>>>, "
        "tuple<int, tuple<string, int>, int>>",
        data,
        schema);
}

int SomeFunc(int x) {
    return x + 5;
}

int main() {
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    ankerl::nanobench::Bench().run("SomeFunc", [&]() {
        ankerl::nanobench::doNotOptimizeAway(SomeFunc(5));
    });

    benchListOfInts(40);
//    benchListOfOptionalInts(40);
//    benchListOfStrings(40);
//    benchListOfOptionalStrings(40);
//
//    benchListOf5xOptionalInts(40);
//    benchListOfListOfOptionalListOfInts(40);
//    benchListOfTuplesOfStringIntAndOptionalListOfOptionalStrings(40);
//    benchListOfTuples2();
    return 0;
}
