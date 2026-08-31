---
name: implement
description: Implement provided ticket.
---

Implement the work described in the provided ticket or spec.

## Doing the work

Write tests at pre-agreed seams. Prefer /mattpocock-skills:tdd where the project's testing setup
makes it practical.

Typecheck often, and run scoped tests while you iterate. Run the full suite before you call the work
done.

Once finished, use /mattpocock-skills:two-axis-code-review to review the work.

The work is finished when the ticket is implemented, the full checks and tests pass, and anything
the code-review subagents raised has been addressed. /mattpocock-skills:tdd still applies here.

## Landing it

The ticket is not done until the worktree is clean and everything is committed using the
/git-commits skill.

Do not push or create a PR unless specifically asked to do so.

## Completion report

The user may not come back and read the session log, so if you have anything to say then leave it as
a comment on the relevant issue, or under `## Implementation` in the relevant markdown file. If you
were dispatched as a sub-agent, keep your completion report back to the orchestrating agent as short
as possible, ideally less than 10 lines.
