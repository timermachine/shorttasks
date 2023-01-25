#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"

cmd="yarn"
applicable="package.json"
 
[ $1 = '-h' ]  && 
echo 'y ($cmd)shortcut script ~/.shorttasks/y.sh)' &&
echo 'first param optionally relative directory to run yarn in.' && 
echo 'eg: y app start' && 
exit


#  todo: compatability rules (see l) eg: npm, git (has package.json, has .git)

action "$@"