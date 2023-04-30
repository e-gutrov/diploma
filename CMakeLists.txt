cmake_minimum_required(VERSION 3.22.1)
project(coursework)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O2")
include_directories(include)
add_executable(coursework
        main.cpp
        validators_jsoncons.cpp
        validators_jsoncons.h
        table_schema.h
        table_schema.cpp
        exceptions.cpp
        exceptions.h
        validators_llvm.cpp
        validators_llvm.h
        helpers.cpp
        helpers.h
        jsoncons_cursor_validator.cpp)

find_package(LLVM 16.0.0 REQUIRED CONFIG EXACT)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

# Find the libraries that correspond to the LLVM components
# that we wish to use
llvm_map_components_to_libnames(llvm_libs
        support
        core
        irreader
        orcjit
        X86AsmParser
        X86CodeGen
        X86Desc
        X86Disassembler
        X86Info
        ExecutionEngine)

# Link against LLVM libraries
target_link_libraries(coursework ${llvm_libs})

add_subdirectory(include/ytsaurus)

# For tests
find_package(Catch2 3 REQUIRED)
# These tests can use the Catch2-provided main
add_executable(tests test_validators.cpp validators_jsoncons.cpp validators_llvm.cpp helpers.cpp table_schema.cpp exceptions.cpp jsoncons_cursor_validator.cpp)
target_link_libraries(tests PRIVATE Catch2::Catch2 ${llvm_libs})

add_executable(benchmark benchmarks.cpp validators_jsoncons.cpp validators_llvm.cpp helpers.cpp table_schema.cpp exceptions.cpp jsoncons_cursor_validator.cpp)
target_link_libraries(benchmark ${llvm_libs})