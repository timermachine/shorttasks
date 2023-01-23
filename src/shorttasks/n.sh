#!/bin/bash
# can run with no params - so hush this out:
# echo 'n ( npm run ) shortcut script ~/.shorttasks/n.sh' 

[ $# -eq 0 ] && echo "n (npm run) shortcut script ~/.shorttasks/n.sh) error: No params." && 
echo  'first param optionally relative directory to run npm in.' && 
echo 'eg: n app start' && 
echo "eg: n app (lists app/package.json's scripts)" && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    returndir=$PWD
   # (npm --cwd $1 && npm $2 $3 $4 && npm --cwd $returndir)
   (cd "$1" && npm run $2 $3 $4 $5 $6 $7 $8 $9 && cd "$returndir" || exit)
else
    #just run npm in current dir
    npm "$@"
fi


