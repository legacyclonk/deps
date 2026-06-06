#!/bin/bash

set -e

VERSION=2.5.4

dl_ext_source https://github.com/FluidSynth/fluidsynth/archive/v"$VERSION".tar.gz

pushd fluidsynth-"$VERSION"
patch -p1 <"$PATCH_DIR/Fluidsynth_no_binary.patch"
popd

mkdir build
pushd build


cmake ../fluidsynth-"$VERSION" -DLIB_SUFFIX="" -Denable-aufile=Off -Denable-libinstpatch=Off -Denable-libsndfile=Off -Denable-midishare=Off -Denable-sdl3=On -Denable-systemd=Off -Denable-readline=Off -Denable-alsa=Off -Denable-pulseaudio=Off -Denable-pipewire=Off -Denable-oss=Off -Denable-openmp=Off -Denable-ipv6=Off -Denable-network=Off -Denable-jack=Off -Denable-dbus=Off -Denable-dsound=Off -Denable-wasapi=Off -Denable-waveout=Off -Denable-limiter=Off -Denable-framework=Off -DCMAKE_SKIP_RPATH=On $CMAKE_CONFIGURE_ARGS
cmake --build . --target libfluidsynth $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd

license FluidSynth "fluidsynth-$VERSION/LICENSE" "LGPL-2.1"
