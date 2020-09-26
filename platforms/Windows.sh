#!/bin/bash
echo "::set-env name=CMAKE_BUILD_ARGS::--config Release"
echo "::set-env name=LIBSUFFIX::.lib"
echo "::set-env name=OUTDIR::Release/"
