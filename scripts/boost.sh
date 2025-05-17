#!/bin/bash

set -e

VERSION=1.88.0
curl -L "https://github.com/boostorg/boost/releases/download/boost-$VERSION/boost-$VERSION-b2-nodocs.tar.gz" | tar xz

pushd boost-$VERSION

if [ "$OS" = "Windows" ]; then
	./bootstrap.bat
else
	./bootstrap.sh
fi

./b2 tools/bcp

mkdir output
dist/bin/bcp json output

mkdir -p "$OUTPUT_DIR/include"
cp -r output/boost "$OUTPUT_DIR/include"

popd
license Boost "boost-$VERSION/LICENSE_1_0.txt"
