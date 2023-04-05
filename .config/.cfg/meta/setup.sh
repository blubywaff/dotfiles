#!/bin/bash
mkdir -p $HOME/.config/.cfg/.git-dir/
/bin/git clone --bare git@github.com:Blubywaff/dotfiles.git
/bin/git --git-dir=$HOME/.cfg/.git-dir/ --work-tree=$HOME checkout -f

