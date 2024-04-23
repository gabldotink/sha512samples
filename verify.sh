#!/bin/sh
# SPDX-License-Identifier: CC0-1.0 OR 0BSD
find ./files/ -type f -exec sh -c 'f="$1"
export f
[ "$(printf "%s" "$f")" = "$(cat "$f"|sha512sum -b -|tr -d " *-")" ]||printf "%s\n" "$f"' shell '{}' ';'
