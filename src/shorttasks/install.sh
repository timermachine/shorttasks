#!/bin/bash

echo 
echo
cat ./tasks/ascii.txt
echo

dest="$HOME/.shorttasks"
alias_source="source $dest/aliases.sh "
mkdir "$dest"
mkdir "$dest/lib"
# cp "./tasks/lib/*" "$dest/lib"
# echo "mkdir $dest"
 for f in ./tasks/lib/*; do
	    if [[ -e "$f" ]]; then 
            # echo "$f $dest${f##*/}" 
            cp "$f" "$dest/lib/${f##*/}" 
            chmod a+x "$dest/lib/${f##*/}" 
        fi 
done

echo 'shorttask installation.'
echo "This will install to $HOME/.shorttasks"
 read -r -p 'Do you want to continue? ' choice
    case "$choice" in
      n|N) echo 'quitting' && exit;;
      y|Y) 
      clear
      for f in ./tasks/*; do
	    if [[ -e "$f" ]]; then 
            # echo "$f $dest${f##*/}" 
            cp "$f" "$dest/${f##*/}" 
            chmod a+x "$dest/${f##*/}" 
        fi 
    done
  
  #  [[ -e "$HOME/.bashrc" ]] &&

    z_has_alias_source=$( grep "$alias_source" "$HOME/.zshrc" )
  
    if [ "$z_has_alias_source" ]; then 
    echo 'zshrc already sources alias. skipping.'
    else
      echo " $alias_source"  >>  "$HOME/.zshrc"
    fi

     b_has_alias_source=$( grep "$alias_source" "$HOME/.bashrc" )

    if [ "$b_has_alias_source" ]; then 
      echo '.bashrc already sources alias. skipping.'
    else
        echo "$alias_source"  >>  "$HOME/.bashrc"
    fi

    echo
    echo 'Installation complete.'
    echo 'ONE MANUAL STEP, and all done: Do:'
    echo 'source $HOME/.zshrc'
    echo 'or '
    echo 'source $HOME/.bashrc'
    echo 'then type st (shorttasks!) for guidance.'

      ;;
      *) echo 'Response not valid';;
    esac


