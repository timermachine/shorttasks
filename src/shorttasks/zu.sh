#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st='zu'
cmd='git status -s -b'
applicable='.git'
 
if [ "$1" = -h ]; then
"$command_name ( $command_execute)"
 exit
fi
action "$@"
