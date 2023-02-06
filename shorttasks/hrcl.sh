#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st='hrcl'
cmd='gh repo clone'
applicable=''

if [ "$1" = -h ]; then
    "$command_name ( $command_execute)"
    exit
fi
singleaction "$@"
