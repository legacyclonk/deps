#!/bin/bash

set -e

VERSION=2.12.0

curl -L https://download-mirror.savannah.gnu.org/releases/freetype/freetype-"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../freetype-"$VERSION" -DCMAKE_DISABLE_FIND_PACKAGE_BrotliDec=TRUE -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE -DBUILD_SHARED_LIBS=Off "$@" $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
license freetype "freetype-$VERSION/docs/FTL.TXT"

if [ -e $OUTPUT_DIR/lib/*harfbuzz* ]; then
	pushd $OUTPUT_DIR/lib
	$MERGE_LIBS freetype harfbuzz
	popd
fi
