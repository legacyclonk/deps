#!/bin/bash

set -e

VERSION=3.4.10
dl_ext_source "https://github.com/libsdl-org/SDL/releases/download/release-$VERSION/SDL3-$VERSION.tar.gz"

mkdir build
pushd build

cmake ../SDL3-"$VERSION" \
-DSDL_SHARED=Off \
-DSDL_STATIC=On \
-DSDL_METAL=Off \
-DSDL_RENDER_METAL=Off \
-DSDL_TESTS=Off \
-DSDL_INSTALL_DOCS=Off \
-DSDL_RELOCATABLE=On \
-DSDL_SYSTEM_ICONV=On \
-DSDL_FRIBIDI=Off \
-DSDL_LIBTHAI=Off \
$CMAKE_CONFIGURE_ARGS

cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license SDL3 "SDL3-$VERSION/LICENSE.txt" zlib
