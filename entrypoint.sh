#!/bin/sh -l

# echo "Hello $1"

for f in slides/*.md; do
    [ -f "$f" ] || break
    echo "Found $f";
done


