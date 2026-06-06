#!/bin/bash

set -e

VERSION=3.2.4

dl_ext_source "https://github.com/libsdl-org/SDL_mixer/releases/download/release-$VERSION/SDL3_mixer-$VERSION.tar.gz"

pushd SDL3_mixer-"$VERSION"

mkdir build
pushd build

perl -i -pe's/SDL3_mixer-static/SDL3_mixer/g' ../CMakeLists.txt

cmake .. \
	-DSDLMIXER_MIDI_FLUIDSYNTH=ON \
	-DSDLMIXER_DEPS_SHARED=OFF \
	-DSDLMIXER_VENDORED=OFF \
	-DSDLMIXER_INSTALL=ON \
	-DSDLMIXER_FLAC=OFF \
	-DSDLMIXER_GME=OFF \
	-DSDLMIXER_MOD_XMP=ON \
	-DSDLMIXER_MP3_DRMP3=OFF \
	-DSDLMIXER_MP3_MPG123=ON \
	-DSDLMIXER_OPUS=OFF \
	-DSDLMIXER_VORBIS_STB=OFF \
	-DSDLMIXER_VORBIS_VORBISFILE=ON \
	-DSDLMIXER_WAVPACK=OFF \
	-DSDLMIXER_AU=OFF \
	-DSDLMIXER_TESTS=OFF \
	-DSDLMIXER_EXAMPLES=OFF \
	$CMAKE_CONFIGURE_ARGS

cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license SDL3_mixer "LICENSE.txt" zlib
popd
