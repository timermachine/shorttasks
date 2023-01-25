#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="l"
cmd="ls -1 --color"
# inapplicable="node_modules etc todo"
 
[ "$1" = '-h' ]  && 
echo 'l (ls short and colorful! (ls -1 --color) shortcut script ~/.shorttasks/l.sh)' &&
exit

action "$@"
