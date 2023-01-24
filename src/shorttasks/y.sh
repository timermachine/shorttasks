#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"
 
[ $1 = '-h' ]  && 
echo 'y (yarn shortcut script ~/.shorttasks/y.sh)' &&
echo 'first param optionally relative directory to run yarn in.' && 
echo 'eg: y app start' && 
exit



cmd="yarn"
applicable="package.json"

#  todo: compatability rules (see l) eg: npm, git (has package.json, has .git)

action "$@"