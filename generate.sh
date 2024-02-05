#!/bin/sh
# SPDX-License-Identifier: CC0-1.0
set -x
readonly POSIXLY_CORRECT
export POSIXLY_CORRECT

f=./files/"$(printf '%s' "$1"|\
             sha512sum -b -|\
             tr -d ' *-')"

if [ ! -f "$f" ]||
   [ "$(cat "$f")" = "$1" ];then
  printf '%s' "$1">"$f"
else
  printf '%s' "$f" >> ./collisions.txt
  printf \
'there is NO way you found a SHA-512 collision.
it’s been recorded in ./collisions.txt, but dude, *what*?\n'
fi
