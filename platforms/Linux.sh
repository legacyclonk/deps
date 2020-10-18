#!/bin/bash
echo "CMAKE_CONFIGURE_ARGS=-DCMAKE_BUILD_TYPE=Release" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(nproc)" >> $GITHUB_ENV
echo "MERGE_LIBS=$PWD/platforms/merge_libs_ar.sh" >> $GITHUB_ENV
