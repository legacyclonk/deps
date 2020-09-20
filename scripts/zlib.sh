#!/bin/bash

set -e

VERSION=1.2.11

curl -L http://zlib.net/zlib-"$VERSION".tar.gz | tar xz

mkdir build
pushd build

cmake ../zlib-"$VERSION" -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . --target zlibstatic $CMAKE_BUILD_ARGS

LIBS=("$PWD"/"${OUTDIR}"*"$LIBSUFFIX")
ZCONF="$PWD"/zconf.h
popd
pushd zlib-"$VERSION"
INCLUDES=($ZCONF "$PWD/zlib.h")
popd
