#!/bin/bash

set -e

VERSION=0.8.9.0

curl -L https://downloads.sourceforge.net/modplug-xmms/libmodplug-"$VERSION".tar.gz | tar -xz

pushd libmodplug-"$VERSION"
curl -L -O https://github.com/Konstanty/libmodplug/raw/c855db2a0938aaac4bd686a345e0d1b09564f181/CMakeLists.txt

mv src/modplug.h src/modplug.h.orig
echo "#define MODPLUG_STATIC" > src/modplug.h
cat src/modplug.h.orig >> src/modplug.h

mkdir build
pushd build

cmake .. -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
popd
