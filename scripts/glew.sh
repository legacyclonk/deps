#!/bin/bash

set -e

VERSION=2.3.1

dl_ext_source "https://downloads.sourceforge.net/glew/glew-$VERSION.tgz"

pushd glew-"$VERSION"

patch -p1 <"$PATCH_DIR/glew_opengl_framework.patch"

pushd build

cmake ./cmake -DBUILD_UTILS=Off $CMAKE_CONFIGURE_ARGS
cmake --build . --target glew_s $CMAKE_BUILD_ARGS
cmake --install . $CMAKE_BUILD_ARGS

popd
popd

license GLEW "glew-$VERSION/LICENSE.txt"
