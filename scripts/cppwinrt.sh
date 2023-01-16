#!/bin/bash

set -e

VERSION=2.0.221121.5

curl -o cppwinrt.zip -L https://www.nuget.org/api/v2/package/Microsoft.Windows.CppWinRT/"$VERSION"

mkdir build
pushd build

unzip ../cppwinrt.zip
mkdir -p "$OUTPUT_DIR/bin"
cp bin/cppwinrt.exe "$OUTPUT_DIR/bin"

popd
