#!/bin/bash
source "$HOME/.shorttasks/lib/colors.sh"

cmd=''
applicable='any'

function singleaction() {
     returndir=$PWD
    #  echo "action in $1"
    # todo: dry run: show what it would do, and ask confirm if any params are -dr
    #  echo " cd $1 && $cmd $2 $3 $4 $5 $6 $7 $8 $9 "
    [ -e "$returndir" ] && cd "$1" || exit
    $cmd $2 $3 $4 $5 $6 $7 $8 $9 
    [ -e "$returndir" ] && cd "$returndir" || exit
}

# apply child dirs:
function multiaction() {

    printf "${IYel}"
    printf "$cmd  ( %s*dirs ) " "$1"
     [ "$applicable" != 'any' ]  && printf " having %s" "$applicable"
    printf "${Whi}"
     echo ''
  
   for dir in $1/*    # list directories in the form "/tmp/dirname/"
    do 
        if [ -d "$dir" ]; then
            if [ "$applicable" = 'any' ] || [ -e "$dir/$applicable" ]; then
                printf "${IYel}"
                echo "$dir:"
                printf "${Whi}" 
                singleaction $dir $2 $3 $4 $5 $6 $7 $8 $9
            # else - todo: verbose mode: say skipped as not an applicable git dir etc.
            fi      
        fi
    done
}

function action(){
    # echo "setaction $*"
   
    # prevent globbing patters
    [ -d "$2" ]|| [ -f "$2" ] &&  
    [ "$2" != '.' ] && # special case for git add which needs a path specified.
    echo '2nd param was a file or directory. globbing (/* /**) patterns not supported.' &&
    echo 'paramters recieved:' && 
    echo "$@" && 
    return;

    # [[ $1 =~ /\. ]] && echo 'slash dot at end: /.' 
    if [[ $1 =~ /\. ]] || [ "$1" = '-' ] || [ "$1" = '.' ]; then
      printf "${IYel}"
      echo "$cmd for $1"
      printf "${Whi}" 
         singleaction "$@"
    else
        #  first param a directory (includes .)
        if [ -d "$1" ]; then
            multiaction "$@"
        else
            # eg gf -s  (defaults to execute for all children of .)
            # also for no params. workspace lookup prob goes here.
             multiaction "." "$@"
        fi
    fi
    
}