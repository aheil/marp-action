#!/bin/sh -l

echo "src-dir: $1"

echo "ls: "

ls /github/workflow/$1

echo "files: "

for f in /github/workflow/$1/*.md; do
    [ -f "$f" ] || break
    echo "Found $f";
done


