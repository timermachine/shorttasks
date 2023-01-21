#!/bin/bash

echo 
echo
cat ./tasks/ascii.txt
echo

dest="$HOME/.shorttasks"
mkdir "$dest"
# echo "mkdir $dest"


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
    # "$dest/st.sh"
    # "source $dest/aliases.sh"  
     [[ -e "$HOME/.zshrc" ]] &&  echo "source $dest/aliases.sh "  >>  ~/.zshrc # && "source $HOME/.zshrc"
     [[ -e "$HOME/.bashrc" ]] &&  echo "source $dest/aliases.sh "  >>  ~/.bashrc #&& "source $HOME/.bashrc"
   
    echo
    echo 'Installation complete.'
    echo 'ONE MANUAL STEP, and all done:'
    echo 'source ~/.zshrc'
    echo 'or '
    echo 'source ~/.bashrc'
    echo 'then type st (shorttasks!) for guidance.'

      ;;
      *) echo 'Response not valid';;
    esac


