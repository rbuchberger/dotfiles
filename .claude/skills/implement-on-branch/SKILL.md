---
name: implement-on-branch
description: Implement provided ticket in a worktree, placing commits back in current branch.
---

Implement the work described in the provided ticket or spec, in a git worktree, and land the
commits on the destination branch.

## Destination branch

The destination branch may be specified explicitly. If not and the currently checked out branch is
main or master, ask if they would like to create one for this work. Otherwise, assume the
destination branch is the currently checked out branch at the time of skill invocation. It may be a
moving target with other work happening simultaneously to yours.

## The worktree

Create a worktree off the destination branch and do all the work there. Two things worth checking
before you start, because they cost more to discover later:

- **Dependencies.** A fresh worktree has no `node_modules` (or equivalent). Install before running
  anything.
- **Local config.** Some projects track their `.env` files and some don't. If they aren't tracked,
  copy what the worktree needs from the original checkout.

Nothing outside the worktree gets touched until you are landing the work.

## Doing the work

Write tests at pre-agreed seams. Prefer `/tdd` where the project's testing setup makes it
practical.

Typecheck often, and run scoped tests while you iterate. Run the full suite before you call the
work done.

Once finished, use /two-axis-code-review to review the work.

The work is finished when the ticket is implemented, the full checks and tests pass, and anything
the code-review subagents raised has been addressed. /tdd still applies here.

## Landing it

The ticket is not done until the worktree is clean and everything is committed. If you dispatch a
check-running subagent as your last step, you still have to come back and commit.

Then:

1. Check whether the destination branch has moved, and rebase your work onto it if so. Deal with
   conflicts yourself only where they are minor and the desired result is unambiguous. Otherwise
   stop and consult the user.
2. After rebasing, rerun the tests and checks.
3. Place your commits at the end of the destination branch with a fast-forward merge.
4. Once the work is safely on the destination branch, clean up any worktrees and branches you
   created.

Do not push or create a PR unless specifically asked to do so.

The user may not come back and read the session log, so if you have anything to say then leave it
as a comment on the relevant issue (if provided).
