# workspaces

Say you have dozens of projects\*1, some of them sharing common ones.
You can switch sherpa between vscode workspaces. Then any action - git/yarn etc will
only be applied to those projects.

```
$ sip -ws sherpa/yi
$ gcob featureY
$ gs
```

This is great for context switching. ie you might be working on feature Y, but have to switch to fix feature X. With sherpa you can quickly add, commit your code for the currently set workspace across projects,
Switch active workspace, checkout the branch you need to work on, and easily switch back when done. For example:

```
# save work:
ga .
gc 'wip featre Y'

# switch context:

sip -ws sherpa/xi
gco main
pull
gcob fixXissue3
y dev

# fix done:
ga . && gc 'fixed issue 3'
push
h uicompoents create pr fixXissue3

# back to what you were doing:
sip -ws sherpa/yi
y dev
```

In addition, when submitting a pull request for the fix, whoever is performing the code review can also
easily switch to the relevant workspace, checkout the matching branch for all related projects/repos changed. This is why it is best to keep the workspaces under shared source control in your forked sherpa repo. They then form a
sharable workspace catelog (of the logical collections of projects.) This scenario's workflow might look like this:

Notes:

Quickly open the changed files:
Workspaces store directory paths, not files. Open the files for a commit across mutliple repos is easy.
In vscode goto the commit pane in the version control panel, right click on the commit, Open Changes, Open Files.

Pull Request for multiple repos/projects:
A good workflow is make the pull request for the most pertinent repo (usually the one with the most changes).
Any other team member can easily pull the cross repo branch name for all the related repos with Sherpa. For example the reviewer may:

```

```

\*1 projects can mean indiviual repositories (when using a multi repo setup) or folders within a monorepo.

Foi:

-d check overrides workspace. √
st -ws √
apply allowables when ws - (doesnt appy on singles and that is right) there are tradeoffs to multi - allowables.

peers not bubbling to run on parent.
children shouldnt try - as applicable not there

ok, this is a bit complicated.

ws:
st, demo, peers
st: √
demo: no git (doesnt try children first)
peers: has git, tries chidren, doesnt then try parent.
try reversing order dirs tried to see? √ fixed. (multiaction - does children then parent, still wants single dir as param to start with. -just still works if given multiple dirs (fn globbin!))

may want allowable override/toggle on/off.
st -i (info)
st list workspace paths ? maybe

why shows yarn.lock checked / shown? gs (ws)

-ws none - to unset. or -wsn / -wsy
i think -ws no dir:
show active ws, and dirs.
show all workspaces that are siblings
give option to turn ws filtering on / off.

gc for workspaces - remember its a bit of a special case. hmmmm.

\$ gc 'workspaces'
gc takes dir 'message'
dir can be the container of the target dirs.
or the target its self.

1. pretty up workspace echo on action.
   highlight workspace title on output (currently plain white)
   could indent / |\_\_ to show when acting on child dir. √

1.2 only need to state the comd \*dirs bit once. √

2. nicer st -ws options
   dont worry too much - draft 1. run through demo maker - will see how api can be improved.

3) readme, publish.

4) some tasks can take a while - a spinner would be awesome!

changing workspace:
code launch it
interactive mode : list availiable workspaces.
turn workspace off.\*

ctl-J my new best shortcut! - no more dragging fucking terminal window around!

dryrun (shows action, doesnt action it)
verbose (shows excluded dirs)
read and rewrite toggles on ws change.

---

OMEGA.
script(s) out of peers into st- like:
stws -init /stwsi

√√√√
Yankee. generate help on install - super cool! - this will then kick the ass off oh my!

---

## VICTOR:

readme - clear concise.
may want to do (some) demo,
video demo for youtube. - this shit is hot - it deserves a video,
might even make money from the video!!!

## Unicorn: tests, collaborators, share, compare / compatible with ?

## Tango: accessible components - radix? get back to react dude! leave this tool and move on.

## Romeo: get some youtube dollars to survive end of month.

PARKING LOT:

## Zulu. dry run really essential.

cherry on the cake:

## Wisky. works with oh my scripts.

Xray. wizzard - geneate tasks: maybe.

name: (what you type to invoke command)
command:
applicable: (can only action if this dir/file is present)

---

allow organising scripts by more than one folder.

---

Z.peers to st:
stwsi - hmm needs an st clone below it (at moment) - not sure of value of global availiablity.

Y.stgen : generate command files.

X. enough. promote it.
