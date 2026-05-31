#!/bin/bash

set -e

VERSION=1.33.5
dl_ext_source "https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-$VERSION.tar.bz2"

pushd mpg123-"$VERSION"
patch -p1 <"$PATCH_DIR/mpg123_all_arm64_have_fpu.patch"
popd

mkdir build
pushd build

cmake ../mpg123-"$VERSION"/ports/cmake -DBUILD_LIBOUT123=Off -DBUILD_PROGRAMS=Off -DNETWORK=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license libmpg123 "mpg123-$VERSION/COPYING" "LGPL-2.1"
