#!/bin/bash

set -e

VERSION=3.1.0

curl -L https://www.openssl.org/source/openssl-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

CFLAGS="$C_XX_FLAGS" CXXFLAGS="$C_XX_FLAGS" LDFLAGS="$LINK_FLAGS" ../openssl-"$VERSION"/config --prefix="$OUTPUT_DIR" --libdir=lib no-dso no-module no-shared no-tests
$MAKE_CMD
$MAKE_CMD install_sw

popd

license OpenSSL "openssl-$VERSION/LICENSE.txt"
