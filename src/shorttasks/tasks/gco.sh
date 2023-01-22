#!/bin/bash
echo 'gco ( git checkout -b) shortcut script ~/.shorttasks/gco.sh' 
[ $# -eq 0 ] || [ "$1" == "-m" ] && 
echo "Usage:" && 
echo "gco feature/someexample [generates: git checkout -b feature/someexample] ( Note no -b needed ) 12 chars saved!" && 
echo "gco path/ branchname [generates: git checkout -b path branchname]" && exit

#  && echo "error: No params. first param optionally relative directory to run git commit. second param: quoted commit message" && exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C $1 checkout -b "$2"
else
    #just run git status in current dir
    git checkout -b "$1"
fi