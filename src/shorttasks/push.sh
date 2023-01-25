#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"
 source "$HOME/.shorttasks/lib/colors.sh"

st="push"
cmd="git push"
applicable=".git"

[ "$1" = '-h' ] && 
echo "push ( $cmd ) shortcut script ~/.shorttasks/n.sh" &&
echo 'first param optional: relative directory to run git operation on.' && 
exit

action "$@"