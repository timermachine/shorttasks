#!/bin/bash

echo "gpl (git pull) shorttask. (~/.shorttasks/gpl.sh)"

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    echo "gpl: git pull for $1"
    git -C "$1" pull "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
else
    #just run git status in current dir
    git pull "$@"
fi