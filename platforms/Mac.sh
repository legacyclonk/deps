#!/bin/bash
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
brew update
brew install "llvm@$LLVM_VERSION" ninja
LLVM_PREFIX="$(brew --prefix "llvm@$LLVM_VERSION")"
NINJA_PREFIX="$(brew --prefix ninja)"

echo "LLVM_PREFIX=$LLVM_PREFIX" >> $GITHUB_ENV
echo "NINJA_PREFIX=$NINJA_PREFIX" >> $GITHUB_ENV

echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DCMAKE_TOOLCHAIN_FILE=$PWD/platforms/clang_mac.cmake" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(sysctl -n hw.logicalcpu)" >> $GITHUB_ENV
echo "CC=$LLVM_PREFIX/bin/clang" >> $GITHUB_ENV
echo "CXX=$LLVM_PREFIX/bin/clang++" >> $GITHUB_ENV
