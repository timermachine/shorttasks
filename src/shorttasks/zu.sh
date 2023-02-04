#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st='zu'
cmd='ls -la'
applicable='.git'
 
if [ "$1" = -h ]; then
"ga ( $cmd)"
 exit
fi
action "$@"
