//
// Created by egor on 25/04/23.
//
#include <chrono>

#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>
#include <llvm/Support/TargetSelect.h>

#include "table_schema.h"
#include "validators_llvm.h"
#include "validators_jsoncons.h"
#include "helpers.h"
#include "rapidjson/document.h"
#include "rapidjson/schema.h"

class Timer {
public:
    Timer(const std::string& name = ""): Start_(std::chrono::high_resolution_clock::now()), Name_(name) {}

    double SecondsElapsed() const {
        auto now = std::chrono::high_resolution_clock::now();
        auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(now - Start_);
        return elapsed.count()  * 1e-9;
    }

    void PrintElapsed(const std::string& s) const {
        std::cout << s << ", elapsed " << SecondsElapsed() << std::endl;
    }

    ~Timer() {
        PrintElapsed("~Timer()");
    }

private:
    std::chrono::high_resolution_clock::time_point Start_;
    std::string Name_;
};

void benchJsonconsValidation(const std::vector<std::string>& data, const jsoncons::json& jsonSchema, int iterations) {
    auto schema = jsoncons::jsonschema::make_schema(jsonSchema);
    jsoncons::jsonschema::json_validator<jsoncons::json> validator(schema);
    for (const auto& json : data) {
        Timer t("jsoncons");
        int res = 0;
        auto jsonObj = jsoncons::json::parse(json);
        for (int i = 0; i < iterations; ++i) {
//            jsoncons::json_cursor cursor(json);
//            while (!cursor.done()) {
//                cursor.next();
//                ++res;
//            }
            res += validator.is_valid(jsonObj);
        }
        std::cout << "jsoncons, res = " << res << std::endl;
    }
}

void benchRapidJsonValidation(const std::vector<std::string>& data, const std::string& schemaStr, int iterations) {
    rapidjson::Document d;
    d.Parse(schemaStr.c_str());
    rapidjson::SchemaDocument sd(d);
    for (const auto& json : data) {
        Timer t("RapidJSON");
        int res = 0;
        rapidjson::SchemaValidator validator(sd);
        for (int i = 0; i < iterations; ++i) {
            rapidjson::Reader reader;
            rapidjson::MemoryStream is(json.c_str(), json.size());
            if (!reader.Parse(is, validator) && reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
                throw std::exception();
            }
            res += validator.IsValid();
            validator.Reset();
        }
        std::cout << "RapidJSON, res = " << res << std::endl;
    }
}

void benchLLVMValidation(const std::vector<std::string>& data, const TypeBasePtr& type, int iterations) {
    auto jit = PrepareJit();
    if (auto err = jit->addIRModule(CreateTableSchemaValidator(type))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<bool(*)(void*)>(sym.get().getValue());
        for (const auto& json : data) {
            Timer t("LLVM");
            int res = 0;
            for (int i = 0; i < iterations; ++i) {
                jsoncons::json_cursor cursor(json);
                res += func(&cursor);
            }
            std::cout << "LLVM, res = " << res << std::endl;
        }
    }
}

int main() {
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    std::vector<std::string> data{"[1, 2, 3, 4]"};
    auto intListSchema = CreateList((CreateSimple(ValueType::Int))); // TODO: remove optional
    auto jsonIntListSchema = GenerateJsonSchema(intListSchema);
    int iterations = 10'000'000;

    benchJsonconsValidation(data, jsonIntListSchema, iterations);
    benchRapidJsonValidation(data, jsonIntListSchema.to_string(), iterations);
    benchLLVMValidation(data, intListSchema, iterations);

    return 0;
}