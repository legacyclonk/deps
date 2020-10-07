#!/bin/bash

set -e

VERSION=2.24
PATCH=32

curl -L https://download.gnome.org/sources/gtk+/"$VERSION"/gtk+-"$VERSION"."$PATCH".tar.xz | tar -xJ

mkdir build
pushd build

PKG_CONFIG_PATH="$OUTPUT_DIR/lib/pkgconfig" ../gtk+-"$VERSION"."$PATCH"/configure --prefix="$OUTPUT_DIR" --disable-shared --enable-static --disable-gtk-doc --disable-cups --disable-papi --disable-introspection
$MAKE_CMD
$MAKE_CMD install

popd
