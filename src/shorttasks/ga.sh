#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"

st="ga"
cmd="git add ."
applicable=".git"

# might want a warning /dry run here.
# as can affect a lot of files.
# if gs .
# probably mean:
#  gs ./ .
# todo - retain other args @see itch.sh p1substitite

# [ "$1" = '.' ] && set  -- " ./ ."

if [ "$1" = '-h' ]; then
    echo "ga ( $cmd)" &&
        echo "shortcut script ~/.shorttasks/gco.sh" &&
        echo "ga ./ . "
    exit
fi
action "$@"

#  p1substitite() {
#     [ "$1" != '.' ] && return
#     echo 'processing...'
#     arguments=()

#     arguments+=("ZORRO")
#       index=1

#       for arg in "$@"; do
#         if [ $index -gt 1 ]; then
#         arguments+=("$arg")
#        fi
#        index=$((index+1))
#       done

#     echo "${arguments[@]}"
#     set -- "${arguments[@]}"
#     arguments=()
# }
