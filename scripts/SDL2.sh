#!/bin/bash

set -e

VERSION=2.26.5
curl -L https://github.com/libsdl-org/SDL/releases/download/release-"$VERSION"/SDL2-"$VERSION".tar.gz | tar -xz

pushd SDL2-"$VERSION"
patch -p1 <"$PATCH_DIR/SDL2_macos_context_deletion_black_screen.patch"
python3 -c "import pathlib; p = pathlib.Path('cmake/sdlchecks.cmake'); p.write_bytes(p.read_bytes().replace(b'list(APPEND SDL_REQUIRES_PRIVATE SampleRate::samplerate)', b'list(APPEND EXTRA_LIBS samplerate)'))"
# Add support for libsamplerate's "linear" resampling mode
curl -L https://github.com/libsdl-org/SDL/commit/9b861d2ea4fbae0718a0c1ac37397ed5ba2a5b67.patch | patch -p1
popd

mkdir build
pushd build

perl -i -pe's/SDL2-static/SDL2/g' ../SDL2-"$VERSION"/CMakeLists.txt

cmake ../SDL2-"$VERSION" \
-DSDL_LIBSAMPLERATE=On \
-DSDL_LIBSAMPLERATE_SHARED=Off \
-DSDL_METAL=Off \
-DSDL_RENDER_METAL=Off \
-DSDL_TEST=Off \
$CMAKE_CONFIGURE_ARGS

cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license SDL2 "SDL2-$VERSION/LICENSE.txt" zlib
