---
name: git-commits
description: Always use whenever creating a git commit.
---

# Creating Git Commits

These are Robert's personal preferences; if they conflict with the documented conventions of a
project then the project takes precedence.

## What to commit

- Rebases are preferred over merges
- A commit should be a small, atomic, individually revertable, coherent change
  that takes the codebase from a valid state to a valid state. It's not required
  that checks pass for every commit, but it's nice to have.
- Any change that requires a repeated small edit in many places should be broken
  out by itself. (For example, renaming a variable, moving a route, introducing a
  new lint rule, etc.).
- Multiple commits per PR is ok

## Format

If a project has an established pattern, use that. Otherwise, I like scoped
commits combined with the usual "Short, imperitive description" guidance.

```
<scope>: <description>

[optional body]

[trailers]
```

Basically scoped commits, with a short, imperitive description. Body says why, not what.

- **Scope** — the subsystem, area, or module touched. Lowercase, matching how it
  appears in the tree. Nest with `/` when it narrows something usefully
  (`artefacts/ReviewWidget`). Comma-separate only when a change genuinely spans
  two areas with no sensible parent; prefer a broader scope, or `global` for a
  tree-wide change.
- **Description** — imperative mood, no trailing period. Under 50 characters.
- **Body** — why, not what. The diff already says what. Wrap at 72 columns.
  Omit it for changes that need no explanation. Separate from subject with a blank line.
- **Trailers** — always add an `Assisted-by: <model>` to indicate that this
  commit was authored by AI.

Example:

```gitcommit
mcp: Derezz

The master control program turned out to be evil and had become intent..
on world domination. This commit throws Tron's disc into MCP (causing
its deresolution) and turns it back into a chess game.

close #321
Assisted-by: claude-opus-5
```
