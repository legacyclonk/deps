#!/bin/bash
echo "::set-env name=CMAKE_BUILD_ARGS::--config Release"
echo "::set-env name=MERGE_LIBS::$PWD/platforms/merge_libs_vc.sh"
