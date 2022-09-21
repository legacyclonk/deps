#!/bin/bash
echo "MAKE_CMD=make -j$(nproc)" >> $GITHUB_ENV
echo "MESON_CONFIGURE_ARGS=-Ddefault_library=static" >> $GITHUB_ENV
