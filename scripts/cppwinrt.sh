#!/bin/bash

set -e

VERSION=2.0.230524.4

mkdir build
pushd build

dl_ext_source https://www.nuget.org/api/v2/package/Microsoft.Windows.CppWinRT/"$VERSION" zip

mkdir -p "$OUTPUT_DIR/bin"
cp bin/cppwinrt.exe "$OUTPUT_DIR/bin"

popd
