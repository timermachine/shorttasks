#!/bin/bash

#  ~/.shorttasks
dest="./temp"
mkdir "$dest"

./$dest/st/sh

# for f in ./tasks/*; do
# 	if [[ -e "$f" ]]; then 
#         # echo "$f $dest${f##*/}" 
#         cp "$f" "$dest/${f##*/}" 
#         chmod a+x "$dest/${f##*/}" 
#     fi 
# done

# "$dest/st.sh"