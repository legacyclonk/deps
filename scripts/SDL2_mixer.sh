#!/bin/bash

set -e

VERSION=2.0.4

curl -L https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-"$VERSION".tar.gz | tar -xz --exclude="Xcode*"

pushd SDL2_mixer-"$VERSION"
curl -L -O https://github.com/microsoft/vcpkg/raw/master/ports/sdl2-mixer/CMakeLists.txt

mkdir build
pushd build

if [ "$OS" = "Linux" ]; then
	cat >> ../CMakeLists.txt <<EOF
find_package(FluidSynth REQUIRED)
target_include_directories(SDL2_mixer PRIVATE ${FLUIDSYNTH_INCLUDE_DIR})
target_compile_definitions(SDL2_mixer PRIVATE MUSIC_MID_FLUIDSYNTH)
EOF
	EXTRA_MERGE_LIBS=fluidsynth
fi

cmake .. -DBUILD_SHARED_LIBS=Off -DSDL_MIXER_ENABLE_OGGVORBIS=On -DSDL_MIXER_ENABLE_NATIVEMIDI=On -DSDL_MIXER_ENABLE_MOD=On -DCMAKE_MODULE_PATH=$OUTPUT_DIR/../cmake $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
popd

pushd $OUTPUT_DIR/lib
$MERGE_LIBS SDL2_mixer modplug ogg vorbis vorbisfile $EXTRA_MERGE_LIBS
popd
