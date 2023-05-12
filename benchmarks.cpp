#include <chrono>

#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Support/TargetSelect.h>

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

class Timer {
public:
    Timer(const std::string& name = ""): Start_(std::chrono::high_resolution_clock::now()), Name_(name) {}

    double SecondsElapsed() const {
        auto now = std::chrono::high_resolution_clock::now();
        auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(now - Start_);
        return elapsed.count()  * 1e-9;
    }

    void PrintElapsed(const std::string& s) const {
        std::cout << s << ',' << SecondsElapsed() << std::endl;
    }

    ~Timer() {
        PrintElapsed(Name_);
    }

private:
    std::chrono::high_resolution_clock::time_point Start_;
    std::string Name_;
};

void benchJsonconsValidation(const std::string& data, const jsoncons::json& jsonSchema, int iterations) {
    auto schema = jsoncons::jsonschema::make_schema(jsonSchema);
    jsoncons::jsonschema::json_validator<jsoncons::json> validator(schema);
    Timer t("jsoncons");
    int res = 0;
    auto jsonObj = jsoncons::json::parse(data);
    for (int i = 0; i < iterations; ++i) {
        res += validator.is_valid(jsonObj);
    }
}

void benchJsonconsCursorValidation(const std::string& data, const TypeBasePtr& type, int iterations) {
    auto validator = CreateJsonconsCursorValidator(type);
    Timer t("poly jsoncons cursor");
    int res = 0;
    for (int i = 0; i < iterations; ++i) {
        jsoncons::json_cursor cursor(data);
        res += validator->Validate(&cursor);
    }
}

void benchRapidJsonValidation(const std::string& data, const std::string& schemaStr, int iterations) {
    rapidjson::Document d;
    d.Parse(schemaStr.c_str());
    rapidjson::SchemaDocument sd(d);
    Timer t("RapidJSON");
    int res = 0;
    rapidjson::SchemaValidator validator(sd);
    for (int i = 0; i < iterations; ++i) {
        rapidjson::Reader reader;
        rapidjson::MemoryStream is(data.c_str(), data.size());
        if (!reader.Parse(is, validator) && reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
            throw std::exception();
        }
        res += validator.IsValid();
        validator.Reset();
    }
}

void benchJsonLlvmValidation(const std::string& data, const TypeBasePtr& type, int iterations) {
    auto jit = PrepareJit(PrepareJitFor::Json, false);
    if (auto err = jit->addIRModule(JsonValidators::CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool(*)(void*)>(sym.get().getValue());
        int res = -1;
        {
            jsoncons::json_cursor cursor(data);
            res += func(&cursor);
        }
        Timer t("LLVM JSON");
        for (int i = 0; i < iterations; ++i) {
            jsoncons::json_cursor cursor(data);
            res += func(&cursor);
        }
        std::cerr << "LLVM JSON, res = " << res << std::endl;
    }
}

void benchYsonValidation(const std::string& data, const TypeBasePtr& type, int iterations, const std::string& format) {
    auto validator = YsonValidators::CreatePolymorphicValidator(type);
    Timer t("poly YSON cursor");
    int res = 0;
    for (int i = 0; i < iterations; ++i) {
        TMemoryInput memoryInput(data);
        NYT::NYson::TYsonPullParser parser(&memoryInput, NYT::NYson::EYsonType::Node);
        NYT::NYson::TYsonPullParserCursor cursor(&parser);
        res += validator->Validate(&cursor);
    }
}

void benchYsonLlvmValidation(const std::string& data, const TypeBasePtr& type, int iterations, const std::string& format) {
    auto jit = PrepareJit(PrepareJitFor::Yson, false);
    if (auto err = jit->addIRModule(YsonValidators::CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool(*)(void*)>(sym.get().getValue());
        int res = 0;
        Timer t("LLVM YSON");
        for (int i = 0; i < iterations; ++i) {
            TMemoryInput memoryInput(data);
            NYT::NYson::TYsonPullParser parser(&memoryInput, NYT::NYson::EYsonType::Node);
            NYT::NYson::TYsonPullParserCursor cursor(&parser);
            res += func(&cursor);
        }
    }
}

void runAllBenchmarks(
        const std::string& schemaName,
        const std::vector<std::pair<std::string, std::string>>& inputs,
        const TypeBasePtr& schema,
        int iterations) {
    auto jsonSchema = GenerateJsonSchema(schema);

    std::cout << schemaName << "\n=====================\n";
    for (const auto& [name, data] : inputs) {
        std::cout << name << "\n=====================\n";
//        benchJsonconsValidation(data, jsonSchema, iterations);
//        benchJsonconsCursorValidation(data, schema, iterations);
//        benchRapidJsonValidation(data, jsonSchema.to_string(), iterations);
//        benchJsonLlvmValidation(data, schema, iterations);
        auto ysonBinary = ConvertJsonToYson(data, NYT::NYson::EYsonFormat::Binary);
        benchYsonValidation(ysonBinary, schema, iterations, "binary");
//        benchYsonValidation(yson, schema, iterations, "text");
        benchYsonLlvmValidation(ysonBinary, schema, iterations, "binary");
        std::cout << "=====================\n";
    }
    std::cout << "\n\n";
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

void benchListOfInts(int elems, int iterations) {
    auto schema = CreateList(CreateSimple(ValueType::Int));
    std::vector<std::pair<std::string, std::string>> data{{"Basic", jsoncons::json(std::vector<int>(elems)).to_string()}};
    runAllBenchmarks("List of ints", data, schema, iterations);
}

void benchListOfOptionalInts(int elems, int iterations) {
    auto schema = CreateList(CreateOptional(CreateSimple(ValueType::Int)));
    std::vector<std::pair<std::string, std::string>> data{
        {"All nulls", createListOfTokens(elems, "null")},
        {"Every other null", createListOfAlternatingTokens(elems, "null", "123")},
        {"All ints", createListOfTokens(elems, "123")},
    };
    runAllBenchmarks("List of optional ints", data, schema, iterations);
}

void benchListOf5xOptionalInts(int elems, int iterations) {
    auto schema = CreateList(
            CreateOptional(CreateOptional(CreateOptional(CreateOptional(CreateOptional(
                    CreateSimple(ValueType::Int)))))));
    std::vector<std::pair<std::string, std::string>> data{
        {"All nulls", createListOfTokens(elems, "null")},
        {"Every other null", createListOfAlternatingTokens(elems, "null", "123")},
        {"All ints", createListOfTokens(elems, "123")},
    };
    runAllBenchmarks("List of optional x5 ints", data, schema, iterations);
}

void benchListOfStrings(int elems, int iterations) {
    auto schema = CreateList(CreateSimple(ValueType::String));
    std::vector<std::pair<std::string, std::string>> data{
        {"Basic", createListOfTokens(elems, "\"abracadabra\"")},
    };
    runAllBenchmarks("List of strings", data, schema, iterations);
}

void benchListOfOptionalStrings(int elems, int iterations) {
    auto schema = CreateList(CreateOptional(CreateSimple(ValueType::String)));
    std::vector<std::pair<std::string, std::string>> data{
            {"All nulls", createListOfTokens(elems, "null")},
            {"Every other null", createListOfAlternatingTokens(elems, "null", "\"abracadabra\"")},
            {"All strings", createListOfTokens(elems, "\"abracadabra\"")},
    };
    runAllBenchmarks("List of optional strings", data, schema, iterations);
}

void benchListOfListOfOptionalListOfInts(int elems, int iterations) {
    auto schema = CreateList(CreateList(CreateOptional(CreateList(CreateSimple(ValueType::Int)))));
    std::vector<std::pair<std::string, std::string>> data{
        {"Basic", createListOfAlternatingTokens(elems, "[[1, 2, 3], [], null]", "[[]]")},
    };
    runAllBenchmarks("List of list of list of ints", data, schema, iterations);
}

void benchListOfTuplesOfStringIntAndOptionalListOfOptionalStrings(int elems, int iterations) {
    auto schema = CreateList(CreateTuple({
         CreateSimple(ValueType::String),
         CreateSimple(ValueType::Int),
         CreateOptional(CreateList(CreateOptional(CreateSimple(ValueType::String))))}));
    std::vector<std::pair<std::string, std::string>> data{
            {"Basic", createListOfAlternatingTokens(
                    elems,
                    R"(["abra", 12, ["cadabra", "second"]])",
                    R"(["abra", 12, [null, "second"]])")}};
    runAllBenchmarks("List of tuples of string, int, and optional list of optional strings", data, schema, iterations);
}

int main() {
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    benchListOfInts(40000, 20000);
    benchListOfOptionalInts(40000, 8000);
    benchListOf5xOptionalInts(40000, 10000);
    benchListOfStrings(40000, 10000);
    benchListOfOptionalStrings(40000, 10000);

    benchListOfListOfOptionalListOfInts(4000, 10000);
    benchListOfTuplesOfStringIntAndOptionalListOfOptionalStrings(40000, 1000);
    return 0;
}
