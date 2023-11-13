#!/bin/bash

# check build prerequisites
sudo apt-get install -y ninja-build gettext cmake unzip curl

# clone the repo, place in predictable directory name
git clone --depth 1 --branch stable git@github.com:neovim/neovim.git neovim
cd neovim

# update in case already cloned
git checkout stable

# Maximum optimization, minimum debug
make CMAKE_BUILD_TYPE=Release

# packages as deb for easier removal
# This is a special case, being installed into the system
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
