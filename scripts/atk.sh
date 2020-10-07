#!/bin/bash

set -e

VERSION=2.36
PATCH=0

curl -L https://download.gnome.org/sources/atk/"$VERSION"/atk-"$VERSION"."$PATCH".tar.xz | tar -xJ

meson atk-"$VERSION"."$PATCH" build -Dintrospection=false -Ddocs=false $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build
