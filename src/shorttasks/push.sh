#!/bin/bash

echo "push (git push) shorttask. (~/.shorttasks/push.sh)"

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    echo "git push for $1"
    git -C $1 push $2 $3 $4 $5 $6 $7 $8 $9
else
    #just run git  in current dir
    git push "$@"
fi
