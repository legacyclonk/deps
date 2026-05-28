#!/bin/bash
# nothing needed
echo "TARGET_OSX_VERSION=10.13" >> $GITHUB_ENV

curl -L "$BUILD_TOOL_URL/MacOSX10.13.sdk.tar.xz" | tar xJ

OSX_SDK="$PWD/MacOSX10.13.sdk"
echo "OSX_SDK=$OSX_SDK" >> $GITHUB_ENV

mkdir clang-21
pushd clang-21

curl -L "$BUILD_TOOL_URL/clang-21-21.1.8_1+analyzer.darwin_17.x86_64.tbz2" | tar --strip-components 3 -x -j

LLVM_CXX_INCLUDE=$PWD/libexec/llvm-21/include/c++/v1
LLVM_CXX_LIB=$PWD/libexec/llvm-21/lib/libc++

echo "LLVM_CXX_INCLUDE=$LLVM_CXX_INCLUDE" >> $GITHUB_ENV
echo "LLVM_CXX_LIB=$LLVM_CXX_LIB" >> $GITHUB_ENV

LIBCLANG_DIR="$PWD/libexec/llvm-21/lib/clang/21/lib/darwin"
echo "LIBCLANG_RT=$LIBCLANG_DIR/libclang_rt.profile_osx.a $LIBCLANG_DIR/libclang_rt.fuzzer_interceptors_osx.a $LIBCLANG_DIR/libclang_rt.fuzzer_osx.a $LIBCLANG_DIR/libclang_rt.osx.a $LIBCLANG_DIR/libclang_rt.cc_kext.a $LIBCLANG_DIR/libclang_rt.fuzzer_no_main_osx.a" >> $GITHUB_ENV

popd

echo "LINK_FLAGS=-nostdlib++ $LLVM_CXX_LIB/libc++.a $LLVM_CXX_LIB/libc++abi.a $LLVM_CXX_LIB/libc++experimental.a --sysroot $OSX_SDK" >> $GITHUB_ENV
echo "C_XX_FLAGS=-nostdlib++ -nostdinc++ -I$LLVM_CXX_INCLUDE --sysroot $OSX_SDK" >> $GITHUB_ENV
