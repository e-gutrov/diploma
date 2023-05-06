//
// Created by egor on 23/04/23.
//

#include <unordered_map>
#include <iostream>

#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm-c/TargetMachine.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/LLJIT.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Transforms/IPO/PassManagerBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/LegacyPassManager.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/PassManager.h>

#include <ytsaurus/library/cpp/yson/writer.h>
#include <ytsaurus/util/stream/str.h>

#include <jsoncons/json.hpp>

#include "helpers.h"
#include "validators_llvm.h"

using namespace llvm;

void DoConvertJsonToYson(NYson::TYsonWriter* writer, jsoncons::json_cursor* cursor);

void DoConvertJsonListToYson(NYson::TYsonWriter* writer, jsoncons::json_cursor* cursor) {
    while (cursor->current().event_type() != jsoncons::staj_event_type::end_array) {
        writer->OnListItem();
        DoConvertJsonToYson(writer, cursor);
    }
}

void DoConvertJsonMapToYson(NYson::TYsonWriter* writer, jsoncons::json_cursor* cursor) {
    while (cursor->current().event_type() != jsoncons::staj_event_type::end_object) {
        auto key = cursor->current().get<std::string>();
        writer->OnKeyedItem(key);
        cursor->next();
        DoConvertJsonToYson(writer, cursor);
    }
}

void DoConvertJsonToYson(NYson::TYsonWriter* writer, jsoncons::json_cursor* cursor) {
    const auto& event = cursor->current();
    switch (event.event_type()) {
        case jsoncons::staj_event_type::begin_array: {
            writer->OnBeginList();
            cursor->next();

            DoConvertJsonListToYson(writer, cursor);

            writer->OnEndList();
            cursor->next();
            return;
        }
        case jsoncons::staj_event_type::begin_object: {
            writer->OnBeginMap();
            cursor->next();

            DoConvertJsonMapToYson(writer, cursor);

            writer->OnEndMap();
            cursor->next();
            return;
        }
        case jsoncons::staj_event_type::null_value: {
            writer->OnEntity();
            break;
        }
        case jsoncons::staj_event_type::uint64_value: {
            writer->OnUint64Scalar(event.get<std::uint64_t>());
            break;
        }
        case jsoncons::staj_event_type::int64_value: {
            writer->OnInt64Scalar(event.get<std::int64_t>());
            break;
        }
        case jsoncons::staj_event_type::bool_value: {
            writer->OnBooleanScalar(event.get<bool>());
            break;
        }
        case jsoncons::staj_event_type::double_value:
        case jsoncons::staj_event_type::half_value: {
            writer->OnDoubleScalar(event.get<double>());
            break;
        }
        case jsoncons::staj_event_type::string_value: {
            writer->OnStringScalar(event.get<std::string>());
            break;
        }
        case jsoncons::staj_event_type::end_array:
        case jsoncons::staj_event_type::end_object:
        case jsoncons::staj_event_type::key:
        case jsoncons::staj_event_type::byte_string_value:
            assert(0);
    }
    cursor->next();
}

std::string ConvertJsonToYson(const std::string& json, NYT::NYson::EYsonFormat format) {
    jsoncons::json_cursor cursor(json);
    TString result;
    TStringOutput out(result);
    NYson::TYsonWriter writer(&out, format);
    DoConvertJsonToYson(&writer, &cursor);
    return std::string(result.data(), result.size());
}

std::unordered_map<std::string, Function*> GenerateFunctionDeclarations(IRBuilder<>* builder, Module* module) {
//    auto voidTy = builder->getVoidTy();
//    auto sayHelloType = FunctionType::get(voidTy, false);
//    auto sayHelloFunc = Function::Create(sayHelloType, Function::ExternalLinkage, "SayHello", module);
//
//    auto boolTy = builder->getInt1Ty();
//    auto voidPtrTy = builder->getInt8PtrTy();
//
//    auto isDoneType = FunctionType::get(boolTy, {voidPtrTy}, false);
//    auto isDoneFunc = Function::Create(isDoneType, Function::ExternalLinkage, "IsDone", module);
//
//    auto callNextType = FunctionType::get(voidTy, {voidPtrTy}, false);
//    auto callNextFunc = Function::Create(callNextType, Function::ExternalLinkage, "CallNext", module);
//
//    auto validateIntType = FunctionType::get(boolTy, {voidPtrTy}, false);
//    auto validateIntFunc = Function::Create(validateIntType, Function::ExternalLinkage, "ValidateInt", module);
//
//    auto isNullType = FunctionType::get(boolTy, {voidPtrTy}, false);
//    auto isNullFunc =  Function::Create(isNullType, Function::ExternalLinkage, "IsNull", module);
//
//    auto isBeginArrayFunc = Function::Create(isNullType, Function::ExternalLinkage, "IsBeginArray", module);
//    auto isEndArrayFunc = Function::Create(isNullType, Function::ExternalLinkage, "IsEndArray", module);

    return {
        {"IsDone", module->getFunction("IsDone")},
        {"CallNext", module->getFunction("CallNext")},
        {"ValidateInt", module->getFunction("ValidateInt")},
        {"ValidateString", module->getFunction("ValidateString")},
        {"IsNull", module->getFunction("IsNull")},
        {"IsBeginArray", module->getFunction("IsBeginArray")},
        {"IsEndArray", module->getFunction("IsEndArray")},
    };
}

orc::ThreadSafeModule FinalizeModule(std::unique_ptr<Module> module, std::unique_ptr<LLVMContext> context) {
    std::string triple = LLVMGetDefaultTargetTriple();
    module->setTargetTriple(triple);
    llvm::PassManagerBuilder PMBuilder;
    //    PMBuilder.OptLevel = 2;
    //    llvm::legacy::FunctionPassManager FPM(module.get());
    //    PMBuilder.populateFunctionPassManager(FPM);
    //    FPM.doInitialization();
    //    for (Function &F : *module) {
    //        FPM.run(F);
    //    }
    //    FPM.doFinalization();

    // TODO: figure out
    // Optionally, run module-level optimization passes.
    //    llvm::legacy::ModulePassManager MPM;
    //    PMBuilder.populateModulePassManager(MPM);
    //    MPM.run(*module);

    //    module->dump();

    return {std::move(module), std::move(context)};
}

std::unique_ptr<orc::LLJIT> PrepareJit() {
    auto jitEx = orc::LLJITBuilder().create();
    if (!jitEx) {
        std::cerr << "no jit" << toString(jitEx.takeError()) << std::endl;
    }
    auto jit = std::move(jitEx.get());

    auto& ES = jit->getExecutionSession();
    auto& DL = jit->getDataLayout();
    auto& JD = jit->getMainJITDylib();
    orc::MangleAndInterner Mangle(ES, DL);

//    auto symbolMap = orc::SymbolMap{{
//        {Mangle("SayHello"), JITEvaluatedSymbol(pointerToJITTargetAddress(&SayHello), JITSymbolFlags::Callable)},
//        {Mangle("ValidateInt"), JITEvaluatedSymbol(pointerToJITTargetAddress(&ValidateSimpleType<ValueType::Int>), JITSymbolFlags::Callable)},
//        {Mangle("ValidateString"), JITEvaluatedSymbol(pointerToJITTargetAddress(&ValidateSimpleType<ValueType::String>), JITSymbolFlags::Callable)},
//        {Mangle("IsNull"), JITEvaluatedSymbol(pointerToJITTargetAddress(&IsType<jsoncons::staj_event_type::null_value>), JITSymbolFlags::Callable)},
//        {Mangle("IsBeginArray"), JITEvaluatedSymbol(pointerToJITTargetAddress(&IsType<jsoncons::staj_event_type::begin_array>), JITSymbolFlags::Callable)},
//        {Mangle("IsEndArray"), JITEvaluatedSymbol(pointerToJITTargetAddress(&IsType<jsoncons::staj_event_type::end_array>), JITSymbolFlags::Callable)},
//        {Mangle("CallNext"), JITEvaluatedSymbol(pointerToJITTargetAddress(&CallNext), JITSymbolFlags::Callable)},
//        {Mangle("IsDone"), JITEvaluatedSymbol(pointerToJITTargetAddress(&IsDone), JITSymbolFlags::Callable)},
//    }};
//
//    if (auto err = JD.define(absoluteSymbols(symbolMap))) {
//        std::cout << toString(std::move(err)) << std::endl;
//    }
    JD.addGenerator(cantFail(llvm::orc::DynamicLibrarySearchGenerator::GetForCurrentProcess(DL.getGlobalPrefix())));
    return jit;
}
