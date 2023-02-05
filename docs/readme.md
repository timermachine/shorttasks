# ShortTasks

saves you a ton of typing:

| strokes saved | ShortTask | long equivalent                 |
| ------------- | --------- | ------------------------------- |
| 2             | g         | git                             |
| 5             | ga        | git add                         |
| 8             | gb        | git branch                      |
| 12            | gc        | git commit -m ''                |
| 29            | gca       | git commit -a --amend --no-edit |
| 11            | gco       | git checkout                    |
| 13            | gcob      | git checkout -b                 |
| 10            | gs        | git status -s -b                |
| 1             | h         | gh (github-cli)                 |
| 4             | pull      | git pull                        |
| 4             | push      | git push                        |
| 23            | pushnew   | git push --set-upstream origin  |
| 6             | n         | npm run                         |
| 7             | pn        | pnpm run                        |
| 2             | y         | yarn                            |

- Quick setup / update.
- Easy to configure / adapt / make your own.
- Singe / multiple targets simultaneously.
- No dependencies. - pure shell scripts.
- Useful for any language, version control, packaging system.

But its more than just about saving keystrokes. The long commands cause mental impedence. You will quickly find what were chores before become second nature flow. And flow matters.

Cli designed for mono/hybrid/poly repos. By default every command runs across multiple targets.

You will love it so much that you will buy me a coffee!
And if you are a Marmite hater, I would love to know what you think should be changed - and if its a good idea I will buy you a coffee!

## install

## usage

## make your own

My goal is to help developers share code more effectivly - aiming for zero friction actually.

Configure commands with super powers.
Designed for mono/multi/poly repos.
Never have to type cd.. again.
Faster context/multi-project switching.

Designed for maximum flow and ease of use.
Opinionated: by default these types of actions run across multipe directories.
This is how we want to work - with multiple repository folders.
Going more specific is allowed: just add /. if you want to action task on
a single target.
eg:
gs packages -executes for all child dirs of packages.
gs packages/webapp/. -executes only for webapp
gs ./. - executes only for current directory. (yes we & you want to get away from this as it means navigation in and out of folders!)
ga shorttasks.app/. .

99% of the time you want to do git actions on at least one entire repo.
-or a repo that is initialised for git.
so by setting a applicable we can negate the need to add /.

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

g : git
ga : git add
gc : git commit -m ""
gca : git commit -a --amend --no-edit
gco : git checkout -b
gpl : git pull
gps : git push
gs : git status
n : npm run
pn : pnpm run
y : yarn
l : l {any above command} (executes for each immediate folder)

all shortcuts are simple aliased shell scripts. ready for you to
customise however you like:
Edit/add tasks.
Add help to st.sh
`yarn str && yarn sti` - updated and good to go.
