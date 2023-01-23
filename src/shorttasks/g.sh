#!/bin/bash

# todo: switch to -h
# [ $# -eq 0 ] && 
# echo 'g ( git ) shortcut script ~/.shorttasks/g.sh' 
# echo  'error: No params.' && 
# echo 'first param optionally relative directory to execute git commands in.' && 
# exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C $1 $2 $3 $4 $5 $6 $7 $8 $9
else
    #just run git in current dir
    git $1 $2 $3 $4 $5 $6 $7 $8 $9
fi