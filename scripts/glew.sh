#!/bin/bash

set -e

VERSION=2.1.0

curl -L https://downloads.sourceforge.net/glew/glew-"$VERSION".tgz | tar xz

pushd glew-"$VERSION"
pushd build

cmake ./cmake -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . --target glew_s $CMAKE_BUILD_ARGS

LIBS=("$PWD"/lib/"${OUTDIR}"*"$LIBSUFFIX")
popd
INCLUDES=("$PWD"/include/*)
popd
