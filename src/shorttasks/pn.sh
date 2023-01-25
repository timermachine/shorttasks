#!/bin/bash
cmd="pnpm run"
applicable="package.json"

[ "$1" = '-h' ] && 
echo "pn ( $cmd ) shortcut script ~/.shorttasks/pn.sh" &&
exit

action "$@"