#!/bin/bash

set -e

VERSION=2.81
PATCH=0

curl -L https://download.gnome.org/sources/glib/"$VERSION"/glib-"$VERSION"."$PATCH".tar.xz | tar -xJ

meson glib-"$VERSION"."$PATCH" build -Dselinux=disabled -Dsysprof=disabled -Dman=false -Dgtk_doc=false -Dtests=false $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build

license GLib "glib-$VERSION.$PATCH/COPYING" "LGPL-2.1"
