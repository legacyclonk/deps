#!/bin/bash

set -e

VERSION=2.0.18

curl -L https://www.libsdl.org/release/SDL2-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

perl -i -pe's/SDL2-static/SDL2/g' ../SDL2-"$VERSION"/CMakeLists.txt

cmake ../SDL2-"$VERSION" -DBUILD_SHARED_LIBS=Off -DSDL_RENDER_METAL=Off -DSDL_METAL=Off  $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

LIBS=("$PWD"/"${OUTDIR}"*"$LIBSUFFIX")
popd
pushd SDL2-"$VERSION"
INCLUDES=("$PWD"/include/*)
popd
