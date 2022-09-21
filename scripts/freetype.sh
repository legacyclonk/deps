#!/bin/bash

set -e

VERSION=2.12.1

curl -L https://download-mirror.savannah.gnu.org/releases/freetype/freetype-"$VERSION".tar.gz | tar -xz

pushd freetype-"$VERSION"
patch -p1 <"$PATCH_DIR/freetype.patch"
popd

mkdir build
pushd build

cmake ../freetype-"$VERSION" -DCMAKE_DISABLE_FIND_PACKAGE_BrotliDec=TRUE -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE "$@" $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
license freetype "freetype-$VERSION/docs/FTL.TXT"
