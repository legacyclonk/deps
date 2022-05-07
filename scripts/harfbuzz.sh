#!/bin/bash

set -e

VERSION=4.2.1

curl -L https://github.com/harfbuzz/harfbuzz/releases/download/"$VERSION"/harfbuzz-"$VERSION".tar.xz | tar -xJ

mkdir build
pushd build

cmake ../harfbuzz-"$VERSION" -DHB_BUILD_SUBSET=Off -DHB_HAVE_FREETYPE=On -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license HarfBuzz "harfbuzz-$VERSION/COPYING" '\"Old MIT\"'
