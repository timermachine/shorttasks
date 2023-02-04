#!/bin/bash

# create symlinks from ../ to all files in /.workspace-
root (if dont already exist)
# cd .. && ln -s  peers/src/package.workspace.json ./package.json && yarn install && cd peers
#todo - check in peers directory safety check
# ln -s  ./src/workspace-
root package.workspace.json ../package.json
# todo: .hidden files not caught. - have a dot dir as did with ST.

returndir=$PWD
dest='./'
cd ..

echo 'workspace init'
echo 'Initialises repo container folder as yarn workspace with shorttasks.'
echo 'sym links to your shorttasks forked repo files to have head folder files under source control.'
echo 'Empowers sharing of multi-repos across teams/developers'
echo 'Please note, you do not need to do this to use ST shorttasks.'
echo 'and all changes will be prompted.'

read -p "continue..." </dev/tty

for f in "$returndir"/src/workspace-
root/*; do
    # link all files including hidden eg .lintrc
     if [[ -f "$f" ]]; then 
        # echo "linking: $f $dest${f##*/}" 
         ln -s  "$f" "$dest/${f##*/}"
     fi 
done
# only difference is dot prefixed to filename
for f in "$returndir"/src/workspace-
root-hidden/*; do
    # link all files including hidden eg .lintrc
     if [[ -f "$f" ]]; then 
        # echo "linking: $f $dest${f##*/}" 
         ln -s  "$f" "$dest/.${f##*/}"
     fi 
done

cd "$returndir" || exit


#todo check dest link not already there?
#   if [[ -e "$dest" ]]; then 
# account for all possibles to sync:
#
# src   dest
# √     x       -link
# √     √       -skip and give info already there
# x     √       -up to user. ideally all syncd for source control. can also mean has been removed from sc.
# 
