#!/bin/bash

set -e

VERSION=v1.x

git clone --depth 1 --branch $VERSION https://github.com/gabime/spdlog spdlog

mkdir build
pushd build

cmake ../spdlog \
    -DSPDLOG_ENABLE_PCH=ON \
    -DSPDLOG_BUILD_EXAMPLE=OFF \
    -DSPDLOG_USE_STD_FORMAT=ON \
    -DSPDLOG_DISABLE_DEFAULT_LOGGER=ON \
    $CMAKE_CONFIGURE_ARGS

cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license spdlog spdlog/LICENSE
