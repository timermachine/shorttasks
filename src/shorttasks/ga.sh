#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"

cmd="git add"
 applicable=".git"


# might want a warning /dry run here.
# as can affect a lot of files.
# if gs . probably mean gs ./ .
[ "$1" = '.' ] && set  -- " ./ ."
# if no params 
[ $# -eq 0 ] && set  -- " ./ ."
# might want a confirm. as git add . is an exception to the rule.


[ "$1" = '-h' ] && 
echo "ga ( $cmd)" && 
echo "shortcut script ~/.shorttasks/gco.sh" &&
echo "ga ./ . "
exit
action "$@"
