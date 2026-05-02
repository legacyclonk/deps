#!/bin/bash

set -e

VERSION=12.1.0

curl -L "https://github.com/fmtlib/fmt/archive/refs/tags/$VERSION/$VERSION.tar.gz" | tar xz

mkdir build
pushd build

cmake "../fmt-$VERSION" -DFMT_DOC=OFF -DFMT_TEST=OFF $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license fmt "fmt-$VERSION/LICENSE" MIT
