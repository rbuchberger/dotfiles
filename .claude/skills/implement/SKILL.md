---
name: implement
description: Implement provided ticket.
---

Implement the provided ticket or spec.

1. Write tests at pre-agreed seams, using /mattpocock-skills:tdd where the project's test setup makes
   it practical. Typecheck often and run scoped tests while iterating.
2. Run /two-axis-code-review and address what it raises, still test-first.
3. Commit per /git-commits. Don't push or open a PR unless asked.

Done when: the ticket is implemented, the full checks and test suite pass, review items are
addressed, and the worktree is clean with everything committed.

## Completion report

The user may not read this session, so put anything worth saying in a comment on the issue, or under
`## Implementation` in the relevant markdown file. As a subagent, keep your report to the
orchestrator under 10 lines.
