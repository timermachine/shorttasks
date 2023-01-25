#!/bin/bash
cmd="npm run"
applicable="package.json"

[ "$1" = '-h' ] && 
echo "n ( $cmd ) shortcut script ~/.shorttasks/n.sh" &&
echo 'first param optional: relative directory to run git operation on.' && 
exit

action "$@"


