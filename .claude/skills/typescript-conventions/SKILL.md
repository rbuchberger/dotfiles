---
name: typescript-conventions
description: TypeScript and TSX conventions covering function declaration style, where to annotate types, structural parameter types, and banned escape hatches. Use when writing, editing, or reviewing .ts or .tsx files.
---

# TypeScript Conventions

Applies on top of the global Code Style rules in `~/.claude/CLAUDE.md`.

## Declaration style

Prefer `function myFunc() {}` over `const myFunc = () => {}`. Arrow
functions are still correct for inline callbacks.

## Where to annotate

Annotate parameters and return values. Rely on inference inside function
bodies.

```ts
function activeNames(users: readonly User[]): string[] {
  const active = users.filter((u) => u.isActive); // inferred
  return active.map((u) => u.name);
}
```

## Parameter types

Do not import a large domain type just to read two fields off it. Declare
the narrow shape the function actually needs, and reach for a generic
when the caller needs its own type back.

```ts
// Bad: couples the helper to the full ApiUser shape.
import type { ApiUser } from "../api/types";
function byName(users: ApiUser[]): ApiUser[] {}

// Good: works for anything with a name, returns what came in.
function byName<T extends { name: string }>(items: readonly T[]): T[] {}
```

## Escape hatches

- Avoid `as SomeType`. Fix the types instead. Narrow with a type guard,
  a discriminated union, or a schema parse at the boundary.
- Avoid non-null `!` assertions, even when you are sure they hold.
  Verify in a way the compiler can check.

```ts
// Bad
const user = users.find((u) => u.id === id)!;

// Good
const user = users.find((u) => u.id === id);
if (!user) return null;
```
