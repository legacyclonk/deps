#!/bin/bash
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
brew update
brew install llvm@22 ninja

echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DCMAKE_TOOLCHAIN_FILE=$PWD/platforms/clang_mac.cmake" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(sysctl -n hw.logicalcpu)" >> $GITHUB_ENV
