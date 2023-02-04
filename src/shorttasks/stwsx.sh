#!/bin/bash

# cmd for documentation only
cmd="st Unsets workspace filter for all commands."

if [[ -e ".strc" ]]; then
    echo "active_workspace=nooperation" >.strc
    echo "st workspace filter unset."
fi
