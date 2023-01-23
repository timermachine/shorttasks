#!/bin/bash
echo 'g ( git ) shortcut script ~/.shorttasks/g.sh' 
[ $# -eq 0 ] && 
echo  'error: No params.' && 
echo 'first param optionally relative directory to execute git commands in.' && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C "$@"
else
    #just run git in current dir
    git "$@"
fi