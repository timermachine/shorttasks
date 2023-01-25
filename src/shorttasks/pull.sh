#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"
 source "$HOME/.shorttasks/lib/colors.sh"

st="pull"
cmd="git pull"
applicable=".git"

[ "$1" = '-h' ] && 
echo "pull ( $cmd ) shortcut script ~/.shorttasks/n.sh" &&
echo 'first param optional: relative directory to run git operation on.' && 
exit

action "$@"