#!/bin/bash

set -e

VERSION=10.2.1

curl -L -o fmt.zip "https://github.com/fmtlib/fmt/releases/download/$VERSION/fmt-$VERSION.zip"
7z x fmt.zip

mkdir build
pushd build

cmake "../fmt-$VERSION" -DFMT_DOC=OFF -DFMT_TEST=OFF $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license fmt "fmt-$VERSION/LICENSE" MIT
