#!/bin/bash
echo "::set-env name=CMAKE_CONFIGURE_ARGS::-DCMAKE_BUILD_TYPE=Release"
echo "::set-env name=CMAKE_BUILD_ARGS:: -- -j$(nproc)"
echo "::set-env name=LIBSUFFIX::.a"
echo "::set-env name=OUTDIR::"
