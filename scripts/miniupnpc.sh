#!/bin/bash

set -e

VERSION=2.3.2

curl -L https://miniupnp.tuxfamily.org/files/miniupnpc-"$VERSION".tar.gz | tar -xz

pushd miniupnpc-"$VERSION"

mkdir build
pushd build

cmake .. $CMAKE_CONFIGURE_ARGS -DUPNPC_BUILD_STATIC=ON -DUPNPC_BUILD_SHARED=OFF -DUPNPC_BUILD_TESTS=OFF -DUPNPC_BUILD_SAMPLE=OFF
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license miniupnpc "LICENSE" "BSD 3-Clause"
popd
