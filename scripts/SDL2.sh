#!/bin/bash

set -e

VERSION=2.24.0
curl -L https://github.com/libsdl-org/SDL/releases/download/release-"$VERSION"/SDL2-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

perl -i -pe's/SDL2-static/SDL2/g' ../SDL2-"$VERSION"/CMakeLists.txt

cmake ../SDL2-"$VERSION" -DSDL_RENDER_METAL=Off -DSDL_METAL=Off  $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

LIBS=("$PWD"/"${OUTDIR}"*"$LIBSUFFIX")
popd
pushd SDL2-"$VERSION"
INCLUDES=("$PWD"/include/*)
popd

license SDL2 "SDL2-$VERSION/LICENSE.txt" zlib
