#!/bin/bash
echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DYASM_ASSEMBLER=$PWD/yasm.exe" >> $GITHUB_ENV
echo "CMAKE_BUILD_ARGS=--config Release" >> $GITHUB_ENV

YASM_VERSION=1.3.0

curl -L -O https://github.com/jfcherng/vcredist-extracted/raw/master/2010/x86/Win/System/msvcr100.dll
curl -L https://github.com/yasm/yasm/releases/download/v"$YASM_VERSION"/yasm-"$YASM_VERSION"-win32.exe -o yasm.exe
