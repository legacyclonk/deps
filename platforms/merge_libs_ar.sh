#!/bin/bash
set -e
LIBS=("${@/#/lib}")
mv "${LIBS[0]}.a" "_${LIBS[0]}.a"
for f in "_${LIBS[@]}"; do
	mkdir "$f"
	pushd "$f"
	ar -x "../$f.a"
	popd
done

FILES=(_${LIBS[@]/%//*})
ar -qc "${LIBS[0]}.a" "${FILES[@]}"

rm -r "_${LIBS[0]}.a" "_${LIBS[@]}"
