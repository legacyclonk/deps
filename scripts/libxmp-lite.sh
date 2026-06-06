#!/bin/bash

set -e

VERSION=4.7.0

dl_ext_source "https://github.com/libxmp/libxmp/releases/download/libxmp-$VERSION/libxmp-lite-$VERSION.tar.gz"

mkdir build
pushd build

cmake "../libxmp-lite-$VERSION" -DLIBXMP_PIC=On -DBUILD_SHARED=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

grep -A1000 -m 1 "LICENSE" libxmp-lite-4.7.0/README | tail +3 > LICENSE
license libxmp-lite "LICENSE" MIT
