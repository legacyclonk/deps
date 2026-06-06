#!/bin/bash

echo "TARGET_OSX_VERSION=11.3" >> $GITHUB_ENV

mkdir "clang-$LLVM_VERSION"
pushd "clang-$LLVM_VERSION"

curl -L "$BUILD_TOOL_URL/clang-22-22.1.6_0+analyzer.darwin_20.x86_64.tbz2" | tar --strip-components 3 -x -j

LLVM_CXX_INCLUDE="$PWD/libexec/llvm-$LLVM_VERSION/include/c++/v1"
LLVM_CXX_LIB="$PWD/libexec/llvm-$LLVM_VERSION/lib/libc++"

echo "LLVM_CXX_INCLUDE=$LLVM_CXX_INCLUDE" >> $GITHUB_ENV
echo "LLVM_CXX_LIB=$LLVM_CXX_LIB" >> $GITHUB_ENV

LIBCLANG_DIR="$PWD/libexec/llvm-$LLVM_VERSION/lib/clang/$LLVM_VERSION/lib/darwin"
LIBCLANG_RT="$LIBCLANG_DIR/libclang_rt.osx.a"
echo "LIBCLANG_RT=$LIBCLANG_RT" >> $GITHUB_ENV

popd

OSX_SDK="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
echo "LINK_FLAGS=-nostdlib++ --sysroot $OSX_SDK" >> $GITHUB_ENV
echo "LINK_LIBS=$LLVM_CXX_LIB/libc++.a $LLVM_CXX_LIB/libc++abi.a $LLVM_CXX_LIB/libc++experimental.a $LIBCLANG_RT" >> $GITHUB_ENV
echo "C_XX_FLAGS=-nostdlib++ -nostdinc++ -I$LLVM_CXX_INCLUDE --sysroot $OSX_SDK" >> $GITHUB_ENV
