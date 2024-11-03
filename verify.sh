#!/bin/sh
# SPDX-License-Identifier: CC0-1.0 OR 0BSD
find ./files -type f -exec sh -c 'f="$1"
export f
s="$(basename "$f")"
export s
if [ "$(printf "%s" "$s")" = "$(cat "$f"|sha512sum -b -|tr -d " *-")" ]
then printf "✅ %s
" "$s"
else printf "❌ %s
" "$s"
fi' shell '{}' ';'
