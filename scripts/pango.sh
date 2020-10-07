#!/bin/bash

set -e

VERSION=1.47
PATCH=0

curl -L https://download.gnome.org/sources/pango/"$VERSION"/pango-"$VERSION"."$PATCH".tar.xz | tar -xJ

perl -i -pe"s/subdir\('(utils|examples|tests|tools)'\)//g" pango-"$VERSION"."$PATCH"/meson.build

meson pango-"$VERSION"."$PATCH" build -Dintrospection=false -Dgtk_doc=false $MESON_CONFIGURE_ARGS
meson compile -C build
meson install -C build
