#!/usr/local/bin/bash
# version-test.sh
# echo $BASH_VERSION

# find src/ -name '*.sh' -exec cat {} \; > allcode.sh

function howtohash() {
    declare -A hashmap=( ["key"]="value" ["moo"]="cow" ["woof"]="dog")

    # hashmap["key"]="value"
    # hashmap["key2"]="value2"
    echo "val for key: ${hashmap["key"]}"
    for key in "${!hashmap[@]}"; do echo $key; done
    for value in "${hashmap[@]}"; do echo $value; done

    for key in "${!hashmap[@]}"; do
        echo ${key} ${hashmap[${key}]}
    done

    echo hashmap has ${#hashmap[@]} elements
}



#  [ -d "$2" ]|| [ -f "$2" ] &&  
    # [ "$2" != '.' ] 

# [ $# -eq 0 ] && echo 'no params'

# WANT if $1 . change to ./, retain other args.

# [ "$1" = '.' ] && set  -- " ./ ."
# [ $# -eq 0 ] && set  -- " ./ ."

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

function batsOptionSplitter() {
    arguments=()

    # Unpack single-character options bundled together, e.g. -cr, -pr.
    for arg in "$@"; do
    if [[ "$arg" =~ ^-[^-]. ]]; then
        index=1
        while option="${arg:$((index++)):1}"; do
        if [[ -z "$option" ]]; then
            break
        fi
        arguments+=("-$option")
        done
    else
        arguments+=("$arg")
    fi
    shift
    done

    set -- "${arguments[@]}"
    arguments=()
}

p1substitite "$@"


echo "$@"