#!/bin/sh -l

cd /github/workspace/$1

if [ -z $2 ]; then              # if $2 is not set  (i.e. no file list)
    for f in *.md; do           # we process all Markdown files in the given src-dir ($1)
        [ -f "$f" ] || break
        fn=$(basename "$f" .md)
        echo "📄 Processing $fn.md ..."
        node /home/marp/.cli/marp-cli.js $f --allow-local-files -o "${fn}.pdf"
        git add "${fn}.pdf"
    done
else 
    f=$(echo $2 | jq -c -r .[])
    echo "---> $f <---"
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
            echo 
            node /home/marp/.cli/marp-cli.js "$line" --allow-local-files -o "${fn}.pdf" #-> ohne diese Zeile läuft es zweimal für zwei Einträge
            # cd /github/workspace/$1
            #git add "${fn}.pdf"
            echo "foo"        
        else
            echo "ELSE -> not in directory"
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