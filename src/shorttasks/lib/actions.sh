#!/bin/bash
source "$HOME/.shorttasks/lib/colors.sh"
st=''
cmd=''
applicable='any'
inapplicable='./node_modules'
mode=1  # 1: *dirs (/. to specify single) 2: single given dir.

function singleaction() {
     returndir=$PWD
    #  echo "action in $1"
    # todo: dry run: show what it would do, and ask confirm if any params are -dr
    #  echo " cd $1 && $cmd $2 $3 $4 $5 $6 $7 $8 $9 "
    #  echo "$dir != $inapplicable ?"
    # if [ "$dir" != "$inapplicable" ]; then 

        [ -e "$returndir" ] && cd "$1" || exit
        # echo "$cmd $2 $3 $4 $5 $6 $7 $8 $9 "
        $cmd $2 $3 $4 $5 $6 $7 $8 $9 
        [ -e "$returndir" ] && cd "$returndir" || exit
    # fi
}

# apply child dirs:
function multiaction() {

    printf "${IPur}"
    printf "$st: $cmd $2 $3 $4 $5 $6 $7 $8 $9 ( %s*dirs ) " "$1"
     [ "$applicable" != 'any' ]  && printf " having %s" "$applicable"
    printf "${Whi}"
     echo ''
  
   for dir in $1/*    # list directories in the form "/tmp/dirname/"
    do 
        if [ -d "$dir" ]; then
            # echo "$dir != $inapplicable ?"
            # if [ "$dir" != "$inapplicable" ]; then 
            allowedcount=0
            if [ "$applicable" = 'any' ] || [ -e "$dir/$applicable" ]; then  
                    printf "${IYel}"
                    echo ''
                    echo "$dir:"
                    printf "${Whi}" 
                    singleaction $dir $2 $3 $4 $5 $6 $7 $8 $9
                    allowedcount+=1
                fi
            # else - todo: verbose mode: say skipped as not an applicable git dir etc.
            fi      
        # fi
       
    done
    # if none of the children were allowable run for parent dir. 
    #  So dont have to g targetdir/. - g targetdir will work.
     if [ $allowedcount = 0 ];then
      singleaction $1 $2 $3 $4 $5 $6 $7 $8 $9
      allowedcount=0
    fi 
     echo ''
}
# entry point.
# determines singe/multi action.
function action(){
    # echo "action $*"

    # mode 1: *dirs  2: single given dir.
    if [ $mode = 2 ]; then
      singleaction "$@" && return
    fi

    # prevent globbing patters
   if [ -d "$2" ]|| [ -f "$2" ] &&  [ "$2" != '.' ]; then 
        # special case for git add which needs a path specified.
        printf "2nd param was a file or directory. \n"
        printf "${Red}" 
        printf "globbing (/* /**) patterns not currently supported.\n" 
        printf "${Whi}"  
        echo 'paramters recieved: '  
        echo "$@"  
        return;
    fi

    # [[ $1 =~ /\. ]] && echo 'slash dot at end: /.' 
    if [[ $1 =~ /\. ]] || [ "$1" = '-' ] || [ "$1" = '.' ]; then
      printf "${IPur}"
      echo "$st: $cmd  $1 $2 $3 $4 $5 $6 $7 $8 $9"
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



# helper functions:

# this works. would prob would pass arguments on, echo "$@" doesnt show changed args.
function p1substitite() { 
    [ "$1" != '.' ] && return
    echo 'processing...'
    arguments=()

    arguments+=("ZORRO")
      index=1

      for arg in "$@"; do
        if [ $index -gt 1 ]; then 
        arguments+=("$arg")
       fi
       index=$((index+1))
      done

    echo "${arguments[@]}"
    set -- "${arguments[@]}"
    arguments=()
}