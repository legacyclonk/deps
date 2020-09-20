#!/bin/bash
echo "::set-env name=CMAKE_CONFIGURE_ARGS::-A x64"
echo "::set-env name=CMAKE_BUILD_ARGS::--config Release"
echo "::set-env name=LIBSUFFIX::.lib"
echo "::set-env name=OUTDIR::Release/"
echo "::set-env name=VS_ARCH::amd64"
echo "::set-env name=MAKE::nmake"
echo "::set-env name=MSBUILD_PLATFORM::x64"
