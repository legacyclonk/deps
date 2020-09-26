#!/bin/bash
echo "::set-env name=CMAKE_CONFIGURE_ARGS::-DCMAKE_BUILD_TYPE=Release"
echo "::set-env name=MAKE_CMD::make -j$(nproc)"
