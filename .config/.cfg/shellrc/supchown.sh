#!/bin/bash

supchown () {
	# skip links because we can't know that they are valid or safe
	# `-L` matches both links to files and links to directories
	if [ -L "$1" ]; then
		return
	fi
	# only print and chown files/directories that not already correct
	if ! [ "$(stat -c '%U:%G' "$1")" = "alex:alex" ]; then
		echo "$1"
		chown alex:alex "$1"
	fi
	# parameter is a directory
	if [ -d "$1" ]; then
		for i in "$1"/*; do
			# when no files are matched, it inserts a literal *, so avoid that.
			# this will fail on fail names that actually include a `*` (this is a bad idea anyway)
			if [[ "$i" != *'*' ]]; then
				supchown "$i"
			fi
		done
		# this one will never fail (unlike above) because there are always `.` and `..`
		for i in "$1"/.*; do
			if [ "$i" != "$1"/. ] && [ "$i" != "$1"/.. ]; then
				supchown "$i"
			fi
		done
	fi
}
