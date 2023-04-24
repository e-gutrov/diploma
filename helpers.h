//
// Created by egor on 23/04/23.
//

#ifndef COURSEWORK_HELPERS_H
#define COURSEWORK_HELPERS_H

#include <llvm/ExecutionEngine/Orc/LLJIT.h>
#include <llvm/IR/IRBuilder.h>

std::unordered_map<std::string, llvm::Function*> GenerateFunctionDeclarations(llvm::IRBuilder<>* builder, llvm::Module* module);

llvm::orc::ThreadSafeModule FinalizeModule(std::unique_ptr<llvm::Module> module, std::unique_ptr<llvm::LLVMContext> context);

std::unique_ptr<llvm::orc::LLJIT> PrepareJit();

#endif //COURSEWORK_HELPERS_H
