#!/bin/bash

set -e

VERSION=3.1.4.1
dl_ext_source "https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$VERSION/libjpeg-turbo-$VERSION.tar.gz"

mkdir build
pushd build

cmake ../libjpeg-turbo-"$VERSION" -DENABLE_SHARED=Off -DWITH_JPEG8=On -DWITH_TURBOJPEG=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS


popd

license libjpeg-turbo "libjpeg-turbo-$VERSION/LICENSE.md"
