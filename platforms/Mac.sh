#!/bin/bash
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
brew update
brew install "llvm@$LLVM_VERSION" ninja
LLVM_PREFIX="$(brew --prefix "llvm@$LLVM_VERSION")"
NINJA_PREFIX="$(brew --prefix ninja)"

TARGET_OSX_VERSION=11.3

echo "LLVM_PREFIX=$LLVM_PREFIX" >> $GITHUB_ENV
echo "NINJA_PREFIX=$NINJA_PREFIX" >> $GITHUB_ENV

echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DCMAKE_TOOLCHAIN_FILE=$PWD/platforms/clang_mac.cmake -G Ninja -DCMAKE_OSX_DEPLOYMENT_TARGET=$TARGET_OSX_VERSION" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(sysctl -n hw.logicalcpu)" >> $GITHUB_ENV
echo "CC=$LLVM_PREFIX/bin/clang" >> $GITHUB_ENV
echo "CXX=$LLVM_PREFIX/bin/clang++" >> $GITHUB_ENV

BUILD_TOOL_URL="https://github.com/legacyclonk/deps/releases/download/2026-05-31-tools"

mkdir "clang-$LLVM_VERSION"
pushd "clang-$LLVM_VERSION"

curl -L "$BUILD_TOOL_URL/clang-22-22.1.6_0+analyzer.darwin_20.x86_64.tbz2" | tar --strip-components 3 -x -j

LLVM_CXX_INCLUDE="$PWD/libexec/llvm-$LLVM_VERSION/include/c++/v1"
LLVM_CXX_LIB="$PWD/libexec/llvm-$LLVM_VERSION/lib/libc++"

echo "LLVM_CXX_INCLUDE=$LLVM_CXX_INCLUDE" >> $GITHUB_ENV
echo "LLVM_CXX_LIB=$LLVM_CXX_LIB" >> $GITHUB_ENV

LIBCLANG_DIR="$PWD/libexec/llvm-$LLVM_VERSION/lib/clang/$LLVM_VERSION/lib/darwin"
echo "LIBCLANG_RT=$LIBCLANG_DIR/libclang_rt.osx.a" >> $GITHUB_ENV

popd

OSX_SDK="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
echo "LINK_FLAGS=-nostdlib++ $LLVM_CXX_LIB/libc++.a $LLVM_CXX_LIB/libc++abi.a $LLVM_CXX_LIB/libc++experimental.a --sysroot $OSX_SDK -mmacosx-version-min=$TARGET_OSX_VERSION" >> $GITHUB_ENV
echo "C_XX_FLAGS=-nostdlib++ -nostdinc++ -I$LLVM_CXX_INCLUDE --sysroot $OSX_SDK -mmacosx-version-min=$TARGET_OSX_VERSION" >> $GITHUB_ENV
