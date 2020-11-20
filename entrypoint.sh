#!/bin/sh -l

cd /github/workspace/$1

#for f in *.md; do
#    [ -f "$f" ] || break
#    fn=$(basename "$f" .md)
#    echo "📄 Processing $fn ..."
#    node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
#    git add "${fn}.pdf"
#done

#echo $2

#echo $f

if [ -z $2 ]; then  # if $2 is not set
    for f in *.md; do
        [ -f "$f" ] || break
        fn=$(basename "$f" .md)
        echo "📄 Processing $fn.md ..."
        node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
        git add "${fn}.pdf"
    done
else 
    f=$(echo $2 | jq -c -r .[])
    echo "$f" | while IFS= read -r line ; do
        if [ $(dirname $line) = $1 ]; then
            echo "DIRNAME:"
            echo $(dirname $line);            
            echo "BASENAME"
            echo $(basename $line .md);
            fn=$(basename $line .md)
            echo "📄 Processing $fn ..."
            echo "LINE"
            echo $line
            node /home/marp/.cli/marp-cli.js $line --allow-local-files -o "${fn}.pdf"
            #git add "${fn}.pdf"            
        else
            echo "ELSE"
             echo "DIRNAME:"
            echo $(dirname $line);            
            echo "BASENAME"
            echo $(basename $line .md);
            fn=$(basename $line .md)
            echo "📄 Processing $fn ..."
            echo "LINE"
            echo $line
        fi
    done
fi


#git status 
#git config user.name "$GITHUB_ACTOR"
#git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
#git commit -m 'marp-action publish'
#git push