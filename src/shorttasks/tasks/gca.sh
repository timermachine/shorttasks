#!/bin/bash

echo 'gca ( git commit -a -amend --no-edit ) shortcut script ~/.shorttasks/gca.sh' 
 [ "$1" = '-h' ] && echo 'gca (git add . && git commit --amend --no-edit)' && 
echo 'first param optional: relative directory to run git operation on.' && 
exit

if [ $# -eq 0 ] 
then
    # no params just vanilla:
    git add .
    git commit  -a --amend --no-edit
else
    if [ -d "$1" ]
    then
           git -C add . &&
          git -C "$1" commit  -a --amend --no-edit
    git status "$@" 
    fi
fi