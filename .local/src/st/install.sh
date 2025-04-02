#!/bin/bash

err() {
    echo $2
    exit $1
}

# check if st cloned already
# if so pull, if not clone
if ! [ -d st ]; then
    git clone --depth 1 --branch master https://git.suckless.org/st || err 1 "Could not clone"
fi
cd st || err 1 "No source directory"
# restore before advance (b/c patches)
git restore . || err 1 "Could not restore"
git fetch || err 1 "Could not fetch"
git checkout master || err 1 "Could not checkout"
# apply patches
git apply ../patches/* || err 1 "Patches failed"
# build
make install
