---
name: two-axis-code-review
description: Review changes since a commit, branch, or tag on two axes, Standards and Spec, in parallel subagents. Use to review a branch, PR, or work-in-progress, or "review since X".
---

Review the diff from a fixed point to `HEAD` on two separate axes:

- **Standards**: does it follow the repo's documented coding standards?
- **Spec**: does it implement the originating issue or spec?

## 1. Pin the fixed point

Use the ref the user gave (SHA, branch, tag, `HEAD~5`); ask if none. Confirm `git rev-parse <ref>`
resolves and `git diff <ref>...HEAD` is non-empty before going further. List commits with
`git log <ref>..HEAD --oneline`.

## 2. Find the spec

In order:

1. Issue refs in commit messages (`#123`, `Closes #45`, `!67`), fetched per
   `docs/agents/issue-tracker.md`.
2. A path the user passed.
3. A spec under `docs/`, `specs/`, or `.scratch/` matching the branch or feature.
4. Ask the user. If there is no spec, skip the Spec axis.

## 3. Find the standards

Repo docs on how code should be written, such as `CODING_STANDARDS.md` or `CONTRIBUTING.md`.

## 4. Dispatch both in one message

Two `general-purpose` agents. Give each the diff command and commit list, plus:

**Standards**: the standards files, and this brief: "Read `<this skill's directory>/smells.md`.
Report per file/hunk: (a) every violation of a documented standard, citing file and rule; (b) any
smell from smells.md, named, with the hunk quoted. Documented-standard breaches can be hard
violations; smells are always judgement calls, and a documented standard overrides them. Skip
anything tooling enforces. Under 400 words."

**Spec**: the spec path or contents, and this brief: "Report: (a) requirements missing or partial;
(b) behaviour in the diff not asked for (scope creep); (c) requirements that look implemented but
wrong. Quote the spec line for each. Under 400 words."

## 5. Report

The two reports under `## Standards` and `## Spec`, verbatim or lightly cleaned. Keep the axes
separate so one can't mask the other: no merging or reranking. End with one line: finding count per
axis and the worst issue within each, with no overall winner. Note if Spec was skipped.
