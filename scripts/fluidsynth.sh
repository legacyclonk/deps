#!/bin/bash

set -e

VERSION=2.1.7

curl -L https://github.com/FluidSynth/fluidsynth/archive/v"$VERSION".tar.gz | tar -xz

mkdir build
pushd build

cmake ../fluidsynth-"$VERSION" -DLIB_SUFFIX="" -DBUILD_SHARED_LIBS=Off -Denable-aufile=Off -Denable-libinstpatch=Off -Denable-libsndfile=Off -Denable-midishare=Off -Denable-sdl2=On -Denable-systemd=Off -Denable-readline=Off -Denable-alsa=Off -Denable-pulseaudio=Off -Denable-oss=Off $CMAKE_CONFIGURE_ARGS
cmake --build . --target libfluidsynth $CMAKE_BUILD_ARGS
touch src/fluidsynth
cmake --install . $CMAKE_BUILD_ARGS

rm $OUTPUT_DIR/bin/fluidsynth

popd
