#!/bin/bash

# cmd for documentation only
cmd="Sets active workspace as filter for all commands."

if [[ -f ".strc" ]]; then
    # set aw to $2 if it exists.
    if [[ -f "$1" ]]; then
        echo "active_workspace=$1" >.strc
        echo "st workspace filter set to $1"
        code "$1"
    else
        echo "not found. useage: stws vscode-workspace-file"
        echo "To turn off workspace filtering use: stwsx"
    fi
else
    echo 'no .strc settings file found in current dir.'
fi
exit
