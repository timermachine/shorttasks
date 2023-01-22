# ShortTasks

ShortTasks allow you to avoid changing directory, type a lot less and so stay in the flow for 99% of git and yarn/npm/pnpm tasks.

Simple easily customisable toolbelt especially useful for
mono/multi/poly repos. Run packaging and git tasks like a Boss.
Allows you to get in the flow and do this chore stuff without having
to think about it super fast!

would you rather type:
`yarn workspaces @scopedpackage/appname scripttorun`
or:
`y appfolder scripttorun`

`git commit -C appfolder -a --amend --no-edit`
or
`gca appfolder`

plus lots more...

### install:

```
yarn sti  #(short tasks install)
# or
npm run sti
```

### remove:

```
yarn str # (short tasks remove)
```

ShortTasks are made for you by the above install are:

| ShortTask | executes   | example                    |
| --------- | ---------- | -------------------------- |
| y         | yarn       | y app start                |
| g         | git        | g app branch -l            |
| gs        | git status | gs site                    |
| ga        | git add    | ga uicomponents            |
| gc        | git commit | gc peers 'commit mmessage' |
| gp        | git push   | gp web                     |
| gpl       | git pull   | gpl web                    |
| n         | npm run    | n app                      |
| pn        | pnpm run   | pn app                     |

all shortcuts are simple aliased shell scripts. ready for you to
customise however you like:
Edit/add tasks.
Add help to st.sh
`yarn str && yarn sti` - updated and good to go.
