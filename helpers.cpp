#include <unordered_map>
#include <iostream>

#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm-c/TargetMachine.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/LLJIT.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Transforms/IPO/PassManagerBuilder.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/Transforms/IPO/AlwaysInliner.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/LegacyPassManager.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/PassManager.h>

#include <ytsaurus/library/cpp/yson/writer.h>
#include <ytsaurus/util/stream/str.h>

#include <jsoncons/json.hpp>

#include "helpers.h"
#include "json_validators_llvm.h"
#include "yson_validators_llvm.h"

using namespace llvm;

// TODO: think about refactoring

namespace {

    void DoConvertJsonToYson(NYson::TYsonWriter *writer, jsoncons::json_cursor *cursor);

    void DoConvertJsonListToYson(NYson::TYsonWriter *writer, jsoncons::json_cursor *cursor) {
        while (cursor->current().event_type() != jsoncons::staj_event_type::end_array) {
            writer->OnListItem();
            DoConvertJsonToYson(writer, cursor);
        }
    }

    void DoConvertJsonMapToYson(NYson::TYsonWriter *writer, jsoncons::json_cursor *cursor) {
        while (cursor->current().event_type() != jsoncons::staj_event_type::end_object) {
            auto key = cursor->current().get<std::string>();
            writer->OnKeyedItem(key);
            cursor->next();
            DoConvertJsonToYson(writer, cursor);
        }
    }

    void DoConvertJsonToYson(NYson::TYsonWriter *writer, jsoncons::json_cursor *cursor) {
        const auto &event = cursor->current();
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


}

std::string ConvertJsonToYson(const std::string& json, NYT::NYson::EYsonFormat format) {
    jsoncons::json_cursor cursor(json);
    TString result;
    TStringOutput out(result);
    NYson::TYsonWriter writer(&out, format);
    DoConvertJsonToYson(&writer, &cursor);
    return std::string(result.data(), result.size());
}

std::unordered_map<std::string, Function*> GetFunctionAddresses(IRBuilder<>* builder, Module* module) {
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

llvm::Function* CreateTypeValidatorNew(
    const TypeBasePtr& schema,
    llvm::LLVMContext* context,
    llvm::IRBuilder<>* builder,
    llvm::Module* module,
    const std::unordered_map<std::string, llvm::Function*>& functions,
    const std::string& suffix) {

    auto int8PtrTp = builder->getInt8PtrTy();
    auto int32Ptr = builder->getIntPtrTy(module->getDataLayout());
    auto funcType = llvm::FunctionType::get(
            builder->getInt1Ty(),
            {
                int8PtrTp, // arr
                int32Ptr, // next
                int32Ptr, // size
                builder->getInt32Ty(), // capacity
                int8PtrTp, // cursor
            },
            false);
    auto tp = schema->GetType();
    if (tp == ValueType::Int) {
        return functions.at("ValidateInt");
    } else if (tp == ValueType::String) {
        return functions.at("ValidateString");
    }
    auto funcName = "validate" + suffix;
    auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);
    auto attrSet = func->getAttributes();
    auto newAttrSet = attrSet.addFnAttribute(*context, llvm::Attribute::AlwaysInline);
    func->setAttributes(newAttrSet);

    auto arrArg = func->arg_begin();
    auto nextArg = std::next(arrArg);
    auto sizeArg = std::next(nextArg);
    auto capacityArg = std::next(sizeArg);
    auto cursorArg = std::next(capacityArg);

    switch (schema->GetType()) {
        case ValueType::Optional: {
            auto validateChild = CreateTypeValidatorNew(schema->Child(), context, builder, module, functions, suffix + "OptionalChild");

            auto entry = llvm::BasicBlock::Create(*context, "entry", func);
            builder->SetInsertPoint(entry);
            auto isNullCall = builder->CreateCall(
                    functions.at("IsNull"),
                    {arrArg, nextArg});
            auto nullCase = llvm::BasicBlock::Create(*context, "null", func);
            auto nonNullCase = llvm::BasicBlock::Create(*context, "nonNull", func);
            builder->CreateCondBr(isNullCall, nullCase, nonNullCase);

            builder->SetInsertPoint(nullCase);
            auto nextCall = builder->CreateCall(functions.at("CallNext"),{arrArg, nextArg, sizeArg, capacityArg, cursorArg});
            builder->CreateRet(builder->getInt1(true));

            builder->SetInsertPoint(nonNullCase);
            auto childCall = builder->CreateCall(validateChild, {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
            builder->CreateRet(childCall);
            return func;
        }
    case ValueType::List: {
        auto validateChild = CreateTypeValidatorNew(schema->Child(), context, builder, module, functions, suffix + "ListChild");

        auto entry = llvm::BasicBlock::Create(*context, "entry", func);
        builder->SetInsertPoint(entry);
        auto isBeginArray = builder->CreateCall(functions.at("IsBeginArray"), {arrArg, nextArg});

        auto retFalse = llvm::BasicBlock::Create(*context, "retFalse", func);
        auto preLoop = llvm::BasicBlock::Create(*context, "preLoop", func);
        builder->CreateCondBr(isBeginArray, preLoop, retFalse);
        {
            builder->SetInsertPoint(retFalse);
            builder->CreateRet(builder->getInt1(false));
        }
        auto callNextAndRetTrue = llvm::BasicBlock::Create(*context, "callNextAndRetTrue", func);
        {
            builder->SetInsertPoint(callNextAndRetTrue);
            auto nextCall = builder->CreateCall(functions.at("CallNext"), {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
            builder->CreateRet(builder->getInt1(true));
        }
        {
            builder->SetInsertPoint(preLoop);
            auto nextCall = builder->CreateCall(functions.at("CallNext"), {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
        }
        auto while_ = llvm::BasicBlock::Create(*context, "while", func);
        auto whileBody = llvm::BasicBlock::Create(*context, "whileBody", func);
        builder->CreateBr(while_);
        builder->SetInsertPoint(while_);
        auto isEndArray = builder->CreateCall(functions.at("IsEndArray"), {arrArg, nextArg});
        builder->CreateCondBr(isEndArray, callNextAndRetTrue, whileBody);

        builder->SetInsertPoint(whileBody);
        auto childCall = builder->CreateCall(validateChild, {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
        builder->CreateCondBr(childCall, while_, retFalse);
        return func;
    }
    case ValueType::Tuple: {
        std::vector<llvm::Function*> childValidators;
        int childCount = 0;
        for (const auto& child: schema->Children()) {
            ++childCount;
            childValidators.emplace_back(CreateTypeValidatorNew(
                child->Schema,
                context,
                builder,
                module,
                functions,
                suffix + std::to_string(childCount)));
        }
        auto entry = llvm::BasicBlock::Create(*context, "entry", func);
        builder->SetInsertPoint(entry);
        auto isBeginArray = builder->CreateCall(functions.at("IsBeginArray"), {arrArg, nextArg});

        auto retFalse = llvm::BasicBlock::Create(*context, "retFalse", func);
        auto nextField = llvm::BasicBlock::Create(*context, "field0", func);
        builder->CreateCondBr(isBeginArray, nextField, retFalse);
        {
            builder->SetInsertPoint(retFalse);
            builder->CreateRet(builder->getInt1(false));
        }
        for (int i = 0; i < childValidators.size(); ++i) {
            builder->SetInsertPoint(nextField);
            if (i == 0) {
                builder->CreateCall(functions.at("CallNext"), {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
            }
            nextField = llvm::BasicBlock::Create(*context, "field" + std::to_string(i + 1), func);
            auto childCall = builder->CreateCall(childValidators[i], {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
            builder->CreateCondBr(childCall, nextField, retFalse);
        }
        builder->SetInsertPoint(nextField);
        auto callNextAndRetTrue = llvm::BasicBlock::Create(*context, "callNextAndRetTrue", func);
        auto isEndArray = builder->CreateCall(functions.at("IsEndArray"), {arrArg, nextArg});
        builder->CreateCondBr(isEndArray, callNextAndRetTrue, retFalse);
        builder->SetInsertPoint(callNextAndRetTrue);
        builder->CreateCall(functions.at("CallNext"), {arrArg, nextArg, sizeArg, capacityArg, cursorArg});
        builder->CreateRet(builder->getInt1(true));
        return func;
    }
    case ValueType::Object: {
        // TODO: in case of structs, map each field name to a number and lookup it in a map with an external function?
        // based on the index, call the needed function (ptrs will be stored in an array?) and mark the field used
        // Check that all required fields are met
        assert(0);
    }
    case ValueType::Int:
    case ValueType::String:
        assert(false);
    }
}

llvm::Function* CreateTypeValidator(
    const TypeBasePtr& schema,
    llvm::LLVMContext* context,
    llvm::IRBuilder<>* builder,
    llvm::Module* module,
    const std::unordered_map<std::string, llvm::Function*>& functions,
    const std::string& suffix) {

    auto funcType = llvm::FunctionType::get(builder->getInt1Ty(), {builder->getInt8PtrTy()}, false);
    auto funcName = "validate" + suffix;

    switch (schema->GetType()) {
    case ValueType::Int: {
    return functions.at("ValidateInt");
    }
    case ValueType::String: {
    return functions.at("ValidateString");
    }
    case ValueType::Optional: {
    auto validateChild = CreateTypeValidator(schema->Child(), context, builder, module, functions, suffix + "OptionalChild");
    auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);
    auto entry = llvm::BasicBlock::Create(*context, "entry", func);
    builder->SetInsertPoint(entry);
    // TODO: IsNullAndCallNext()?
    auto isNullCall = builder->CreateCall(functions.at("IsNull"), {func->arg_begin()});
    auto nullCase = llvm::BasicBlock::Create(*context, "null", func);
    auto nonNullCase = llvm::BasicBlock::Create(*context, "nonNull", func);
    builder->CreateCondBr(isNullCall, nullCase, nonNullCase);

    builder->SetInsertPoint(nullCase);
    auto nextCall = builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
    builder->CreateRet(builder->getInt1(true));

    builder->SetInsertPoint(nonNullCase);
    auto childCall = builder->CreateCall(validateChild, {func->arg_begin()});
    builder->CreateRet(childCall);
    return func;
    }
    case ValueType::List: {
    auto validateChild = CreateTypeValidator(schema->Child(), context, builder, module, functions, suffix + "ListChild");
    auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);

    auto entry = llvm::BasicBlock::Create(*context, "entry", func);
    builder->SetInsertPoint(entry);
    auto isBeginArray = builder->CreateCall(functions.at("IsBeginArray"), {func->arg_begin()});

    auto retFalse = llvm::BasicBlock::Create(*context, "retFalse", func);
    auto preLoop = llvm::BasicBlock::Create(*context, "preLoop", func);
    builder->CreateCondBr(isBeginArray, preLoop, retFalse);
    {
    builder->SetInsertPoint(retFalse);
    builder->CreateRet(builder->getInt1(false));
    }
    auto callNextAndRetTrue = llvm::BasicBlock::Create(*context, "callNextAndRetTrue", func);
    {
    builder->SetInsertPoint(callNextAndRetTrue);
    auto nextCall = builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
    builder->CreateRet(builder->getInt1(true));
    }
    {
    builder->SetInsertPoint(preLoop);
    auto nextCall = builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
    }
    auto while_ = llvm::BasicBlock::Create(*context, "while", func);
    auto whileBody = llvm::BasicBlock::Create(*context, "whileBody", func);
    builder->CreateBr(while_);
    builder->SetInsertPoint(while_);
    auto isEndArray = builder->CreateCall(functions.at("IsEndArray"), {func->arg_begin()});
    builder->CreateCondBr(isEndArray, callNextAndRetTrue, whileBody);

    builder->SetInsertPoint(whileBody);
    auto childCall = builder->CreateCall(validateChild, {func->arg_begin()});
    builder->CreateCondBr(childCall, while_, retFalse);
    return func;
    }
    case ValueType::Tuple: {
    std::vector<llvm::Function*> childValidators;
    int childCount = 0;
    for (const auto& child: schema->Children()) {
    ++childCount;
    childValidators.emplace_back(CreateTypeValidator(
            child->Schema,
            context,
            builder,
    module,
    functions,
    suffix + std::to_string(childCount)));
    }
    auto func = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module);

    auto entry = llvm::BasicBlock::Create(*context, "entry", func);
    builder->SetInsertPoint(entry);
    auto isBeginArray = builder->CreateCall(functions.at("IsBeginArray"), {func->arg_begin()});

    auto retFalse = llvm::BasicBlock::Create(*context, "retFalse", func);
    auto nextField = llvm::BasicBlock::Create(*context, "field0", func);
    builder->CreateCondBr(isBeginArray, nextField, retFalse);
    {
    builder->SetInsertPoint(retFalse);
    builder->CreateRet(builder->getInt1(false));
    }
    for (int i = 0; i < childValidators.size(); ++i) {
    builder->SetInsertPoint(nextField);
    if (i == 0) {
    builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
    }
    nextField = llvm::BasicBlock::Create(*context, "field" + std::to_string(i + 1), func);
    auto childCall = builder->CreateCall(childValidators[i], {func->arg_begin()});
    builder->CreateCondBr(childCall, nextField, retFalse);
    }
    builder->SetInsertPoint(nextField);
    auto callNextAndRetTrue = llvm::BasicBlock::Create(*context, "callNextAndRetTrue", func);
    auto isEndArray = builder->CreateCall(functions.at("IsEndArray"), {func->arg_begin()});
    builder->CreateCondBr(isEndArray, callNextAndRetTrue, retFalse);
    builder->SetInsertPoint(callNextAndRetTrue);
    builder->CreateCall(functions.at("CallNext"), {func->arg_begin()});
    builder->CreateRet(builder->getInt1(true));
    return func;
    }
    case ValueType::Object: {
    // TODO: in case of structs, map each field name to a number and lookup it in a map with an external function?
    // based on the index, call the needed function (ptrs will be stored in an array?) and mark the field used
    // Check that all required fields are met
    assert(0);
    }
    default:
    assert(false);
    }
}

orc::ThreadSafeModule FinalizeModule(std::unique_ptr<Module> module, std::unique_ptr<LLVMContext> context) {
    std::string triple = LLVMGetDefaultTargetTriple();
    module->setTargetTriple(triple);
    llvm::PassManagerBuilder PMBuilder;
    PMBuilder.OptLevel = 3;
    llvm::legacy::PassManager PM;
    PMBuilder.Inliner = llvm::createAlwaysInlinerLegacyPass();
    PMBuilder.populateModulePassManager(PM);

    PM.run(*module);

    llvm::legacy::FunctionPassManager FPM(module.get());
    PMBuilder.populateFunctionPassManager(FPM);
    FPM.doInitialization();
    for (Function &F : *module) {
        FPM.run(F);
    }
    FPM.doFinalization();

    return {std::move(module), std::move(context)};
}

std::unique_ptr<orc::LLJIT> PrepareJit(PrepareJitFor prepareFor, bool useProcessSymbols) {
    auto jitEx = orc::LLJITBuilder().create();
    if (!jitEx) {
        std::cerr << "no jit" << toString(jitEx.takeError()) << std::endl;
    }
    auto jit = std::move(jitEx.get());

    auto& ES = jit->getExecutionSession();
    auto& DL = jit->getDataLayout();
    auto& JD = jit->getMainJITDylib();
    orc::MangleAndInterner Mangle(ES, DL);

    orc::SymbolMap symbolMap;
    switch (prepareFor) {
        case PrepareJitFor::Json: {
            symbolMap.insert({Mangle("FillWithEvents"), JITEvaluatedSymbol(pointerToJITTargetAddress(&JsonValidators::FillWithEvents), JITSymbolFlags::Callable)});
            break;
        }
        case PrepareJitFor::Yson: {
            symbolMap.insert({Mangle("FillWithEvents"), JITEvaluatedSymbol(pointerToJITTargetAddress(&YsonValidators::FillWithEvents), JITSymbolFlags::Callable)});
            break;
        }
    }

    if (auto err = JD.define(absoluteSymbols(symbolMap))) {
        std::cout << toString(std::move(err)) << std::endl;
    }
    JD.addGenerator(cantFail(llvm::orc::DynamicLibrarySearchGenerator::GetForCurrentProcess(DL.getGlobalPrefix())));
    return jit;
}
