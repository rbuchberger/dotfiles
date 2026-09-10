---
name: implement-parallel
description: Implement multiple tickets using subagents in parallel
---

/orchestration with subagents running /implement-in-worktree for each work item, in parallel. Skip
the Agent tool's worktree isolation; it keeps subagents from landing work on the destination branch,
which is chosen per implement-in-worktree.
