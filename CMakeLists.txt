cmake_minimum_required(VERSION 3.22.1)
project(coursework)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-O2")

include_directories(include ${PROJECT_SOURCE_DIR}/include/ytsaurus)
#include/ytsaurus/contrib/libs/cxxsupp/libcxx/include
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/ytsaurus/cmake/)
add_subdirectory(include/ytsaurus)
add_executable(yson_coursework yson_main.cpp yson_cursor_validator.cpp)
target_compile_options(yson_coursework PRIVATE
    -Wdeprecated-this-capture
)
find_package(Python3 3.7 EXACT COMPONENTS Interpreter)
target_link_libraries(yson_coursework PUBLIC
    contrib-libs-linux-headers
    contrib-libs-cxxsupp
    yutil
    cpp-malloc-tcmalloc
    libs-tcmalloc-no_percpu_cache
    library-cpp-cpuid_check
    cpp-mapreduce-interface
    cpp-mapreduce-client
)
target_link_options(yson_coursework PRIVATE
    -ldl
    -lrt
    -Wl,--no-as-needed
    -fPIC
    -fPIC
    -lpthread
    -lrt
    -ldl
    -lutil
)
vcs_info(yson_coursework)

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


# For tests
find_package(Catch2 3 REQUIRED)
# These tests can use the Catch2-provided main
add_executable(tests test_validators.cpp validators_jsoncons.cpp validators_llvm.cpp helpers.cpp table_schema.cpp exceptions.cpp jsoncons_cursor_validator.cpp)
target_link_libraries(tests PRIVATE Catch2::Catch2 ${llvm_libs})

add_executable(json_benchmarks json_benchmarks.cpp validators_jsoncons.cpp validators_llvm.cpp helpers.cpp table_schema.cpp exceptions.cpp jsoncons_cursor_validator.cpp)
target_link_libraries(json_benchmarks ${llvm_libs})