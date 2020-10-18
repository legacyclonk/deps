#!/bin/bash
echo "CMAKE_BUILD_ARGS=--config Release" >> $GITHUB_ENV
echo "MERGE_LIBS=$PWD/platforms/merge_libs_vc.sh" >> $GITHUB_ENV
