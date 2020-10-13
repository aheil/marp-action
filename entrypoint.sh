#!/bin/sh -l

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    fn=$(basename "$f" .md)
    echo "📄 Processing $fn ..."
    node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
    git add "${fn}.pdf"
done

git status 
git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
git commit -m 'marp-action publish'
git push