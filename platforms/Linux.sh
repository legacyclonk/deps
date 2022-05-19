#!/bin/bash
echo "MAKE_CMD=make -j$(nproc)" >> $GITHUB_ENV
echo "MERGE_LIBS=$PWD/platforms/merge_libs_ar.sh" >> $GITHUB_ENV
echo "MESON_CONFIGURE_ARGS=-Ddefault_library=static" >> $GITHUB_ENV
