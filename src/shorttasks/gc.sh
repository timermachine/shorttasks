#!/bin/bash
echo 'gc ( git commit) shortcut script ~/.shorttasks/gc.sh' 
[ $# -eq 0 ] || [ "$1" == "-m" ] && 
echo "Usage:" && 
echo "gc 'message' [generates: git commit -m 'message'] ( Note no -m needed )" && 
echo "gc path 'message' [generates: git commit -C path -m 'message']" && exit

#  && echo "error: No params. first param optionally relative directory to run git commit. second param: quoted commit message" && exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C $1 commit -m "$2"
else
    #just run git status in current dir
    git commit -m "$1"
fi