#!/bin/bash

set -e

VERSION=2.40
PATCH=0

curl -L https://download.gnome.org/sources/gdk-pixbuf/"$VERSION"/gdk-pixbuf-"$VERSION"."$PATCH".tar.xz | tar -xJ

meson gdk-pixbuf-"$VERSION"."$PATCH" build -Dtiff=false -Dgir=false -Dinstalled_tests=false -Dbuiltin_loaders=all $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build
