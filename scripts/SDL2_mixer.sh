#!/bin/bash

set -e

VERSION=2.0.4

curl -L https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-"$VERSION".tar.gz | tar -xz --exclude="Xcode*"

pushd SDL2_mixer-"$VERSION"
curl -L -O https://github.com/microsoft/vcpkg/raw/master/ports/sdl2-mixer/CMakeLists.txt

curl -L https://hg.libsdl.org/SDL_mixer/raw-rev/b0afe341a91d | patch -Np3

mkdir build
pushd build

OS_OPTIONS=""

if [ "$OS" = "Linux" ]; then
	OS_OPTIONS="-DSDL_MIXER_ENABLE_FLUIDSYNTH=On"
	EXTRA_MERGE_LIBS=fluidsynth
fi

cmake .. -DBUILD_SHARED_LIBS=Off -DSDL_MIXER_ENABLE_OGGVORBIS=On -DSDL_MIXER_ENABLE_NATIVEMIDI=On -DSDL_MIXER_ENABLE_MOD=On $OS_OPTIONS $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
popd

pushd $OUTPUT_DIR/lib
$MERGE_LIBS SDL2_mixer modplug ogg vorbis vorbisfile $EXTRA_MERGE_LIBS
popd
