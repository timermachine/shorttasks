#!/bin/bash
# clear
echo ''
cat $PWD/shorttasks/lib/ascii.txt
echo ''

dest="$HOME/.shorttasks"
alias_source="source $dest/aliases.sh "

# cp "./tasks/lib/*" "$dest/lib"
# echo "mkdir $dest"

preflight() {
  # works but todo:
  # need to remove and src $HOME profile first!
  # need to know what profile using ~/.zshrc ~/.zshenv / ~/.bashrc  ~/.bash_profile etc / other

  if [ ! -d "$PWD/shorttasks" ] || [ ! -d "$PWD/shorttasks/lib" ]; then
    echo "Preflight check not passed."
    echo 'install must be run from shorttasks/ folder. '
    echo 'ie: from shorttasks run:  ./src/install.sh'
    echo 'The reason being: install needs to locate your local files so they can be kept under source control'
    exit
  fi

  if [ -d "$HOME/.shorttasks" ]; then
    echo "Preflight check not passed."
    echo "target: $HOME/.shorttasks already exists."
    echo "to prevent unintentional overwrite, remove it first."
    echo "you can run shorttasks/src/remove.sh"
    echo "or yarn update - which removes target and then re-installs"
    exit
  fi

  # if [ -n "$ZSH_VERSION" ]; then
  #   # assume Zsh
  #   source "$HOME/.zshrc"
  # elif [ -n "$BASH_VERSION" ]; then
  #   # assume Bash
  #   source "$HOME/.bashrc"
  #   # else
  #   # assume something else
  # fi

  # check not overriding existing commands.
  # note: above checks take care of preinstalled shorttasks.
  # only concerend about binary commands.
  for f in ./shorttasks/*; do

    if [[ -f "$f" ]]; then
      sanspath="${f##*/}"       # trim path before cmd name
      rawf=${sanspath/'.sh'/''} #trim off .sh

      if $rawf &>/dev/null; then

        echo "Preflight check not passed."
        echo "$rawf is an existing command so wont proceed."
        echo "overriding existing commands not permitted - for your own system safety."
        echo "rename shortasks/$rawf.sh and its cmd=$rawf and try again."
        exit
      fi
    fi
  done

}

stinstall() {
  # echo 'prepare$PWD.'
  #  clear
  echo 'Preflight checks passed'
  echo ''
  echo 'Welcome to the ShortTasks installation.'
  echo "Installs to $HOME/.shorttasks."
  echo ''
  # echo "You should look at the code to check its safe."
  # echo 'Easy minute to check -only 400 simple lines. put it in all in one file:'
  # echo '$ find shorttasks/ -name '*.sh' -exec cat {} \; > allcode.sh'
  # echo '$ find shorttasks/lib -name '*.sh' -exec cat {} \; >> allcode.sh'
  echo ''
  mkdir "$dest"
  mkdir "$dest/lib"

  # ensure file exists and empty
  alias_file="$PWD/shorttasks/aliases.sh"
  touch "$alias_file"
  echo '#!/bin/bash' >"$alias_file"

  help_file="$PWD/shorttasks/lib/generatedhelp.txt"

  touch $help_file
  echo "" >$help_file

  # update aliases.sh based on all scripts in src/shorttasks/
  for f in ./shorttasks/*; do
    if [[ -f "$f" ]]; then
      a=${f/.\/shorttasks\//''} # trim path before cmd name
      b=${a/'.sh'/''}           #trim off .sh

      line="alias $b"'=$HOME/.shorttasks/'"$a"
      # exclude alaises its self as in shorttasks folder.
      if [ $b != 'aliases' ] && [[ $b != *dr ]]; then
        # todo - nice to have: check if a dr file made, indicate (dr)
        # if [ -f "$PWD/shorttasks/$f dr" ]
        echo $line >>$alias_file
        # if dr version file: (dr)

        cmd="$(echo $(grep 'cmd=' $f) | cut -d'=' -f2)"

        #  get cmd from file grep? cmd="ls -1 --color"
        spaces=$((10 - ${#b}))
        printf "     %s %*s :      %s \n" "$b" "$spaces" "" "$cmd" >>$help_file
      fi

    fi
  done

  # copy tasks/* to ~/.shorttasks/
  for f in "$PWD"/shorttasks/*; do
    if [[ -f "$f" ]]; then
      # echo "$f $dest${f##*/}"
      cp "$f" "$dest/${f##*/}"
      chmod a+x "$dest/${f##*/}"
    fi
  done

  # copy tasks/lib/* to ~/.shorttasks/
  for f in "$PWD"/shorttasks/lib/*; do
    if [[ -e "$f" ]]; then
      # echo "$f $dest${f##*/}"
      cp "$f" "$dest/lib/${f##*/}"
      chmod a+x "$dest/lib/${f##*/}"
    fi
  done

  z_has_alias_source=$(grep "$alias_source" "$HOME/.zshrc")

  if [ "$z_has_alias_source" ]; then
    echo '' # 'zshrc already sources alias. skipping.'
  else
    echo " $alias_source" >>"$HOME/.zshrc"
  fi

  b_has_alias_source=$(grep "$alias_source" "$HOME/.bashrc")

  if [ "$b_has_alias_source" ]; then
    echo '' # '.bashrc already sources alias. skipping.'
  else
    echo "$alias_source" >>"$HOME/.bashrc"
  fi

  echo
  echo 'Installation complete.'
  echo 'ONE MANUAL STEP, and all done: restart terminal or:'
  echo '$ source $HOME/.zshrc or source $HOME/.bashrc'
  echo 'then type sth (shorttasks help) to check install worked and for guidance.'

}

if [ "$1" = '-i' ]; then
  read -r -p 'Do you want to continue installation?(y/n) ' choice
  case "$choice" in
  n | N) echo 'quitting' && exit ;;
  y | Y)
    clear
    preflight
    stinstall
    exit
    ;;
  *) echo 'Response not valid' ;;
  esac
else
  preflight
  stinstall
fi
