#!/bin/bash

set -e

VERSION=0.40.0

curl -L https://cairographics.org/releases/pixman-"$VERSION".tar.gz | tar -xz

meson pixman-"$VERSION" build -Dgtk=disabled $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build
