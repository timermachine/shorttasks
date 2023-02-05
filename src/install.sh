#!/bin/bash
# clear
echo ''
cat ../shorttasks/lib/ascii.txt
echo ''

dest="$HOME/.shorttasks"
alias_source="source $dest/aliases.sh "

# cp "./tasks/lib/*" "$dest/lib"
# echo "mkdir $dest"
echo ''
echo 'Welcome to the ShortTasks installation.'
echo "Installs to $HOME/.shorttasks."
echo ''
echo "You should look at the code to check its safe."
echo 'Easy minute to check -only 400 simple lines. put it in all in one file:'
echo '$ find src/ -name '*.sh' -exec cat {} \; > allcode.sh'
echo ''

stinstall() {
  # echo 'prepare...'
  mkdir "$dest"
  mkdir "$dest/lib"

  # ensure file exists and empty
  alias_file='../shorttasks/aliases.sh'
  touch $alias_file
  echo '' >$alias_file

  help_file='../shorttasks/lib/generatedhelp.txt'

  touch $help_file
  echo '' >$help_file

  # update aliases.sh based on all scripts in src/shorttasks/
  for f in ../shorttasks/*; do
    if [[ -f "$f" ]]; then
      a=${f/.\/shorttasks\//''}
      b=${a/'.sh'/''}

      line="alias $b"'=$HOME/.shorttasks/'"$a"
      # exclude alaises its self as in shorttasks folder.
      if [ $b != 'aliases' ] && [[ $b != *dr ]]; then
        # todo - nice to have: check if a dr file made, indicate (dr)
        # if [ -f "../shorttasks/$f dr" ]
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
  for f in ../shorttasks/*; do
    if [[ -f "$f" ]]; then
      # echo "$f $dest${f##*/}"
      cp "$f" "$dest/${f##*/}"
      chmod a+x "$dest/${f##*/}"
    fi
  done

  # copy tasks/lib/* to ~/.shorttasks/
  for f in ../shorttasks/lib/*; do
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
    stinstall
    exit
    ;;
  *) echo 'Response not valid' ;;
  esac
else
  stinstall
fi
