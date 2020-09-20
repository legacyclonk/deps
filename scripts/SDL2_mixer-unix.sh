#!/bin/bash

set -e

VERSION=2.0.4

curl -L https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-"$VERSION".tar.gz | tar xz --exclude="Xcode*"

pushd SDL2_mixer-"$VERSION"
SDL_CFLAGS="-I$PWD/../../output/include" SDL_LIBS="-ldl -pthread $(echo $PWD/../../output/lib/*SDL2$LIBSUFFIX)" ./configure --enable-static --disable-shared --disable-music-opus --disable-music-mp3-mpg123-shared --disable-music-flac --disable-music-ogg-shared --disable-music-midi-fluidsynth --disable-music-midi-timidity --disable-music-mod-modplug-shared
$MAKE Makefile build build/libSDL2_mixer.la

LIBS=("$PWD"/build/.libs/*"$LIBSUFFIX")
INCLUDES=("$PWD"/SDL_mixer.h)
popd
