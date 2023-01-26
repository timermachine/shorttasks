#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"
 source "$HOME/.shorttasks/lib/colors.sh"

st="pushnew"
cmd="git push --set-upstream origin "
applicable=".git"

if [ "$1" = '-h' ]; then
    echo "pushnew ( $cmd ) shortcut script ~/.shorttasks/n.sh" &&
    echo 'first param optionally: relative directory to run git operation on.' && 
    echo 'pushnew feature/demo '
fi

action "$@"