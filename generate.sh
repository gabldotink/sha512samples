#!/bin/sh
f="./files/$(printf '%s' "$1"|sha512sum -b|tr -d ' *-')"
if [ ! -f "$f" ]||[ "$(cat "$f")" = "$1" ]
then printf '%s' "$1">"$f"
else printf '%s' "$1">"$f"
printf '%s
' "$f">>./collisions.txt
fi
