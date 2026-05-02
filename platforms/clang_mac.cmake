cmake_minimum_required(VERSION 3.20)
set(CMAKE_C_COMPILER "$ENV{LLVM_PREFIX}/bin/clang")
set(CMAKE_CXX_COMPILER "$ENV{LLVM_PREFIX}/bin/clang++")

set(CMAKE_C_FLAGS_INIT "-fexperimental-library -Wno-parentheses")
set(CMAKE_CXX_FLAGS_INIT "-stdlib=libc++ ${CMAKE_C_FLAGS_INIT}")
set(CMAKE_OBJCXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT}")

set(CMAKE_EXE_LINKER_FLAGS_INIT "-L$ENV{LLVM_PREFIX}/lib/c++")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "-L$ENV{LLVM_PREFIX}/lib/c++")
