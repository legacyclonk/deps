#!/bin/bash

set -e

VERSION=2.72
PATCH=1

curl -L https://download.gnome.org/sources/glib/"$VERSION"/glib-"$VERSION"."$PATCH".tar.xz | tar -xJ

meson glib-"$VERSION"."$PATCH" build -Dselinux=disabled -Dsysprof=disabled -Dman=false -Dgtk_doc=false -Dtests=false $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build
