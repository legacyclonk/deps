#!/bin/bash
echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(nproc)" >> $GITHUB_ENV
echo "MERGE_LIBS=$PWD/platforms/merge_libs_ar.sh" >> $GITHUB_ENV
echo "LINK_FLAGS=-mmacosx-version-min=10.9" >> $GITHUB_ENV
echo "C_XX_FLAGS=-mmacosx-version-min=10.9" >> $GITHUB_ENV
