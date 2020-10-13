#!/bin/sh -l

echo "src_folder $1"

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    echo "Found $f";
done


