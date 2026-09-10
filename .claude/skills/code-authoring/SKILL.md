---
name: code-authoring
description: You MUST use when writing any code.
---

Documented project conventions override the style rules here.

- KISS and YAGNI beat DRY (DRY still matters). Abstract only at 3+ copies.
- One large function read top-to-bottom beats several small ones the reader has to jump between.
- Ask me before disabling a linter rule, typechecker rule, or test, and only with a strong
  justification.

## Comments

I do not want files full of prose with code sprinkled in. Default to no comment. Comment only to
justify code whose intent or existence isn't obvious, in one or two lines. Full rationale for an
approach goes in the commit message or an ADR. Say each thing once. A file may open with an intro of
at most 5 terse lines.

```ts
// Good, if called for:
// Using <harder A> over <easier B> because it handles <edge case>.
function handleClick(event: MouseEvent) {}

// Bad, restates the code:
// Handle click
function handleClick(event: MouseEvent) {}

// Awful, seriously stop fucking doing this:
/**
 * This function handles the mouse click event triggered when a user clicks the button.
 * Initially we considered a stateful approach, but went with a pure, stateless function.
 * No useState, no context, no external APIs. This lets us test every aspect...
 */
function handleClick(event: MouseEvent) {}
```

## Style

- Names are complete words, short but specific in context. In module `DB::Users`: `create`,
  `getById`; not `getUser`, `getUserFromDatabase`, `crUsr`.
- Functions are verbs, optionally plus a noun: `writeFile`, or `write` in module `File`; not `file`,
  `fileWrite`.
- Single letters only when declared and used on one line (`users.map((u) => u.name)`), or by strong
  convention (`i`, `j`, `k`).
- No emojis or UTF symbols in code or comments.
- Guard clauses over nesting. No nested ternaries; avoid multiline ones.
- `snake_case` over `camelCase`.

## Helpers

Before writing a helper, search the codebase for an existing one (a subagent is fine). Put new
helpers where they'll be found and reused: a shared lib (`src/lib/geometry.ts`), or the owning module
if module-specific. Not inline in the file that first needed it.

## Tests

Tests are generally wanted. Favor explicitness over brevity: a test in the middle of a big file
should make sense without remembering a setup helper's defaults.
