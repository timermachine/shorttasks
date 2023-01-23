#!/bin/bash

# can run with no params - so hush this out:
# echo 'pn ( pnpm ) shortcut script ~/.shorttasks/pnpm.sh' 

[ $# -eq 0 ] && echo 'pn (pnpm run) shortcut script ~/.shorttasks/pn.sh) error: No params.' && 
echo  'first param optionally relative directory to run pnpm in.' && 
echo 'eg: pn app start' && 
echo "eg: pn app (lists app/package.json's scripts)" && 
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


