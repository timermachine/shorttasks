#!/bin/bash
echo 'ga ( git add ) shortcut script ~/.shorttasks/ga.sh' 
[ $# -eq 1 ] && [ "$1" == "." ] && echo 'dot'  && git add .  # ga .
[ $# -gt 1 ] && [ "$1" != "." ] && [ -d "$1" ] && echo '' &&  git -C $1 add $2 $3 $4 $5 $6 $7 $8 $9 # ga dirctory {$2...}
[ $# -eq 1 ] && [ "$1" != "." ] && [ -d "$1" ] && echo '' && git -C $1 add . &&  # ga directory -no floowing dot.
[ $# -eq 0 ] && echo '' &&  git add .  
[ $# -gt 0 ] && [ ! -d "$1" ] && echo '' &&  git add "$@"   # ga -v -o 
