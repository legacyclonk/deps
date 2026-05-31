#!/bin/bash

set -e

function dl_ext_source()
{
	if [ $# -lt 1 ] || [ $# -gt 2 ]; then
		echo "USAGE: source <url> [file extension]" >&2
		return 1
	fi

	URL="$1"
	if [ $# -eq 2 ]; then
		EXT="$2"
	else
		EXT="${URL##*.}"
	fi

	TAR_FLAG=""
	IS_ZIP=0
	case $EXT in
		"zip")
			IS_ZIP=1
			;;
		"tar")
			;;
		"gz" | "tgz")
			TAR_FLAG="-z"
			;;
		"xz")
			TAR_FLAG="-J"
			;;
		"bz2" | "tbz2")
			TAR_FLAG="-j"
			;;
		"zst")
			TAR_FLAG="--zstd"
			;;
		*)
			echo "Unknown extension: $EXT" >&2
			return 2
			;;
	esac

	FILE="source.tar.$EXT"
	curl "$URL" -L --retry-all-errors --retry 10 -C - -o "$FILE" || return 3

	if [ $IS_ZIP -eq 1 ]; then
		unzip "$FILE"
	else
		tar -x $TAR_FLAG -f "$FILE"
	fi

	rm "$FILE"
}
export -f dl_ext_source

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
