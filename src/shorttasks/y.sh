#!/bin/bash
 source "$HOME/.shorttasks/lib/actions.sh"
 source "$HOME/.shorttasks/lib/colors.sh"

 st="y"
 cmd="yarn"
 applicable="package.json"
 
if [ "$1" = '-h' ]; then 
    printf "${IYel}"
    echo "$st ($cmd) filters: $applicable must be present in dirs." 
    printf "${Whi}" 
    # echo "eg: $st branch .    # git branch on currrent dir only. " 
    #  echo "eg: $st branch myapp/. -only myapp. " 
    echo "eg: $st start    -no location param - all first level dirs having a $applicable"  
    echo "eg: $st start myapp/.   -only in myapp (as long as has $applicable)"  
    echo  "using $st script at: ~/.shorttasks/$st.sh) -edit in your fork and y shorttasks/. update"
    exit

    

fi
 
action "$@"
