#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="l"
cmd="ls -1 --color"
# applicable="any"
# inapplicable="node_modules etc todo"

if [ "$1" = '-h' ]; then
   echo 'l (ls short and colorful! (ls -1 --color) shortcut script ~/.shorttasks/l.sh)' &&
      echo 'warning: filtered only to dirs that have $applicable'
   exit
fi

# TD: st -ws  path/to/ws to active.
# TD: check no pathspec, check active ws:
# TD: ws valid path? store as absolute path/relative (pros/cons?)
#  if active ws?
wsfolders=$(grep -o '"path": "[^"]*' demo.code-workspace | grep -o '[^"]*$')
for a in $wsfolders; do
   echo "$a"
   singleaction "$a" "$@"
done
#  singleaction each

# target current dir by default:
# if [ -d "$1" ]; then
#    action "$@"
# else
#    action . "$@"
# fi
