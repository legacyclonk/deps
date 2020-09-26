#!/bin/bash

set -e

VERSION=2.0.4

curl -L https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-"$VERSION".tar.gz | tar xz --exclude="Xcode*"

pushd SDL2_mixer-"$VERSION"
curl -L -O https://github.com/microsoft/vcpkg/raw/master/ports/sdl2-mixer/CMakeLists.txt

mkdir build
pushd build

cmake .. -DBUILD_SHARED_LIBS=Off -DSDL_MIXER_ENABLE_OGGVORBIS=On -DSDL_MIXER_ENABLE_NATIVEMIDI=On -DSDL_MIXER_ENABLE_MOD=On $CMAKE_CONFIGURE_ARGS
cmake --build . $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
popd
