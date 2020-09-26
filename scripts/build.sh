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

rm -r "$NAME"
