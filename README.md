# Runtime LLVM IR generation for validating schematized data

To build locally:
```
git clone --recurse-submodules git@github.com:e-gutrov/diploma.git
cd diploma && mkdir build && cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../clang16.toolchain ..
ninja benchmarks # or tests
```

If you don't specify a target for `ninja`, everything will be build (including ytsaurus).
This will take A LOT of time.