#!/bin/bash

set -e

VERSION=3.15.0

dl_ext_source "https://github.com/catchorg/Catch2/archive/refs/tags/v$VERSION.tar.gz"

mkdir build
pushd build

cmake "../Catch2-$VERSION" -DBUILD_TESTING=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license Catch2 "Catch2-$VERSION/LICENSE.txt"
