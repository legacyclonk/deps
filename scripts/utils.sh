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
