#!/bin/sh -l

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    fn=$(basename "$f" .md)
    node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
done