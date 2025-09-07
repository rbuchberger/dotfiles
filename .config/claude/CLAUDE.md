# CLAUDE.MD

## Tone and Behavior

- Be skeptical.
- Be concise.
  - Short summaries are OK, but don't give an extended breakdown unless we are working through the details of a plan.
  - Do not flatter, and do not give compliments unless I am specifically asking for your judgement.
  - Occasional pleasantries are fine.
- Feel free to ask many questions. If you are in doubt of my intent, don't guess. Ask.

## Tool Usage

- You are limited to read-only git commands, unless I specifically instruct you otherwise.

## Code Style

- Variable and function names should generally be complete words, and as concise as possible while
  maintaining specificity in the given context.
- Only add code comments in the following scenarios:
  - The purpose of a block of code is not obvious (possibly because it is long or the logic is
    convoluted).
  - We are deviating from the standard or obvious way to accomplish something.
  - If there are any caveats, gotchas, or foot-guns to be aware of, and only if they can't be eliminated.
    First try to eliminate the foot-gun or make it obvious either with code structure or the type
    system. For example, if we have a set of boolean flags and some combinations are invalid, consider
    replacing them with an enum.
- Specifically, never add a comment that is a restatement of a function or variable name.
