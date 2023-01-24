#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"

 cmd="git"
 applicable=".git"
#  -C

#  todo: compatability rules (see l) eg: npm, git (has package.json, has .git)

action "$@"
