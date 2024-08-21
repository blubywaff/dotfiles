#!/bin/bash

# check build prerequisites
sudo apt-get install -y ninja-build gettext cmake unzip curl

# clone the repo, place in predictable directory name
git clone --depth 1 --branch stable git@github.com:neovim/neovim.git neovim
cd neovim

# update in case already cloned
git checkout stable

# Maximum optimization, minimum debug
# Make install user local instead of system wide
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"

# packages as deb for easier removal
# This is a special case, being installed into the system
# cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# Install just for user, this avoids requiring superuser (still have to worry about apt above)
make install
