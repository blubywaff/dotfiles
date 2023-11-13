#!/bin/bash

# Install build prerequisites
sudo apt-get install -y \
  build-essential \
  scons \
  pkg-config \
  libx11-dev \
  libxcursor-dev \
  libxinerama-dev \
  libgl1-mesa-dev \
  libglu-dev \
  libasound2-dev \
  libpulse-dev \
  libudev-dev \
  libxi-dev \
  libxrandr-dev

git clone git@github.com:godotengine/godot.git godot
cd godot

# Go to latest stable release
git_rev="$(git tag -l --sort=refname | grep stable | tail -1)"
git checkout "$git_rev"

# Create editor binary
scons platform=linuxbsd lto=full target=editor production=yes

# Create link so that editor appears in path
ln -s bin/*editor* $HOME/.local/bin/godot

# Create export template with encryption key
openssl rand -hex 32 > ../godot.gdkey
export SCRIPT_AES256_ENCRYPTION_KEY="$(cat ../godot.gdkey)"
scons platform=linuxbsd target=template_release production=yes
scons platform=linuxbsd target=template_debug

