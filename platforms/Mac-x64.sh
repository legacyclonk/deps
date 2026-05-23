#!/bin/bash
# nothing needed
echo "TARGET_OSX_VERSION=10.13" >> $GITHUB_ENV

curl -L https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX10.13.sdk.tar.xz | tar xJ
echo "OSX_SDK=$PWD/MacOSX10.13.sdk" >> $GITHUB_ENV

mkdir clang-21
pushd clang-21

curl -L https://packages.macports.org/clang-21/clang-21-21.1.8_1+analyzer.darwin_17.x86_64.tbz2 | tar --strip-components 3 -x -j

LLVM_CXX_INCLUDE=$PWD/libexec/llvm-21/include/c++/v1
LLVM_CXX_LIB=$PWD/libexec/llvm-21/lib/libc++

echo "LLVM_CXX_INCLUDE=$LLVM_CXX_INCLUDE" >> $GITHUB_ENV
echo "LLVM_CXX_LIB=$LLVM_CXX_LIB" >> $GITHUB_ENV

popd

echo "LINK_FLAGS=-nostdlib++ $LLVM_CXX_LIB/libc++.a $LLVM_CXX_LIB/libc++abi.a $LLVM_CXX_LIB/libc++experimental.a --sysroot $PWD/MacOSX10.13.sdk" >> $GITHUB_ENV
echo "C_XX_FLAGS=-nostdlib++ -nostdinc++ -I$LLVM_CXX_INCLUDE --sysroot $PWD/MacOSX10.13.sdk" >> $GITHUB_ENV
