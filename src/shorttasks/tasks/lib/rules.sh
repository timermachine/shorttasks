#!/bin/bash

# rules.
# y,n, npm - check package.json in folder
# git commands - check .git in folder
# this makes more sense than another .rc file -excluding folders/patterns
# and zero config.

# git_cmd=( 'g' 'gs')
# package_cmd=('n' 'np' 'y')
#  if("${git_cmd[@]}" in  .*/"$1"*); then


function git_compatible() {
  
    if [ -e "$1/.git" ]; then
        retval=1
    else
        retval=0
    fi
    return $retval
}

function package_compatible() {
  
    if [ -e "$1/package.json" ]; then
        retval=1
    else
        retval=0
    fi
    return $retval
}