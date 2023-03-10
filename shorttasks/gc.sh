#!/bin/bash
# cd "$(dirname "$0")"
# source ./lib/actions.sh
# source ./lib/colors.sh

source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="gc"
cmd="git commit -m "
applicable=".git"

#
# [ "$1" = '.' ] && set  -- " ./ ."
# "commit message" getting broken up. leading to :
# error: pathspec '123' did not match any file(s) known to git

if [ "$1" = '-h' ]; then
    printf "${IYel}"
    echo "$st ($cmd) filters: $applicable must be present in dirs."
    printf "${Whi}"
    # echo "eg: $st branch .    # git branch on currrent dir only. "
    #  echo "eg: $st branch myapp/. -only myapp. "
    echo "gc - git commit can be hard to undo if you do it on the wrong multiple repos so"
    echo "you must specify a directory as first paramater."
    echo "as with other commands if you want to run it only in the current directory use: dot"
    echo "gc . 'message'"
    echo "if you want to applied to all children of current directory use  dot slash :"
    echo "gc ./ 'message'"
    echo "using $st script at: ~/.shorttasks/$st.sh) -edit in your fork and y shorttasks/. update"
    exit
fi

# now want to be able to
# gc 'message no $1 dir, actions on active workspace dirs'
# as quite a drastic action, may want to add a confirm. how do you roll back a commit?

action "$@"

# if [ -d "$1" ]; then
#     action "$@"
# else
#     echo "gc takes dir 'message' "
#     echo "dir can be the container of the target dirs."
#     echo "or the target its self."
# fi
