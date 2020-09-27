#!/bin/bash

set -e

VERSION=1.2.11

curl -L http://zlib.net/zlib-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../zlib-"$VERSION" -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

rm -f $OUTPUT_DIR/lib/{libz.so*,libz*.dylib,zlib.lib}

popd
