#!/bin/bash

set -e

VERSION=2.1.0

curl -L https://downloads.sourceforge.net/glew/glew-"$VERSION".tgz | tar xz

pushd glew-"$VERSION"/build

cmake ./cmake -DBUILD_SHARED_LIBS=Off -DBUILD_UTILS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . --target glew_s $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
