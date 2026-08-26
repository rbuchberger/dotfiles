---
name: code-authoring
description: You MUST use when writing any code.
---

- KISS and YAGNI are far more important than DRY. (DRY still matters, though.)
- Don't consider abstraction until at least 3 copies, possibly more.
- Avoid misdirection. One large function that can be read top-to-bottom is better than several
  smaller ones.
- Seriously cool it with the comments. More on this later but I DO NOT WANT every file to be filled
  with paragraphs of prose with a little code sprinkled in between.
- ALWAYS ask me before you disable a linter rule, typechecker rule, or test. Only consider doing so
  if you believe you have a strong justification for it.

## Comments

- Prefer not to write a comment at all.
- Comments longer than 2 lines should be rare.
- Comments MUST NOT restate the code in prose.
- Write comments, only when necessary to justify the code's intent or existence in its current form,
  and only when not obvious.
- Do not write comments that explain, in detail, the entire rationale for the chosen approach. If
  such an explanation must be documented, that belongs in the commit message or an ADR.
- Do not explain the same thing multiple times.
- At the top of a file, a short introduction is ok to help the reader get their bearings. No more
  than 5 extremely concise lines.

```ts
// Ideal:

function handleClick(event: MouseEvent) { /* ... */ }

// Good (if called for):
// We are doing <harder A> instead of <easier B> because it correctly handles <edge case>.
function handleClick(event: MouseEvent) { /* ... */ }

// Bad:
// Handle click
function handleClick(event: MouseEvent) { /* ... */ }

// Awful:
// This function handles the the mouse click event triggered when a user clicks on the button.
function handleClick(event: MouseEvent) { /* ... */ }

// Seriously please fucking stop doing this:
/** 
* This function handles the the mouse click event triggered when a user clicks on the button.
* Initially we considered a stateful approach because it would be shorter by a few lines, but
* instead we went with a deliberatly pure, stateless function. No useState, no context, no external
* APIs called. This empowers us to thoroughly and completely test every aspect of the function, from
* <several more lines of untested, useless noise that will do nothing other than make me scroll
  more, fill up your context faster, and rot until it is actively misleading.>
*/
function handleClick(event: MouseEvent) { /* ... */ }
```

## Style

If any of these style preferences conflict with the existing standards or conventiosn of a project,
follow those instead.

- Names should be complete words, short but specific in context. In a module `DB::Users`:
  - Good: `create`, `delete`, `getAll`, `getById`.
  - Bad: `getUser`, `deleteUser`
  - Bad: `getUserFromDatabase`
  - Bad: `cr`, `crUsr`
- Functions and method names should be verbs (optionally followed by a noun).
  - Good: `writeFile`
  - Good: `write` (in a module named `File`)
  - Bad: `file`
  - Bad: `fileWrite`
- Single letters only for:
  - declared and used on one line (`users.map((u) => u.name)`)
  - strong conventions like `i`/`j`/`k` for indices
- Never use emojis or UTF symbols such as ✅ or ❌ in code or comments.
- Prefer guard clauses over nesting.
- Never use a nested ternary. Avoid multiline ternaries.
- Unless there is an existing convention, prefer `snake_case` over `camelCase`.

## Helpers

- Before writing a helper, you *must* actively search the codebase to ensure you aren't creating a
  duplicate. You are free to use a sub-agent to do this.
- When writing a helper, place it somewhere that it can be found and reused. If it's
  specific to a module, place it in that module.

```ts
// Bad:

// src/ui/pie_chart/Indicator.tsx

function sine(degrees: number): number {
  return Math.sin((degrees * Math.PI) / 180)
}

export function Indicator(props: IndicatorProps)  { /* uses sine */ }

// Good:

// src/lib/geometry.ts

export function sine(degrees: number): number {
  return Math.sin((degrees * Math.PI) / 180)
}

// src/ui/pie_chart/Indicator.tsx

import { sine } from '~/lib/geometry'

export function Indicator(props: IndicatorProps)  { /* uses sine */ }
```

## Tests

- Tests are generally desired.
- Prefer explicitness over brevity. I shouldn't have to remember a helper's default parameters to
  know what is being tested.
