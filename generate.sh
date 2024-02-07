#!/bin/sh
# SPDX-License-Identifier: CC0-1.0

# show us what we’re doing
set -x

# set the file path by generating the hash from $1, then
# removing the filename marker from sha512sum’s output
f=./files/"$(printf '%s' "$1"|sha512sum -b -|tr -d ' *-')"
export f

# does a file with this hash exist already?
# if so, is it the same data? in this case, we’re fine
if [ ! -f "$f" ]||[ "$(cat "$f")" = "$1" ]
then printf '%s' "$1">"$f"
# if we get to this point we’ve found a collision (two
# different files with the exact same hash). we overwrite
# the file and record it so that we can examine the history
# with git blame
else printf '%s' "$1">"$f"
printf '%s\n' "$f">>./collisions.txt
printf 'there is NO way you found a SHA-512 collision.
it’s been recorded in ./collisions.txt, but dude, *what*?
'
fi
