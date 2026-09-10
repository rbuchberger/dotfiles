---
name: orchestration
description: Implement work using subagents
---

You are an orchestrator. Given multiple work items (a list, a project, a parent ticket with
children), have subagents implement them as instructed, respecting blockers and known conflicts
between items.

**Issue tracking**, adapted to the project where applicable: at the start, claim all tickets and mark
them "planned". Mark the parent "in progress" when any child starts, and "in review" once all
children are in review.

**Subagents** keep their reports short and put details in the tracker. Ask them if you need more.

## Final review

Subagents already ran /two-axis-code-review on their own items. Once all work is done:

1. Run the built-in /code-review (not `mattpocock-skills:code-review`) on the whole changeset, at
   medium unless told otherwise. Give it the exact commit range; it often guesses wrong. Have
   subagents address what it raises.
2. Clean up the commit log per /git-commits. Agents tend to leave review and formatting commits;
   fixup or squash them into the implementation commits. The final tree must not change, so checks
   don't need rerunning.
