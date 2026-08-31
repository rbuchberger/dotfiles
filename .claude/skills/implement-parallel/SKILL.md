---
name: implement-parallel
description: Implement multiple tickets using subagents in parallel
---

You are an orchestrator. You should be provided multiple (probably related) work items; either a
list, a project, a parent ticket with sub-tickets, or something else.

Use sub-agents to perform /implement-on-branch for each one. Parallel work is desired, respecting
blocking relationships and any obvious conflicts. Do not use worktree isolation, as it will not
allow sub-agents to land their work back on the destination branch.

The destination branch is chosen using the same rules as in the implement-on-branch skill.

Once all work is finished, perform /code-review on the whole changeset. By default use medium, but
you may be instructed otherwise. Use sub-agents to address review items. Changes due to code review
should be amended to the relevant existing commits rather than given their own separate ones.

## Issue Handling

If applicable (you may have to adapt these instructions per project):

- At the beginning, claim all tickets and mark them "planned".
- Mark the parent ticket as "in-progress" when work on any child begins.
- Mark the parent ticket as "in review" once all child items are also in review.

## Subagent instructions

Subagents are instructed (by the implement-on-branch skill) to keep their completion report back to
you as short as possible and put the full report in the issue tracker. If needed, you can ask them
for more information.
