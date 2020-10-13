#!/bin/sh -l

cd /github/workspace/$1

repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

git init
git remote add github "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git"
git pull github ${GITHUB_REF} --ff-only

for f in /github/workspace/$1/*.md; do
    [ -f "$f" ] || break
    fn=$(basename "$f" .md)
    echo "📄 Processing $fn ..."
    node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
    git add "${fn}.pdf"
done

git status 
git commit -m 'marp-action publish'