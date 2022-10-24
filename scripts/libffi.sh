#!/bin/bash

set -e

VERSION=3.4.4

curl -L https://github.com/libffi/libffi/releases/download/v"$VERSION"/libffi-"$VERSION".tar.gz | tar -xz

pushd libffi-"$VERSION"

CFLAGS="$C_XX_FLAGS" CXXFLAGS="$C_XX_FLAGS" LDFLAGS="$LINK_FLAGS" ./configure --prefix="$OUTPUT_DIR" --disable-docs --disable-shared --enable-static=yes --disable-multi-os-directory
$MAKE_CMD
$MAKE_CMD install

license libffi "LICENSE"

popd
