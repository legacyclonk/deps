#!/bin/bash

set -e

VERSION=1.1.1h

curl -L https://www.openssl.org/source/openssl-"$VERSION".tar.gz | tar xz

mkdir build
pushd build

../openssl-"$VERSION"/config --prefix="$OUTPUT_DIR" no-shared no-tests
$MAKE_CMD
$MAKE_CMD install_sw

popd
