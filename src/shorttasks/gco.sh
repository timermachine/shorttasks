#!/bin/bash

cmd="git add . && git commit  -a --amend --no-edit"
applicable=".git"


[ "$1" = '-h' ] && 
echo "gco ( $cmd)" && 
echo "shortcut script ~/.shorttasks/gco.sh" &&
exit

[ $# -eq 0 ] || [ "$1" == "-m" ] && 
echo "Usage:" && 
echo "gco feature/someexample [generates: git checkout -b feature/someexample] ( Note no -b needed ) 12 chars saved!" && 
echo "gco path/ branchname [generates: git checkout -b path branchname]" && 
exit


action "$@"
