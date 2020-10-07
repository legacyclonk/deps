#!/bin/bash

set -e

VERSION=1.16.0

curl -L https://cairographics.org/releases/cairo-"$VERSION".tar.xz | tar -xJ

mkdir build
pushd build

PKG_CONFIG_PATH="$OUTPUT_DIR/lib/pkgconfig" ../cairo-"$VERSION"/configure --prefix="$OUTPUT_DIR" --disable-shared --enable-static --disable-gtk-doc --disable-ps --disable-pdf --disable-svg --enable-ft
$MAKE_CMD
$MAKE_CMD install

popd
