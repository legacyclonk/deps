#!/bin/bash

set -e

OLDPWD="$PWD"
NAME="$1"
shift

mkdir "$NAME"
pushd "$NAME"
source "$OLDPWD"/scripts/"$NAME".sh "$@"
popd

echo "$PWD"
if [ -n "$LIBS" ]; then cp "${LIBS[@]}" output/lib/; fi
if [ -n "$INCLUDES" ]; then cp -r "${INCLUDES[@]}" output/include/; fi
