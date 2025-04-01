#!/bin/bash
gitdir="${HOME}/.config/.cfg/.git-dir/"
mkdir -p ${gitdir}
/bin/git clone --bare https://github.com/blubywaff/dotfiles.git ${gitdir}
/bin/git --git-dir=${gitdir} --work-tree=${HOME} checkout -f
/bin/git --git-dir=${gitdir} --work-tree=${HOME} config status.showUntrackedFiles no
