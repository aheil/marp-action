#!/bin/sh -l

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    fn=$(basename "$f" .md)
    echo "📄 Processing $fn ..."
    node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
done

cd /github/workspace/$1

repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

git init 

git config user.name "${{ github.actor }}"
git add *.pdf
git status 
git commit -m 'marp-action publish'