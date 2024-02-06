#!/usr/bin/env bash
# SPDX-License-Identifier: CC0-1.0
set -x
f=./files/"$(printf '%s' "$1"|sha512sum -b -|tr -d ' *-')"
if [[ ! -f "$f" ]]||[[ "$(<"$f")" == "$1" ]]
then printf '%s' "$1">"$f"
else printf '%s' "$1">"$f"
printf '%s\n' "$f">>./collisions.txt
printf 'there is NO way you found a SHA-512 collision.
it’s been recorded in ./collisions.txt, but dude, *what*?
'
fi
