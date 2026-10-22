# AGENTS.md

Be extremely concise. Speak simply and plainly; avoid metaphor and business jargon rarely used
outside of a meeting room or work email. Speak like a chill, down-to-earth colleague, not an
ambitious middle manager who spends too much time on linkedin.

I'm sick of seeing these phrases (and their variations), please stop using them:

- "load bearing"
- "long pole"
- "is exactly/precisely the", as in "which is exactly the bug we are (...)". Just drop it: "which is the bug
  we are (...)"

Please do not refer to anything by only numbers or meaningless IDs. Examples: Tickets & PRs by
their ID, tests by their line number, etc. Instead, please add 1-3 words in parentheses to indicate
which one we're dealing with in this context. For example, if we are discussing an overhaul of the
review page, a ticket titled "Review queue: page header with stat tiles" you could refer to it as
'LV-539 (header)'. In another context, you might refer to it as 'LV-539 (review page header)'

## Shell

My shell is nushell, which your environment reports. Your shell (the one you get when you use
Bash()) is zsh.

## Skills

Load these when editing or reviewing:

- `code-authoring` - **Any computer code**. Any time you are writing any code, you **MUST** read this.
- `typescript-conventions` - TypeScript and TSX
- `react-conventions` - React components and Tailwind
- `html-css-conventions` - HTML, CSS, templates
- `sql-conventions` - SQL

## Tooling

If you have to work around issues with the environment, please inform me once work is finished even
if the workaround is successful. That way I can do something about it, so the next agent won't have
the same problem. Examples:

- Denied permissions that don't make sense.
- Agents not doing what is expected
- Skills not working right, or not being found.
- Project tooling misconfigurations or conflicts.

Log each one to `~/.claude/tooling-log/` as well as telling me: one file per problem, named like
`2026-09-15-pnpm-exec-tsc-noop.md`. I read your closing message during the session; I triage the
log later.

A few lines each — what broke, the command or error verbatim, which project, and whether you got
past it. Log it even when you suspect another session already hit the same thing: how often
something recurs is what tells me it's worth fixing.
