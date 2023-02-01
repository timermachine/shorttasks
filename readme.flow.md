cmd config:
allowable: eg .git

[shortask][pathspec] [command paramaters]

[pathspec] ends in dot :
execute command only on given speicif directory. (if just . on current directory)
allowable not applied. (eg can do `$ g . clone` `$ y anydir/. init`)
apply child dirs first not applied.

[pathspec] does not end in dot (including is no pathspec given):
execute command for each Child directories that pass allowable.
if none of the child directories meet allowable
execute for given pathspec (parent of the children tired first).

    if no children or parent are allowable - inform.
