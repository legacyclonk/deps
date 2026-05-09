#!/bin/bash

set -e

VERSION=1.91.0-1
curl -L "https://github.com/boostorg/boost/releases/download/boost-$VERSION/boost-$VERSION-cmake.tar.gz" | tar xz

mkdir build
pushd build

cmake "../boost-$VERSION" -DBOOST_INCLUDE_LIBRARIES=json -DBOOST_RUNTIME_LINK=static -DBOOST_STAGEDIR="$OUTPUT_DIR" $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license Boost "boost-$VERSION/LICENSE_1_0.txt"
