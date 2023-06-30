#!/bin/bash

set -e

VERSION=1.82.0
VERSION_UNDERSCORE="${VERSION//./_}"

curl -L "https://boostorg.jfrog.io/artifactory/main/release/$VERSION/source/boost_$VERSION_UNDERSCORE.tar.gz" | tar -xz

pushd boost_$VERSION_UNDERSCORE

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
license Boost "boost_$VERSION_UNDERSCORE/LICENSE_1_0.txt"
