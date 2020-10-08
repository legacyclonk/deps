#!/bin/bash

set -e

VERSION=2.7.2

curl -L https://github.com/harfbuzz/harfbuzz/releases/download/"$VERSION"/harfbuzz-"$VERSION".tar.xz | tar -xJ

mkdir build
pushd build

cmake ../harfbuzz-"$VERSION" -DHB_BUILD_SUBSET=Off -DHB_HAVE_FREETYPE=On -DBUILD_SHARED_LIBS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

# Because the CMakeLists.txt doesn't take care of it...
if [ "$OS" = "Linux" ]; then
	sed -e "s@%prefix%@$OUTPUT_DIR@g" -e "s@%exec_prefix%@$OUTPUT_DIR@g" -e 's@%libdir%@${prefix}/lib@g' -e 's@%includedir%@${prefix}/include@g' -e "s/%VERSION%/$VERSION/g" -e 's/%libs_private%/-pthread/g' -e 's/%requires_private%/freetype2/g' ../harfbuzz-"$VERSION"/src/harfbuzz.pc.in > "$OUTPUT_DIR/lib/pkgconfig/harfbuzz.pc"
fi

popd
