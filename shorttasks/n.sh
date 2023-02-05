#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="n"
cmd="npm "
applicable="package.json"

[ "$1" = '-h' ] &&
    echo "n ( $cmd ) shortcut script ~/.shorttasks/n.sh" &&
    echo 'first param optional: relative directory to run git operation on.' &&
    exit

action "$@"
