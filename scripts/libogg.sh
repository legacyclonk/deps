#!/bin/bash

set -e

VERSION=1.3.6

dl_ext_source "https://ftp.osuosl.org/pub/xiph/releases/ogg/libogg-$VERSION.tar.gz"

mkdir build
pushd build

cmake ../*ogg-* $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license libogg *ogg-*/COPYING
