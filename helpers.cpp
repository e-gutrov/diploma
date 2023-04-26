//
// Created by egor on 23/04/23.
//

#include <unordered_map>
#include <iostream>

#include <llvm/IR/IRBuilder.h>
#include <llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <llvm-c/TargetMachine.h>
#include <llvm/ExecutionEngine/Orc/LLJIT.h>

#include <llvm/Transforms/IPO/PassManagerBuilder.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/PassManager.h>

#include "helpers.h"
#include "validators_llvm.h"

using namespace llvm;

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
//        {"ValidateString", validateStringFunc},
        {"IsNull", module->getFunction("IsNull")},
        {"IsBeginArray", module->getFunction("IsBeginArray")},
        {"IsEndArray", module->getFunction("IsEndArray")},
    };
}

orc::ThreadSafeModule FinalizeModule(std::unique_ptr<Module> module, std::unique_ptr<LLVMContext> context) {
    std::string triple = LLVMGetDefaultTargetTriple();
    module->setTargetTriple(triple);
    llvm::PassManagerBuilder PMBuilder;
    PMBuilder.OptLevel = 2;
    llvm::legacy::FunctionPassManager FPM(module.get());
    PMBuilder.populateFunctionPassManager(FPM);
    FPM.doInitialization();
    for (Function &F : *module) {
        FPM.run(F);
    }
    FPM.doFinalization();

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
