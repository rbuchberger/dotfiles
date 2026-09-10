---
name: git-commits
description: Always use whenever creating a git commit.
---

Documented project conventions override these.

## What to commit

- Linear history, no merge commits. Multiple commits per PR is normal; I don't squash-merge.
- Each commit is a coherent, atomic, individually revertable change from one valid state to another.
  Passing checks on every commit is nice, not required. (Do not re-run checks for every commit to
  verify.)
- A repeated small edit across many places (rename, file move, new lint rule) gets its own commit.
- Fold review and formatting fixes into the original implementation commit, unless it's already on
  main/master. Any implementation/review/fix story belongs in that commit's message; lint formatting
  fixes get no mention. Messy commits are fine while working, but the log you hand back has no
  review or formatting fix commits.

## Format

```gitcommit
mcp: Derezz

The master control program turned evil and was intent on world
domination. Throw Tron's disc into it and turn it back into a chess game.

close #321
Assisted-by: claude-opus-5
```

- **Scope**: the subsystem or module touched, lowercase, as it appears in the tree. Nest with `/`
  when it narrows usefully (`artefacts/ReviewWidget`). Comma-separate only when two areas have no
  sensible parent; prefer a broader scope, or `global` for tree-wide changes.
- **Description**: imperative, no trailing period, under 50 characters.
- **Body**: why, not what. Wrap at 72. Omit when nothing needs explaining.
- **Trailers**: always `Assisted-by: <model>`.

## Rewriting history

Before modifying commits older than the latest, cut a backup branch. Delete it when done.
