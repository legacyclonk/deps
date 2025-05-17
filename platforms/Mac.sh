#!/bin/bash
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
brew update
brew install llvm@20 ninja

echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 -DCMAKE_TOOLCHAIN_FILE=$PWD/platforms/clang16_mac.cmake" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(sysctl -n hw.logicalcpu)" >> $GITHUB_ENV
echo "LINK_FLAGS=-mmacosx-version-min=10.9" >> $GITHUB_ENV
echo "C_XX_FLAGS=-mmacosx-version-min=10.9" >> $GITHUB_ENV
