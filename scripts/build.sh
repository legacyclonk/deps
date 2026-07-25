#!/bin/bash

set -e

function abspath() {
    # generate absolute path from relative path
    # $1     : relative filename
    # return : absolute path
    if [ -d "$1" ]; then
        # dir
        (cd "$1"; pwd)
    elif [ -f "$1" ]; then
        # file
        if [[ $1 = /* ]]; then
            echo "$1"
        elif [[ $1 == */* ]]; then
            echo "$(cd "${1%/*}"; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}

SCRIPT_DIR=$(abspath "$(dirname "$0")")
. "$SCRIPT_DIR/utils.sh"

function license()
{
	if [ -n "$NOLICENSE" ] && [ "$NOLICENSE" != "0" ]; then
		return 0
	fi

	if [ $# -lt 2 ] || [ $# -gt 3 ]; then
		echo "USAGE: license <library name> <license file> [license name]" >&2
		return 1
	fi

	LICENSE_NAME=""
	if [ $# -eq 3 ]; then
		LICENSE_NAME="@$3"
	fi
	FILENAME=$(basename "$1")
	iconv -f UTF-8 -t Windows-1252 "$2" > "$OUTPUT_DIR/lc_licenses/$FILENAME"
	echo "list(APPEND LICENSES \""'${CMAKE_CURRENT_LIST_DIR}/lc_licenses/'"$FILENAME@$1$LICENSE_NAME\")" >>$OUTPUT_DIR/licenses.cmake
}
export -f license

if [ -n "$CHROOT" ]; then
	CHROOT_="$CHROOT"
	unset CHROOT
	$CHROOT_ "$0" "$@"
	exit $?
fi

export PATCH_DIR="$(cd "$(dirname "$0")/../patches"; pwd -P)"
OLDPWD="$PWD"
NAME="$1"
shift

mkdir "$NAME"
pushd "$NAME"
source "$OLDPWD"/scripts/"$NAME".sh "$@"
popd

rm -r "$NAME"
