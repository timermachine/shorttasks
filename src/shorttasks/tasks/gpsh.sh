#!/bin/bash

echo "gpsh (git push) shorttask. (~/.shorttasks/gpsh.sh)"

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    echo "git push for $1"
    git -C $1 push -v
else
    #just run git  in current dir
    git push "$@"
fi
