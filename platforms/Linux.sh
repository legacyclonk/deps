#!/bin/bash
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --remove-all gcov

curl -L "https://github.com/legacyclonk/gcc-build/releases/download/$GCC_VERSION/gcc-$GCC_VERSION-$GCC_ARCH.tar.zst" | sudo tar -x --zstd -C /

echo "CMAKE_CONFIGURE_ARGS=$CMAKE_CONFIGURE_ARGS -DCMAKE_TOOLCHAIN_FILE=$PWD/platforms/custom_gcc.cmake" >> $GITHUB_ENV
echo "MAKE_CMD=make -j$(nproc)" >> $GITHUB_ENV
echo "MESON_CONFIGURE_ARGS=-Ddefault_library=static" >> $GITHUB_ENV

GCC_MAJOR=$(echo "$GCC_VERSION" | cut -d . -f 1)
echo "GCC_VERSION=$GCC_MAJOR" >> $GITHUB_ENV
