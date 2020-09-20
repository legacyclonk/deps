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
cp "${LIBS[@]}" output/lib/
cp -r "${INCLUDES[@]}" output/include/
