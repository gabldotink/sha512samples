#!/bin/sh
d="$1"
export d
f="./files/$(printf '%s' "$d"|sha512sum -b|tr -d ' *-')"
export f
if [ ! -f "$f" ]||[ "$(cat "$f")" = "$d" ]
then printf '%s' "$d">"$f"
else printf '%s' "$d">"$f"
printf '%s
' "$f">>./collisions.txt
fi
