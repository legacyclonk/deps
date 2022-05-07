#!/bin/bash

set -e

VERSION=1.6.37

curl -L https://downloads.sourceforge.net/sourceforge/libpng/libpng-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../libpng-"$VERSION" -DPNG_SHARED=Off -DPNG_TESTS=Off -DSKIP_INSTALL_PROGRAMS=On -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . --target png_static $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS


popd

license libpng "libpng-$VERSION/LICENSE"
