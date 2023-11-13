#!/bin/bash

# Make sure we always start in the correct place
self_root="$HOME/.local/src/aseprite/"
cd "$self_root"

# Install build dependencies
sudo apt-get install -y \
    g++ \
    clang \
    libc++-dev \
    libc++abi-dev \
    cmake \
    ninja-build \
    libx11-dev \
    libxcursor-dev \
    libxi-dev \
    libgl1-mesa-dev \
    libfontconfig1-dev

# Build build dependencies
# Skia
mkdir -p deps
cd "$self_root/deps"
ln -s /bin/python3 python
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
git clone -b aseprite-m102 https://github.com/aseprite/skia.git
export PATH="$self_root/deps/:${PWD}/depot_tools:${PATH}"
cd skia
python tools/git-sync-deps
gn gen out/Release-x64 --args='is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false cc="clang" cxx="clang++" extra_cflags_cc=["-stdlib=libc++"] extra_ldflags=["-stdlib=libc++"]'
ninja -C out/Release-x64 skia modules

cd "$self_root"
git clone --recursive git@github.com:aseprite/aseprite aseprite
cd aseprite
git pull
git checkout "$(git tag -l --sort=refname | grep -v beta | tail -1)"
git submodule update --init --recursive

cd "$self_root/aseprite"
mkdir build
cd build
export CC=clang
export CXX=clang++
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
  -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$self_root/deps/skia \
  -DSKIA_LIBRARY_DIR=$self_root/deps/skia/out/Release-x64 \
  -DSKIA_LIBRARY=$self_root/deps/skia/out/Release-x64/libskia.a \
  -DCMAKE_C_COMPILER=$CC \
  -DCMAKE_CXX_COMPILER=$CXX \
  -G Ninja \
  ..
ninja aseprite

# Create executable link
ln -sf $self_root/aseprite/build/bin/aseprite $HOME/.local/bin/aseprite
