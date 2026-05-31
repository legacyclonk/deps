#!/bin/bash

set -e

VERSION=12.1.0

dl_ext_source "https://github.com/fmtlib/fmt/archive/refs/tags/$VERSION/$VERSION.tar.gz"

mkdir build
pushd build

cmake "../fmt-$VERSION" -DFMT_DOC=OFF -DFMT_TEST=OFF $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license fmt "fmt-$VERSION/LICENSE" MIT
