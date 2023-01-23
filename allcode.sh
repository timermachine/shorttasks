#!/bin/bash

echo 
echo
cat ./shorttasks/lib/ascii.txt
echo

dest="$HOME/.shorttasks"
alias_source="source $dest/aliases.sh "

# cp "./tasks/lib/*" "$dest/lib"
# echo "mkdir $dest"

echo 'Welcome to the ShortTasks installation.'
echo "Installs to $HOME/.shorttasks."
 read -r -p 'Do you want to continue? ' choice
    case "$choice" in
      n|N) echo 'quitting' && exit;;
      y|Y) 
      clear
      
      mkdir "$dest"
      mkdir "$dest/lib"

  
  # ensure file exists and empty
  alias_file='./shorttasks/aliases.sh'
  touch $alias_file
  echo ''> $alias_file
      
  # update aliases.sh based on all scripts in src/shorttasks/
  for f in ./shorttasks/*; do
        if [[ -e "$f" ]]; then 
            a=${f/.\/shorttasks\//''}
            b=${a/'.sh'/''}
            
            line="alias $b"'=$HOME/.shorttasks/'"$a"
          # exclude alaises its self as in shorttasks folder.
          [ $b != 'aliases' ] && echo $line >> $alias_file
          fi 
  done

    # copy tasks/* to ~/.shorttasks/
    for f in ./shorttasks/*; do
	    if [[ -e "$f" ]]; then 
            # echo "$f $dest${f##*/}" 
            cp "$f" "$dest/${f##*/}" 
            chmod a+x "$dest/${f##*/}" 
        fi 
    done

      # copy tasks/lib/* to ~/.shorttasks/
      for f in ./shorttasks/lib/*; do
            if [[ -e "$f" ]]; then 
                  # echo "$f $dest${f##*/}" 
                  cp "$f" "$dest/lib/${f##*/}" 
                  chmod a+x "$dest/lib/${f##*/}" 
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


#!/bin/bash
echo 'pn ( pnpm ) shortcut script ~/.shorttasks/pnpm.sh' 

[ $# -eq 0 ] && echo 'pn (pnpm run) shortcut script ~/.shorttasks/pn.sh) error: No params.' && 
echo  'first param optionally relative directory to run pnpm in.' && 
echo 'eg: pn app start' && 
echo "eg: pn app (lists app/package.json's scripts)" && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    returndir=$PWD
   # (npm --cwd $1 && npm $2 $3 $4 && npm --cwd $returndir)
   (cd "$1" && npm run $2 $3 $4 $5 $6 $7 $8 $9 && cd "$returndir" || exit)
else
    #just run npm in current dir
    npm "$@"
fi



alias g=$HOME/.shorttasks/g.sh
alias ga=$HOME/.shorttasks/ga.sh
alias gc=$HOME/.shorttasks/gc.sh
alias gca=$HOME/.shorttasks/gca.sh
alias gco=$HOME/.shorttasks/gco.sh
alias gs=$HOME/.shorttasks/gs.sh
alias h=$HOME/.shorttasks/h.sh
alias l=$HOME/.shorttasks/l.sh
alias lib=$HOME/.shorttasks/lib
alias n=$HOME/.shorttasks/n.sh
alias pn=$HOME/.shorttasks/pn.sh
alias pull=$HOME/.shorttasks/pull.sh
alias push=$HOME/.shorttasks/push.sh
alias scratch=$HOME/.shorttasks/scratch.sh
alias st=$HOME/.shorttasks/st.sh
alias y=$HOME/.shorttasks/y.sh
#!/bin/bash
echo 'g ( git ) shortcut script ~/.shorttasks/g.sh' 
[ $# -eq 0 ] && 
echo  'error: No params.' && 
echo 'first param optionally relative directory to execute git commands in.' && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C "$@"
else
    #just run git in current dir
    git "$@"
fi   Bud1            �                                                           svSrnlong                                             t a s k svSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `      �                                               @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          #!/bin/bash
#  echo 'gs ( git status ) shortcut script ~/.shorttasks/gs.sh' 

# source "$HOME/.shorttasks/lib/rules.sh"

# git_compatible 
# if [ $? -eq 1 ]; then

  

    if [ $# -eq 0 ] 
    then
        # no params just vanilla:
        git status
    else
        if [ -d "$1" ]
        then
            #if first param given, and it is a directory
            # echo "gs for dir: $1" && 
            git -C $1 status $2 $3 $4 $5 $6 $7 $8 $9
        else
        git status "$@" 
        fi
    fi

#!/bin/bash
# 
# l shorttask params  (note passing dir doesnt make sense as l loops directories)
#  .shorttasksrc ? - exclude from looping + include in looping. 
#  init - creates standard .shorttaskrc

# prevent l l - infinite loop
# prevent l cmd dir/. -doesnt make sense.
if [ "$1" == "l" ]; then
    echo ""
    echo "$> l l       calling l l would be recursive. Not happening :)"
    echo "$> st        to see commands can use with l"
    echo "$> l         (just l, no params) for usage detail"
    exit
fi
if [ $# -eq 0 ] || [ "$1" == "-h" ]; then
    echo '' 
    echo 'shorttasks l  (installed at ~/.shorttasks)'
    echo '' 
    echo 'l examples-' 
    echo '' 
    echo "l gs -s    calls git status  (short format) on every first level subdirectory that has .git folder." 
    echo "l pn       calls pnpm run on every first level subdirectory that has package.json file. (handy to list scripts)" 
    echo "st      to see commands can use with l." 
    echo ''
    exit
fi

source "$HOME/.shorttasks/lib/rules.sh"

for dir in ./*     # list directories in the form "/tmp/dirname/"
do
    if [ -d "$dir" ]; then
        if [ "$1" == "y" ] || [ "$1" == "n" ] || [ "$1" == "pn" ]; then       
           package_compatible $dir
        else
            git_compatible $dir
        fi
        if [ $? -eq 1 ]; then
            echo "$dir $*"
            "$HOME/.shorttasks/$1.sh" ${dir%*/} "$2" "$3" "$4"
        fi
    fi
done


#!/bin/bash

echo "push (git push) shorttask. (~/.shorttasks/push.sh)"

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    echo "git push for $1"
    git -C $1 push $2 $3 $4 $5 $6 $7 $8 $9
else
    #just run git  in current dir
    git push "$@"
fi
#!/bin/bash
echo 'ga ( git add ) shortcut script ~/.shorttasks/ga.sh' 
[ $# -eq 1 ] && [ "$1" == "." ] && echo ''  && git add .  # ga .
[ $# -gt 1 ] && [ "$1" != "." ] && [ -d "$1" ] && echo '' &&  git -C $1 add $2 $3 $4 $5 $6 $7 $8 $9 # ga dirctory {$2...}
[ $# -eq 1 ] && [ "$1" != "." ] && [ -d "$1" ] && echo '' && git -C $1 add . &&  # ga directory -no floowing dot.
[ $# -eq 0 ] && echo '' &&  git add .  
[ $# -gt 0 ] && [ ! -d "$1" ] && echo '' &&  git add "$@"   # ga -v -o 
#!/bin/bash
echo 'h ( githubcli gh ) shortcut script ~/.shorttasks/h.sh' 
[ $# -eq 0 ] && 
echo  'error: No params.' && 
echo 'first param optionally relative directory to execute gh commands in.' && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    returndir=$PWD
   # (yarn --cwd $1 && yarn $2 $3 $4 && yarn --cwd $returndir)
   (cd "$1" && gh $2 $3 $4 $5 $6 $7 $8 $9 && cd "$returndir" || exit)
else
    #just run yarn in current dir
    gh "$@"
fi
#!/bin/bash
echo 'gc ( git commit) shortcut script ~/.shorttasks/gc.sh' 
[ $# -eq 0 ] || [ "$1" == "-m" ] && 
echo "Usage:" && 
echo "gc 'message' [generates: git commit -m 'message'] ( Note no -m needed )" && 
echo "gc path 'message' [generates: git commit -C path -m 'message']" && exit

#  && echo "error: No params. first param optionally relative directory to run git commit. second param: quoted commit message" && exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C $1 commit -m "$2"
else
    #just run git status in current dir
    git commit -m "$1"
fi#!/bin/bash
echo 'gco ( git checkout -b) shortcut script ~/.shorttasks/gco.sh' 
[ $# -eq 0 ] || [ "$1" == "-m" ] && 
echo "Usage:" && 
echo "gco feature/someexample [generates: git checkout -b feature/someexample] ( Note no -b needed ) 12 chars saved!" && 
echo "gco path/ branchname [generates: git checkout -b path branchname]" && exit

#  && echo "error: No params. first param optionally relative directory to run git commit. second param: quoted commit message" && exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    git -C $1 checkout -b "$2"
else
    #just run git status in current dir
    git checkout -b "$1"
fi#!/bin/bash
# mac \x1B other \e

RCol='\x1B[0m'    # Text Reset

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\x1B[0;30m';     BBla='\x1B[1;30m';    UBla='\x1B[4;30m';    IBla='\x1B[0;90m';    BIBla='\x1B[1;90m';   On_Bla='\x1B[40m';    On_IBla='\x1B[0;100m';
Red='\x1B[0;31m';     BRed='\x1B[1;31m';    URed='\x1B[4;31m';    IRed='\x1B[0;91m';    BIRed='\x1B[1;91m';   On_Red='\x1B[41m';    On_IRed='\x1B[0;101m';
Gre='\x1B[0;32m';     BGre='\x1B[1;32m';    UGre='\x1B[4;32m';    IGre='\x1B[0;92m';    BIGre='\x1B[1;92m';   On_Gre='\x1B[42m';    On_IGre='\x1B[0;102m';
Yel='\x1B[0;33m';     BYel='\x1B[1;33m';    UYel='\x1B[4;33m';    IYel='\x1B[0;93m';    BIYel='\x1B[1;93m';   On_Yel='\x1B[43m';    On_IYel='\x1B[0;103m';
Blu='\x1B[0;34m';     BBlu='\x1B[1;34m';    UBlu='\x1B[4;34m';    IBlu='\x1B[0;94m';    BIBlu='\x1B[1;94m';   On_Blu='\x1B[44m';    On_IBlu='\x1B[0;104m';
Pur='\x1B[0;35m';     BPur='\x1B[1;35m';    UPur='\x1B[4;35m';    IPur='\x1B[0;95m';    BIPur='\x1B[1;95m';   On_Pur='\x1B[45m';    On_IPur='\x1B[0;105m';
Cya='\x1B[0;36m';     BCya='\x1B[1;36m';    UCya='\x1B[4;36m';    ICya='\x1B[0;96m';    BICya='\x1B[1;96m';   On_Cya='\x1B[46m';    On_ICya='\x1B[0;106m';
Whi='\x1B[0;37m';     BWhi='\x1B[1;37m';    UWhi='\x1B[4;37m';    IWhi='\x1B[0;97m';    BIWhi='\x1B[1;97m';   On_Whi='\x1B[47m';    On_IWhi='\x1B[0;107m';

# example:
#  echo -e "${Blu}blue ${Red}red ${RCol}etc...."#!/bin/bash
source "$HOME/.shorttasks/lib/colors.sh"
printf "${IRed}"
echo "┌─┐┬ ┬┌─┐┬─┐┌┬┐╔╦╗┌─┐┌─┐┬┌─┌─┐"
printf "${IYel}"
echo "└─┐├─┤│ │├┬┘ │  ║ ├─┤└─┐├┴┐└─┐"
printf "${IGre}"
echo "└─┘┴ ┴└─┘┴└─ ┴  ╩ ┴ ┴└─┘┴ ┴└─┘"
printf "${Whi}"┌─┐┬ ┬┌─┐┬─┐┌┬┐╔╦╗┌─┐┌─┐┬┌─┌─┐
└─┐├─┤│ │├┬┘ │  ║ ├─┤└─┐├┴┐└─┐
└─┘┴ ┴└─┘┴└─ ┴  ╩ ┴ ┴└─┘┴ ┴└─┘#!/bin/bash

# rules.
# y,n, npm - check package.json in folder
# git commands - check .git in folder
# this makes more sense than another .rc file -excluding folders/patterns
# and zero config.

# git_cmd=( 'g' 'gs')
# package_cmd=('n' 'np' 'y')
#  if("${git_cmd[@]}" in  .*/"$1"*); then


function git_compatible() {
  
    if [ -e "$1/.git" ]; then
        retval=1
    else
        retval=0
    fi
    return $retval
}

function package_compatible() {
  
    if [ -e "$1/package.json" ]; then
        retval=1
    else
        retval=0
    fi
    return $retval
}#!/bin/bash

echo "pull (git pull) shorttask. (~/.shorttasks/pull.sh)"

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    echo "gpl: git pull for $1"
    git -C $1 pull $2 $3 $4 $5 $6 $7 $8 $9
else
    #just run git status in current dir
    git pull "$@"
fi#!/bin/bash
echo 'n ( npm run ) shortcut script ~/.shorttasks/n.sh' 

[ $# -eq 0 ] && echo "n (npm run) shortcut script ~/.shorttasks/n.sh) error: No params." && 
echo  'first param optionally relative directory to run npm in.' && 
echo 'eg: n app start' && 
echo "eg: n app (lists app/package.json's scripts)" && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    returndir=$PWD
   # (npm --cwd $1 && npm $2 $3 $4 && npm --cwd $returndir)
   (cd "$1" && npm run $2 $3 $4 $5 $6 $7 $8 $9 && cd "$returndir" || exit)
else
    #just run npm in current dir
    npm "$@"
fi


#!/bin/bash
echo 'y ( yarn ) shortcut script ~/.shorttasks/y.sh' 
[ $# -eq 0 ]  && 
echo 'y (yarn shortcut script ~/.shorttasks/y.sh) error: No params.' &&
echo 'first param optionally relative directory to run yarn in.' && 
echo 'eg: y app start' && 
exit

if [ -d "$1" ]
then
    #if first param given, and it is a directory
    returndir=$PWD
   # (yarn --cwd $1 && yarn $2 $3 $4 && yarn --cwd $returndir)
   (cd "$1" && yarn $2 $3 $4 $5 $6 $7 $8 $9 && cd "$returndir" || exit)
else
    #just run yarn in current dir
    yarn "$@"
fi
#!/bin/bash
echo ''
echo ''
# cat "$HOME/.shorttasks/ascii.txt"
 source "$HOME/.shorttasks/lib/banner.sh"
echo ''
echo '   short  :      instead of                     '
echo '----------------------------------------------'
echo '     g     :     git '
echo '     ga    :     git add '
echo "     gc '' :     git commit -m '' "
echo '     gca   :     git commit  -a --amend --no-edit '
echo '     gco   :     git checkout -b '
echo '     gs    :     git status '
echo '     h     :     gh (github-cli)  '
echo '     pull  :     git pull '
echo '     push  :     git push '
echo '     n     :     npm run '
echo '     pn    :     pnpm run '
echo '     y     :     yarn '
echo '     l     :     l {any above command} (executes for each immediate folder)'
echo '     st    :     your shortasks help (this)'
echo 
 read -p "more..." </dev/tty


echo '$ gc "commit message"             - runs in current folder.'
echo '$ gc webapp "commit message"      - runs in webapp folder.'  
echo '(individually first param can be path to execute command in.)'
echo
echo 'l:'
echo '$ l gs    - loop git status for all first level dirs (mono repo style).'
echo '(l followed by gs/h/pull/push etall, will run for All valid first level dirs.)'#! /bin/bash

find src/ -name '*.sh' -exec cat {} \; > allcode.sh#!/bin/bash

echo 'gca ( git commit -a -amend --no-edit ) shortcut script ~/.shorttasks/gca.sh' 
 [ "$1" = '-h' ] && echo 'gca (git add . && git commit --amend --no-edit)' && 
echo 'first param optional: relative directory to run git operation on.' && 
exit

if [ $# -eq 0 ] 
then
    # no params just vanilla:
    git add .
    git commit  -a --amend --no-edit
else
    if [ -d "$1" ]
    then
           git -C add . &&
          git -C $1 commit  -a --amend --no-edit
    git status "$@" 
    fi
fi#!/bin/bash
echo 
echo
cat ./shorttasks/ascii.txt
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

