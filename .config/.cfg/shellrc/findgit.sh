#!/bin/bash

findgit () {
	# skip links because we can't know that they are valid or safe
	# `-L` matches both links to files and links to directories
	if [ -L "$1" ]; then
		return
	fi
    # if not a directory, don't try to search it
    if ! [ -d "$1" ]; then
        return
    fi
    if [ -d "$1/.git" ]; then
        echo "$1"
        echo "->    $(builtin cd "$1" && git remote -v | head -1)"
    fi
    for i in "$1"/*; do
        # when no files are matched, it inserts a literal *, so avoid that.
        # this will fail on fail names that actually include a `*` (this is a bad idea anyway)
        if [[ "$i" != *'*' ]] && [ "$i" != "$1/.git" ] ; then
            findgit "$i"
        fi
    done
    # this one will never fail (unlike above) because there are always `.` and `..`
    for i in "$1"/.*; do
        if [ "$i" != "$1"/. ] && [ "$i" != "$1"/.. ]; then
            findgit "$i"
        fi
    done
}
