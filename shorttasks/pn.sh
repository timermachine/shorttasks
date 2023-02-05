#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="pn"
cmd="pnpm"
applicable="package.json"

[ "$1" = '-h' ] &&
    echo "pn ( $cmd ) shortcut script ~/.shorttasks/pn.sh" &&
    exit

action "$@"
