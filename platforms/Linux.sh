#!/bin/bash
echo "::set-env name=CMAKE_CONFIGURE_ARGS::-DCMAKE_BUILD_TYPE=Release"
echo "::set-env name=MAKE_CMD::make -j$(nproc)"
echo "::set-env name=MERGE_LIBS::$PWD/platforms/merge_libs_ar.sh"
