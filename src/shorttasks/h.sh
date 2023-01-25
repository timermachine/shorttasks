#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="h"
cmd="gh"
applicable="any"

[ "$1" = '-h' ] && 
echo "h ( $cmd ) shortcut script ~/.shorttasks/h.sh" &&
echo 'first param optional: relative directory to run git operation on.' && 
exit

action "$@"

