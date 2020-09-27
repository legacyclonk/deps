#!/bin/bash
echo "::set-env name=CMAKE_CONFIGURE_ARGS::-DCMAKE_BUILD_TYPE=Release -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9"
echo "::set-env name=MAKE_CMD::make -j$(nproc)"
echo "::set-env name=MERGE_LIBS::$PWD/platforms/merge_libs_ar.sh"
echo "::set-env name=LINK_FLAGS::-mmacosx-version-min=10.9"
echo "::set-env name=C_XX_FLAGS::-mmacosx-version-min=10.9"
