#!/bin/bash
set -e
LIBS=("${@/%/.lib}")
mv "${LIBS[0]}" "_${LIBS[0]}"
lib.exe //out:"${LIBS[0]}" "_${LIBS[@]}"
rm "_${LIBS[0]}"
