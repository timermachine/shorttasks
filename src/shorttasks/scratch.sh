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

echo "0- $0"