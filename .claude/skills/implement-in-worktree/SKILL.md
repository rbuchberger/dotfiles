---
name: implement-in-worktree
description: Implement provided ticket in a worktree, placing commits back in current branch.
---

/implement the indicated work in a git worktree, then land the commits on the destination branch.

**Destination branch**: the one specified, else the branch checked out at invocation. If that's
main/master, ask whether to create a new branch. Other work may land on it while you work.

**Worktree**: create it off the destination branch and touch nothing outside it until landing. Before
running anything, install dependencies (`node_modules` or equivalent) and copy any untracked local
config (`.env`) the worktree needs from the original checkout.

**Landing**: once the worktree is clean and everything is committed (come back and commit even if
your last step was a check-running subagent):

1. If the destination branch moved, rebase onto it. Resolve conflicts yourself only when minor and
   the result is unambiguous; otherwise stop and ask the user.
2. After rebasing, rerun tests and checks.
3. Fast-forward the destination branch to your commits.
4. Remove the worktrees and branches you created.
