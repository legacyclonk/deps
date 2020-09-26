#!/bin/bash

set -e

if [ -n "$CHROOT" ]; then
	CHROOT_="$CHROOT"
	unset CHROOT
	$CHROOT_ "$0" "$@"
	exit $?
fi

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

rm -r "$NAME"
