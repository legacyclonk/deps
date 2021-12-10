#!/bin/bash

set -e

VERSION=7.80.0

curl -L https://curl.haxx.se/download/curl-"$VERSION".tar.xz | tar -xJ

mkdir build
pushd build

OS_OPTIONS=""

if [ "$OS" = "Mac" ]; then
	OS_OPTIONS=-DCMAKE_USE_SECTRANSP=On
elif [ "$OS" = "Windows" ]; then
	OS_OPTIONS="-DCMAKE_USE_SCHANNEL=On -DENABLE_UNICODE=On"
fi

cmake ../curl-"$VERSION" -DBUILD_CURL_EXE=Off -DBUILD_SHARED_LIBS=Off -DHTTP_ONLY=On -DENABLE_MANUAL=Off -DCMAKE_USE_LIBSSH2=Off -DCMAKE_USE_LIBSSH=Off $OS_OPTIONS $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS


popd
