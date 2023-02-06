#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st='hrl'
cmd='gh repo list -L 100'
applicable=''

if [ "$1" = -h ]; then
    "$command_name ( $command_execute)"
    exit
fi
singleaction "$@"
