#!/bin/sh
# SPDX-License-Identifier: CC0-1.0 OR 0BSD
d="$1"
export d
f=./files/"$(printf '%s' "$d"|sha512sum -b -|tr -d ' *-')"
export f
if [ ! -f "$f" ]||[ "$(cat "$f")" = "$d" ]
then printf '%s' "$d">"$f"
else printf '%s' "$d">"$f"
printf '%s
' "$f">>./collisions.txt
printf 'there is NO way you found a SHA-512 collision.
it’s been recorded in ./collisions.txt, but dude, *what*?
'
fi
