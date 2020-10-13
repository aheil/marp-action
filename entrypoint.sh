#!/bin/sh -l

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    fn=$(basename "$f" .md)
    marp --allow-local-files -o "${fn}.pdf"
done


