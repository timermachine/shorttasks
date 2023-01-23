#!/bin/bash
echo 'h ( githubcli gh ) shortcut script ~/.shorttasks/h.sh' 
[ $# -eq 0 ] && 
echo  'error: No params.' && 
echo 'first param optionally relative directory to execute gh commands in.' && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    returndir=$PWD
   # (yarn --cwd $1 && yarn $2 $3 $4 && yarn --cwd $returndir)
   (cd "$1" && gh $2 $3 $4 $5 $6 $7 $8 $9 && cd "$returndir" || exit)
else
    #just run yarn in current dir
    gh "$@"
fi
