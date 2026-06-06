#!/bin/bash

set -e

VERSION=1.18.0

dl_ext_source "https://github.com/kthohr/gcem/archive/refs/tags/v$VERSION.tar.gz"

mkdir build
pushd build

cmake "../gcem-$VERSION" -DCMAKE_POLICY_VERSION_MINIMUM=3.10 $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license gcem "gcem-$VERSION/LICENSE" "Apache 2.0"
