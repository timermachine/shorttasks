#!/bin/bash
echo 'gs ( git status ) shortcut script ~/.shorttasks/gs.sh' 
if [ $# -eq 0 ] 
then
    # no params just vanilla:
    git status
else
    if [ -d "$1" ]
    then
        #if first param given, and it is a directory
          echo "gs for dir: $1" && 
          git -C "$1" status "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
    else
    git status "$@" 
    fi
fi
