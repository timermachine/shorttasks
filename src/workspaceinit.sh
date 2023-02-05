#!/bin/bash

# Must be run from shorttasks/. folder.

#  symlinks from ../ to all files in folders :
#  head-files: package.json

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

# prefilight checks
okproceed=true
for f in "$returndir"/head-files/*; do
    # link all files including hidden eg .lintrc
    if [[ ! -f "$dest/.${f##*/}" ]]; then
        echo "target file already exists: $dest/.${f##*/}"
        okproceed=false
    fi
done
for f in "$returndir"/head-dotfiles/*; do
    # link all files including hidden eg .lintrc
    if [[ ! -f "$dest/${f##*/}" ]]; then
        echo "target file already exists: $dest/${f##*/}"
        okproceed=false
    fi
done

if [ "$okproceed" == true ]; then
    echo "preflight checks fail. Initialisation  cancelled to prevent overwriting of target file(s)"
    exit
fi

for f in "$returndir"/head-files/*; do
    # link all files unhidden files
    if [[ -f "$f" ]]; then
        # echo "linking: $f $dest${f##*/}"
        ln -s "$f" "$dest/${f##*/}"
    fi
done

# only difference is dot prefixed to filename
for f in "$returndir"/head-dotfiles/*; do
    # link all files including hidden eg .lintrc
    if [[ ! -f "$dest/.${f##*/}" ]]; then
        echo "target file already exists: $dest/.${f##*/}"
    fi

    if [[ -f "$f" ]]; then
        # echo "linking: $f $dest${f##*/}"
        ln -s "$f" "$dest/.${f##*/}"
    fi
done

cd "$returndir" || exit
