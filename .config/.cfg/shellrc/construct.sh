#!/bin/bash
cat /etc/skel/.bashrc > $HOME/.bashrc
echo "for f in \$HOME/.config/.cfg/shellrc/*.common; do source \$f; done" >> $HOME/.bashrc
