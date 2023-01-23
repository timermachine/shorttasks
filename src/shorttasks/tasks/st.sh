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
echo '     gc    :     git commit -m "" '
echo '     gca   :     git commit  -a --amend --no-edit '
echo '     gco   :     git checkout -b '
echo '     gpl   :     git pull '
echo '     gps   :     git push '
echo '     gs    :     git status '
echo '     n     :     npm run '
echo '     pn    :     pnpm run '
echo '     y     :     yarn '
echo '     l     :     l {any above command} (executes for each immediate folder)'
echo '     st    :     your shortasks help (this)'
echo 
echo 'For all commands: call without params gives specific command help.'
echo
echo 'For all commands ( except l ): first param optional relative directory to execute command in.'
echo 'Which is great for Mono/Poly/Multi repos'
echo 'for example:'
echo '$> gc "commit message"             - executes in current folder.'
echo '$> gc webapp "commit message"      - executes in webapp folder.'  
echo
