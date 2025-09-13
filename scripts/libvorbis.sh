#!/bin/bash

set -e

VERSION=1.3.7

curl -L https://ftp.osuosl.org/pub/xiph/releases/vorbis/libvorbis-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../libvorbis-"$VERSION" -DCMAKE_POLICY_VERSION_MINIMUM=3.5 $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license libvorbis "libvorbis-$VERSION/COPYING" "BSD 3-Clause"
