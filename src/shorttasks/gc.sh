#!/bin/bash
source "$HOME/.shorttasks/lib/actions.sh"
source "$HOME/.shorttasks/lib/colors.sh"

st="gc"
cmd="git commit -m "
applicatble=".git"

if [ "$1" = '-h' ]; then 
    printf "${IYel}"
    echo "$st ($cmd) filters: $applicable must be present in dirs." 
    printf "${Whi}" 
    # echo "eg: $st branch .    # git branch on currrent dir only. " 
    #  echo "eg: $st branch myapp/. -only myapp. " 
    echo "NOTE: does git add . first - as typically do this before commit."
    echo "eg: $st 'message'    -no location param - all first level dirs having a $applicable"  
    echo "eg: $st 'message' myapp/.   -only in myapp (as long as has $applicable)"  
    echo  "using $st script at: ~/.shorttasks/$st.sh) -edit in your fork and y shorttasks/. update"
    exit
fi

action "$@"
