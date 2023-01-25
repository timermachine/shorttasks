#!/bin/bash


cmd="git add . && git commit  -a --amend --no-edit"


applicable=".git"

[ "$1" = '-h' ] && 
echo "gca ( $cmd ) shortcut script ~/.shorttasks/gca.sh" &&
echo 'first param optional: relative directory to run git operation on.' && 
exit

action "$@"
