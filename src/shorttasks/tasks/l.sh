#!/bin/bash
# 
# l shorttask params  (note passing dir doesnt make sense as l loops directories)
#  .shorttasksrc ? - exclude from looping + include in looping. 
#  init - creates standard .shorttaskrc

# prevent l l - infinite loop
# prevent l cmd dir/. -doesnt make sense.
if [ "$1" == "l" ]; then
    echo ""
    echo "$> l l       calling l l would be recursive. Not happening :)"
    echo "$> st        to see commands can use with l"
    echo "$> l         (just l, no params) for usage detail"
    exit
fi
if [ $# -eq 0 ] || [ "$1" == "-h" ]; then
    echo '' 
    echo 'shorttasks l  (installed at ~/.shorttasks)'
    echo '' 
    echo 'l examples-' 
    echo '' 
    echo "l gs -s    calls git status  (short format) on every first level subdirectory that has .git folder." 
    echo "l pn       calls pnpm run on every first level subdirectory that has package.json file. (handy to list scripts)" 
    echo "st      to see commands can use with l." 
    echo ''
    exit
fi

source "$HOME/.shorttasks/lib/rules.sh" && exit

 

for dir in ./*     # list directories in the form "/tmp/dirname/"
do
    if [ -d "$dir" ]; then
        if [ "$1" == "y" ] || [ "$1" == "n" ] || [ "$1" == "pn" ]; then       
           package_compatible $dir
        else
            git_compatible $dir
        fi
        if [ $? -eq 1 ]; then
            echo "$dir $*"
            "$HOME/.shorttasks/$1.sh" ${dir%*/} "$2" "$3" "$4"
        fi
    fi
done


