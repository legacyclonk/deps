#!/bin/bash
echo "::set-env name=MESON_CONFIGURE_ARGS::-Ddefault_library=static"
echo "::set-env name=CMAKE_CONFIGURE_ARGS::-DCMAKE_BUILD_TYPE=Release"
echo "::set-env name=MAKE_CMD::make -j$(nproc)"
echo "::set-env name=MERGE_LIBS::$PWD/platforms/merge_libs_ar.sh"
