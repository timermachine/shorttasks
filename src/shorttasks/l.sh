#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="l"
cmd="ls -1 --color"
# applicable="any"
# inapplicable="node_modules etc todo"
 
if [ "$1" = '-h' ]; then 
    echo 'l (ls short and colorful! (ls -1 --color) shortcut script ~/.shorttasks/l.sh)' &&
     echo 'warning: filtered only to dirs that have $applicable'
    exit
fi

action "$@"
