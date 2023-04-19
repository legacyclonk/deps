#!/bin/bash

set -e

VERSION=2.1.5.1
curl -L https://downloads.sourceforge.net/project/libjpeg-turbo/"$VERSION"/libjpeg-turbo-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../libjpeg-turbo-"$VERSION" -DENABLE_SHARED=Off -DWITH_JPEG8=On -DWITH_TURBOJPEG=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS


popd

license libjpeg-turbo "libjpeg-turbo-$VERSION/LICENSE.md"
