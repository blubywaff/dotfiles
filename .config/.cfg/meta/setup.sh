#!/bin/bash
mkdir -p $HOME/.config/.cfg/.git-dir/
/bin/git clone --bare git@github.com:blubywaff/dotfiles.git
/bin/git --git-dir=$HOME/.config/.cfg/.git-dir/ --work-tree=$HOME checkout -f
/bin/git --git-dir=$HOME/.config/.cfg/.git-dir/ --work-tree=$HOME config status.showUntrackedFiles no
