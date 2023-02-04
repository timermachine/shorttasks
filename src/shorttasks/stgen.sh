#!/bin/bash

: '
    stgen - generate any custom shorttask.
    sets st,cmd, applicable, 
    creates boilerplate.
    pathing - dodgy.
    help - todo


'

#  todo: assumes stgen run with dir to shorttasks. (not src/shorttasks/yadayada/blabla)
#  feel need a .strc or ~.shorttasks pointer to st forked repo.
#  otherwise thinking about searching for it - but that seems wrong.
#  maybe offer a hint if not found.
shorttaskdir="$PWD/shorttasks/src/shorttasks"

# cmd for documentation only
cmd="Wizzard to generate your own custom st commands."

# echo "$cmd"
echo "Enter command name: (eg gs for git status)"
read command_name

# echo "Welcome ${command_name}!"
script_file="$shorttaskdir/$command_name.sh"

#  todo: check if cmd already taken - shorttask or binary.
#  and warn - never override an existing command
#  might give option to check if 'name taken'
# check file not there already - if so inform - should remove/move/rename first. && exit.

# option to add dry run:
echo "Make a Dry run version of $command_name ? (Y/N)"

read make_dry_run
if [ $make_dry_run = 'y' ] || [ $make_dry_run = 'Y' ]; then

    drscript_file="$shorttaskdir/${command_name}dr.sh"

    # echo "drscript_file: $drscript_file"

    echo '#!/bin/bash' >"$drscript_file"
    echo 'dryrun=true' >>"$drscript_file"
    echo "source $HOME/.shorttasks/$command_name.sh " >>"$drscript_file"
fi

echo "Enter what command executes (eg git  status -s -b)"
read command_execute

echo "Enter applicable (eg for a git command it would be .git)"
read command_applicable

# echo $shorttaskdir

echo '#!/bin/bash' >"$script_file"
echo 'source "$HOME/.shorttasks/lib/actions.sh"' >>"$script_file"
echo 'source "$HOME/.shorttasks/lib/colors.sh"' >>"$script_file"
echo '' >>$script_file

echo "st='$command_name'" >>"$script_file"
echo "cmd='$command_execute'" >>"$script_file"
echo "applicable='$command_applicable'" >>"$script_file"
echo ' ' >>"$script_file"

echo 'if [ "$1" = '-h' ]; then' >>"$script_file"
echo '"$command_name ( $command_execute)"' >>"$script_file"
echo ' exit' >>"$script_file"
echo 'fi' >>"$script_file"

# add help section. todo: multi-line (cat <<EOF EOF)
# if [ "$1" = '-h' ]; then
#     echo "ga ( $cmd)" &&
#         echo "shortcut script ~/.shorttasks/gco.sh" &&
#         echo "ga  adds . on dirs which are git initialised (have .git folder)"
#     echo "dont add the extra dot yourself"
#     exit
# fi

echo 'action "$@"' >>"$script_file"

# add help template.

echo "basic command $command_name generated to file: $script_file"
echo 'y shorttasks update to make availiable.'
echo 'as a new command, restart terminal or source ~/.[profile])'
echo 'done.'
echo ''
