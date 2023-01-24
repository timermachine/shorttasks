#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"

 cmd="ls -1 --color"
 
[ "$1" = '-h' ]  && 
echo 'l (ls short and colorful! (ls -1 --color) shortcut script ~/.shorttasks/l.sh)' &&
exit

action "$@"
