#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="h"
cmd="gh "
applicable=".git" 
# for most like pr create : want allowable .git
#  maybe a preferable? to avoid slash dotting.
#  optionally - inspect the command to decide ie pr create -required,
#  create a new repo - not so much!

[ "$1" = '-h' ] && 
echo "h ( $cmd ) shortcut script ~/.shorttasks/h.sh" &&
echo 'first param optional: relative directory to run git operation on.' && 
exit

action "$@"

