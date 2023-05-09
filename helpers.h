#ifndef COURSEWORK_HELPERS_H
#define COURSEWORK_HELPERS_H

#include <ytsaurus/library/cpp/yt/yson_string/public.h>

#include <ytsaurus/contrib/libs/llvm16/include/llvm/ExecutionEngine/Orc/LLJIT.h>
#include <ytsaurus/contrib/libs/llvm16/include/llvm/IR/IRBuilder.h>

#include "table_schema.h"

std::string ConvertJsonToYson(const std::string&, NYT::NYson::EYsonFormat format = NYT::NYson::EYsonFormat::Binary);

llvm::Function* CreateTypeValidatorNew(
    const TypeBasePtr& schema,
    llvm::LLVMContext* context,
    llvm::IRBuilder<>* builder,
    llvm::Module* module,
    const std::unordered_map<std::string, llvm::Function*>& functions,
    const std::string& suffix = "");

llvm::Function* CreateTypeValidator(
    const TypeBasePtr& schema,
    llvm::LLVMContext* context,
    llvm::IRBuilder<>* builder,
    llvm::Module* module,
    const std::unordered_map<std::string, llvm::Function*>& functions,
    const std::string& suffix = "");

std::unordered_map<std::string, llvm::Function*> GenerateFunctionDeclarations(llvm::IRBuilder<>* builder, llvm::Module* module, bool useExisting);

llvm::orc::ThreadSafeModule FinalizeModule(std::unique_ptr<llvm::Module> module, std::unique_ptr<llvm::LLVMContext> context);

enum class PrepareJitFor {
    Json,
    Yson,
};

std::unique_ptr<llvm::orc::LLJIT> PrepareJit(PrepareJitFor, bool useProcessSymbols);

#endif //COURSEWORK_HELPERS_H
