#!/bin/bash

echo 
echo
# cat ./tasks/ascii.txt
echo


echo "This will REMOVE shorttasks from: $HOME/.shorttasks"
 read -r -p 'Do you want to continue? ' choice
    case "$choice" in
      n|N) echo 'quitting' && exit;;
      y|Y) rm -rf ~/.shorttasks/ &&
      echo 'you should probably remove the line source ~./shorttasks/aliases.sh from ~/.bashrc and or ~/.zshrc manually as well.' &&
       exit ;;
      *) echo 'Response not valid';;
    esac

