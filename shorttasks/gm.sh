#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st='gm'
cmd='git merge'
applicable='.git'
 
if [ "$1" = -h ]; then
"$command_name ( $command_execute)"
 exit
fi
action "$@"
