#!/bin/sh
# SPDX-License-Identifier: CC0-1.0 OR 0BSD
find ./files -type f -exec sh -c 's="$(basename "$1")"
if [ "$(printf "%s" "$s")" = "$(cat "$1"|sha512sum -b -|tr -d " *-")" ]
then printf "✅ %s
" "$s"
else printf "❌ %s
" "$s"
fi' shell '{}' ';'
