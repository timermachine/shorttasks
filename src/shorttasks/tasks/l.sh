#!/bin/bash
# 
# l shorttask params  (note passing dir doesnt make sense as l loops directories)
#  .shorttasksrc ? - exclude from looping + include in looping. 
#  init - creates standard .shorttaskrc

for dir in ./*     # list directories in the form "/tmp/dirname/"
do
    if [ -d "$dir" ]; then
        echo "$dir $*"
        "$HOME/.shorttasks/$1.sh" ${dir%*/} "$2" "$3" "$4"
    fi
done

