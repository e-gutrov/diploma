#include <rapidjson/document.h>
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>
#include <rapidjson/schema.h>
#include <rapidjson/memorystream.h>
#include <rapidjson/prettywriter.h>

#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonschema/jsonschema.hpp>

#include "llvm/ADT/StringRef.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"
#include "llvm/ExecutionEngine/Orc/Core.h"
#include "llvm/ExecutionEngine/Orc/ExecutionUtils.h"
#include "llvm/ExecutionEngine/Orc/ExecutorProcessControl.h"
#include "llvm/ExecutionEngine/Orc/IRCompileLayer.h"
#include "llvm/ExecutionEngine/Orc/JITTargetMachineBuilder.h"
#include "llvm/ExecutionEngine/Orc/RTDyldObjectLinkingLayer.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/TargetSelect.h"
#include <llvm/IR/IRBuilder.h>
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"

#include <iostream>
#include <llvm/Support/TargetSelect.h>

typedef rapidjson::GenericValue<rapidjson::UTF8<>, rapidjson::CrtAllocator > ValueType;

void rapidjsonParsingExample() {
    const char* json = R"({"project":"rapidjson","stars":10})";
    rapidjson::Document d;
    d.Parse(json);

    // 2. Modify it by DOM.
    rapidjson::Value& s = d["stars"];
    s.SetInt(s.GetInt() + 1);

    // 3. Stringify the DOM
    rapidjson::StringBuffer buffer;
    rapidjson::Writer<rapidjson::StringBuffer> writer(buffer);
    d.Accept(writer);

    // Output {"project":"rapidjson","stars":11}
    std::cout << buffer.GetString() << std::endl;
}


void rapidjsonValidatorExample() {
    const char* json = R"({"project":"rapidjson","stars":10})";
    const char* schema = R"(
    {
        "$schema": "http://json-schema.org/draft-04/schema#",
        "type": "object",
        "properties": {
            "project": {
                "type": "string"
            },
            "stars": {
                "type": "integer"
            }
        },
        "required": [
         "project",
         "stars"
        ]
   })";

    rapidjson::Document d;
    d.Parse(schema);
    rapidjson::SchemaDocument sd(d);
    rapidjson::SchemaValidator validator(sd);
    rapidjson::Reader reader;
    rapidjson::MemoryStream is(json, strlen(json));
    if (!reader.Parse(is, validator) && reader.GetParseErrorCode() != rapidjson::kParseErrorTermination) {
        // Schema validator error would cause kParseErrorTermination, which will handle it in next step.
        fprintf(stderr, "Input is not a valid JSON\n");
        fprintf(stderr, "Error(offset %u): %s\n",
                static_cast<unsigned>(reader.GetErrorOffset()),
                GetParseError_En(reader.GetParseErrorCode()));
    }

    // Check the validation result
    if (validator.IsValid()) {
        printf("Input JSON is valid.\n");
        return;
    }
    else {
        printf("Input JSON is invalid.\n");
        rapidjson::StringBuffer sb;
        validator.GetInvalidSchemaPointer().StringifyUriFragment(sb);
        fprintf(stderr, "Invalid schema: %s\n", sb.GetString());
        fprintf(stderr, "Invalid keyword: %s\n", validator.GetInvalidSchemaKeyword());
        fprintf(stderr, "Invalid code: %d\n", validator.GetInvalidSchemaCode());
        fprintf(stderr, "Invalid message: %s\n", GetValidateError_En(validator.GetInvalidSchemaCode()));
        sb.Clear();
        validator.GetInvalidDocumentPointer().StringifyUriFragment(sb);
        fprintf(stderr, "Invalid document: %s\n", sb.GetString());
        // Detailed violation report is available as a JSON value
        sb.Clear();
        rapidjson::PrettyWriter<rapidjson::StringBuffer> w(sb);
        validator.GetError().Accept(w);
        fprintf(stderr, "Error report:\n%s\n", sb.GetString());
//        CreateErrorMessages(validator.GetError()); https://github.com/Tencent/rapidjson/blob/master/example/schemavalidator/schemavalidator.cpp
        return;
    }
}

void jsonconsParsingExample() {
    std::string data = R"(
    {
       "application": "hiking",
       "reputons": [
       {
           "rater": "HikingAsylum",
           "assertion": "advanced",
           "rated": "Marilyn C",
           "rating": 0.90,
           "confidence": 0.99
         }
       ]
    }
    )";
    jsoncons::json_cursor cursor(data);
    for (; !cursor.done(); cursor.next())
    {
        const auto& event = cursor.current();
        switch (event.event_type())
        {
            case jsoncons::staj_event_type::begin_array:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::end_array:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::begin_object:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::end_object:
                std::cout << event.event_type() << " " << "\n";
                break;
            case jsoncons::staj_event_type::key:
                // Or std::string_view, if supported
                std::cout << event.event_type() << ": " << event.get<jsoncons::string_view>() << "\n";
                break;
            case jsoncons::staj_event_type::string_value:
                // Or std::string_view, if supported
                std::cout << event.event_type() << ": " << event.get<jsoncons::string_view>() << "\n";
                break;
            case jsoncons::staj_event_type::null_value:
                std::cout << event.event_type() << "\n";
                break;
            case jsoncons::staj_event_type::bool_value:
                std::cout << event.event_type() << ": " << std::boolalpha << event.get<bool>() << "\n";
                break;
            case jsoncons::staj_event_type::int64_value:
                std::cout << event.event_type() << ": " << event.get<int64_t>() << "\n";
                break;
            case jsoncons::staj_event_type::uint64_value:
                std::cout << event.event_type() << ": " << event.get<uint64_t>() << "\n";
                break;
            case jsoncons::staj_event_type::double_value:
                std::cout << event.event_type() << ": " << event.get<double>() << "\n";
                break;
            default:
                std::cout << "Unhandled event type: " << event.event_type() << " " << "\n";
                break;
        }
    }
}

void jsonconsValidatorExample() {
    jsoncons::json schema = jsoncons::json::parse(R"(
    {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "type": "object",
        "properties": {
            "project": {
                "type": "string"
            },
            "stars": {
                "type": "integer"
            }
        },
        "required": [
         "project",
         "stars"
        ]
   })");

    // Data
    jsoncons::json data = jsoncons::json::parse(R"({"project":"rapidjson","stars":10})");

    try
    {
        // Throws schema_error if JSON Schema loading fails
        auto sch = jsoncons::jsonschema::make_schema(schema);

        std::size_t error_count = 0;
        auto reporter = [&error_count](const jsoncons::jsonschema::validation_output& o)
        {
            ++error_count;
            std::cout << o.instance_location() << ": " << o.message() << "\n";
        };

        jsoncons::jsonschema::json_validator<jsoncons::json> validator(sch);

        // Will call reporter for each schema violation
        validator.validate(data, reporter);

        std::cout << "\nError count: " << error_count << "\n\n";
    }
    catch (const std::exception& e)
    {
        std::cout << e.what() << '\n';
    }
}

extern "C" void sayHello() {
    std::cout << "Hello LLVM!" << '\n';
}

namespace llvm {
    namespace orc {
        class KaleidoscopeJIT {
        private:
            std::unique_ptr<ExecutionSession> ES;

            DataLayout DL;
            MangleAndInterner Mangle;

            RTDyldObjectLinkingLayer ObjectLayer;
            IRCompileLayer CompileLayer;

            JITDylib &MainJD;

        public:
            KaleidoscopeJIT(std::unique_ptr<ExecutionSession> ES,
                            JITTargetMachineBuilder JTMB, DataLayout DL)
                    : ES(std::move(ES)), DL(std::move(DL)), Mangle(*this->ES, this->DL),
                      ObjectLayer(*this->ES,
                                  []() { return std::make_unique<SectionMemoryManager>(); }),
                      CompileLayer(*this->ES, ObjectLayer,
                                   std::make_unique<ConcurrentIRCompiler>(std::move(JTMB))),
                      MainJD(this->ES->createBareJITDylib("<main>")) {
                // likely not needed
                MainJD.addGenerator(
                        cantFail(DynamicLibrarySearchGenerator::GetForCurrentProcess(
                                DL.getGlobalPrefix())));
            }

            ~KaleidoscopeJIT() {
                if (auto Err = ES->endSession())
                    ES->reportError(std::move(Err));
            }

            static Expected<std::unique_ptr<KaleidoscopeJIT>> Create() {
                auto EPC = SelfExecutorProcessControl::Create();
                if (!EPC)
                    return EPC.takeError();

                auto ES = std::make_unique<ExecutionSession>(std::move(*EPC));

                JITTargetMachineBuilder JTMB(
                        ES->getExecutorProcessControl().getTargetTriple());

                auto DL = JTMB.getDefaultDataLayoutForTarget();
                if (!DL)
                    return DL.takeError();

                return std::make_unique<KaleidoscopeJIT>(std::move(ES), std::move(JTMB),
                                                         std::move(*DL));
            }

            const DataLayout &getDataLayout() const { return DL; }

            JITDylib &getMainJITDylib() { return MainJD; }

            Error addModule(ThreadSafeModule TSM, ResourceTrackerSP RT = nullptr) {
                if (!RT)
                    RT = MainJD.getDefaultResourceTracker();
                return CompileLayer.add(RT, std::move(TSM));
            }

            Expected<JITEvaluatedSymbol> lookup(StringRef Name) {
                return ES->lookup({&MainJD}, Mangle(Name.str()));
            }
        };
}}

llvm::orc::ThreadSafeModule createModule() {
    auto context = std::make_unique<llvm::LLVMContext>();
    llvm::IRBuilder<> builder(*context);
    auto module = std::make_unique<llvm::Module>("my_module", *context);

    llvm::FunctionType *sayHelloType = llvm::FunctionType::get(builder.getVoidTy(), false);
    llvm::Function *sayHelloFunc = llvm::Function::Create(sayHelloType, llvm::Function::ExternalLinkage, "sayHello", module.get());

    llvm::FunctionType *mainType = llvm::FunctionType::get(builder.getInt32Ty(), false);
    llvm::Function *mainFunc = llvm::Function::Create(mainType, llvm::Function::ExternalLinkage, "main", module.get());

    llvm::BasicBlock *entryBlock = llvm::BasicBlock::Create(*context, "entry", mainFunc);
    builder.SetInsertPoint(entryBlock);
    builder.CreateCall(sayHelloFunc);
    builder.CreateRet(builder.getInt32(0));

    std::string triple = LLVMGetDefaultTargetTriple();
    module->setTargetTriple(triple);
//    std::cout << "triple: " << triple << std::endl;


    return llvm::orc::ThreadSafeModule(std::move(module), std::move(context));
}

using namespace llvm;
using namespace orc;

void callHelloLLVMViaCustomJIT() {
//    LLJITBuilder().create()
    auto jitEx = KaleidoscopeJIT::Create();
    if (!jitEx) {
        std::cerr << "no jit" << toString(jitEx.takeError()) << std::endl;
    }
    auto jit = std::move(jitEx.get());
    if (auto err = jit->addModule(createModule())) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym" << toString(sym.takeError()) << std::endl;
    }
}

void callHelloLLVMViaLLJIT() {
    auto jitEx = LLJITBuilder().create();
    if (!jitEx) {
        std::cerr << "no jit" << toString(jitEx.takeError()) << std::endl;
    }
    auto jit = std::move(jitEx.get());

    auto& ES = jit->getExecutionSession();
    auto& DL = jit->getDataLayout();
    auto& JD = jit->getMainJITDylib();
    MangleAndInterner Mangle(ES, DL);

    auto symbol = JITEvaluatedSymbol(pointerToJITTargetAddress(&sayHello), JITSymbolFlags::Callable);
    auto pair = detail::DenseMapPair<SymbolStringPtr, JITEvaluatedSymbol>(Mangle("sayHello"), symbol);
    auto symbolMap = SymbolMap{{pair}};

    if (auto err = JD.define(absoluteSymbols(symbolMap))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
//    JD.addGenerator(cantFail(DynamicLibrarySearchGenerator::GetForCurrentProcess(DL.getGlobalPrefix())));

    if (auto err = jit->addIRModule(createModule())) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    auto sym = jit->lookup("main");
    if (!sym) {
        std::cerr << "no sym " << toString(sym.takeError()) << std::endl;
    } else {
        auto func = reinterpret_cast<void(*)()>(sym.get().getValue());
        func();
        func();
        func();
    }
}

int main() {
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    rapidjsonParsingExample();
    rapidjsonValidatorExample();
    jsonconsParsingExample();
    jsonconsValidatorExample();
//    callHelloLLVMViaCustomJIT();
    callHelloLLVMViaLLJIT();
    return 0;
}
