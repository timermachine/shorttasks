#!/bin/bash
echo 'loog ( loop git ) shortcut script ~/.shorttasks/loog.sh' 
[ $# -eq 0 ] && 
echo  'error: No params.' && 
echo 'first param optionally relative directory to execute git commands in.' && 
exit

loop "git $1 $2 $3 $4 $5 $6 $7 $8 $9"

