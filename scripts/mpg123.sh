#!/bin/bash

set -e

VERSION=1.29.3
curl -L https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-"$VERSION".tar.bz2 | tar -xj

mkdir build
pushd build

cmake ../mpg123-"$VERSION"/ports/cmake -DBUILD_SHARED_LIBS=Off -DBUILD_LIBOUT123=Off -DBUILD_PROGRAMS=Off -DNETWORK=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

# rm -f "$OUTPUT_DIR"/lib/{libz.so*,libz*.dylib,zlib.lib}

popd
