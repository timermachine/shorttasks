#!/bin/bash
# -ws pspec  : set active workspace file
# -wso pspec : set and code open it. meh
# -ws null   : show /return active ws file path.
# -wsx : unset vs ws.
# -h
#  none
if [ "$1" = '-h' ]; then
    echo ''
    echo ''
    # cat "$HOME/.shorttasks/ascii.txt"
    source "$HOME/.shorttasks/lib/banner.sh"
    echo ''
    echo '   short  :      instead of                     '
    echo '-------------------------------------------'
    echo '     g       :   git '
    echo '     ga      :   git add '
    echo '     gb      :   git branch '
    echo "     gc      :   git commit -m '' "
    echo '     gca     :   git commit  -a --amend --no-edit '
    echo '     gco     :   git checkout'
    echo '     gcob    :   git checkout -b '
    echo '     gs      :   git status -s -b'
    echo '     h       :   gh (github-cli)  '
    echo '     pull    :   git pull '
    echo '     push    :   git push '
    echo '     pushnew :   git push --set-upstream origin'
    echo '     n       :   npm run '
    echo '     pn      :   pnpm run '
    echo '     y       :   yarn '
    # echo '     l     :     l {any above command} (executes for each immediate folder)'
    echo '     st      :     your shortasks help (this)'
    echo

    read -p "more..." </dev/tty

    echo '$ gc "commit message"           - runs in every first level dir that is git enabled.'
    echo '$ gc webapp "commit message"    - runs in webapp folder (as long as it is git enabled'
    echo '$ gc . "commit message"         - runs in current folder.'
    echo '$ gs                            - git status -s for every first level dir having package.json '
fi
