---
name: implement-parallel
description: Implement multiple tickets using subagents in parallel
---

/orchestration Use sub-agents to perform /implement-in-worktree for each work item. Parallel work is
desired. Do not use the Agent tool's worktree isolation, as it will not allow sub-agents to land
their work back on the destination branch.

The destination branch is chosen using the same rules as in the implement-in-worktree skill.
