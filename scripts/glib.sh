#!/bin/bash

set -e

VERSION=2.66
PATCH=1

curl -L https://download.gnome.org/sources/glib/"$VERSION"/glib-"$VERSION"."$PATCH".tar.xz | tar -xJ

meson glib-"$VERSION"."$PATCH" build -Dselinux=disabled -Dsysprof=enabled -Dman=false -Dgtk_doc=false $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build
