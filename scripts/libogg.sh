#!/bin/bash

set -e

# VERSION=1.3.4

# curl -L https://ftp.osuosl.org/pub/xiph/releases/ogg/libogg-"$VERSION".tar.gz | tar -xz
curl -L https://github.com/xiph/ogg/archive/c8fca6b4a02d695b1ceea39b330d4406001c03ed.tar.gz | tar -xz

mkdir build
pushd build

cmake ../*ogg-* -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
