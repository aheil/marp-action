#!/bin/sh -l

echo "src-dir: $1"

echo "ls: "

ls /github/workspace/$1

echo "files: "

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    echo "Found $f";
done


