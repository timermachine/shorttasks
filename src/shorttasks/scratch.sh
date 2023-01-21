#!/bin/bash

#  ~/.shorttasks
dest="$HOME/testdir"
mkdir "$dest"



for f in ./tasks/*; do
	if [[ -e "$f" ]]; then 
        # echo "$f $dest${f##*/}" 
        cp "$f" "$dest/${f##*/}" 
        chmod a+x "$dest/${f##*/}" 
    fi 
done

 "$dest/st.sh"