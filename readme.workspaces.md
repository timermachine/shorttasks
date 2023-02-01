# workspaces

Say you have dozens of projects, some of them sharing common ones.
You can switch sherpa between vscode workspaces. Then any action - git/yarn etc will
only be applied to those projects.

```
$ sp -ws sherpa/acme.code-workspace
$ gcob newfeaturebranch
$ gs
```

This is great for context switching. ie you might be working on feature X, but have to switch to
fix feature Y. With sherpa you can quickly add / commit your code for the currently set workspace set,
Switch active workspace, checkout the branch you need to work on, and easily switch back when done.
In addition, when submitting a pull request for the fix, whoever is performing the code review can also
easily switch to the relevant workspace, checkout the matching branch for any projects changed. This is why
it is best to keep the workspaces under shared source control in your forked sherpa repo.
