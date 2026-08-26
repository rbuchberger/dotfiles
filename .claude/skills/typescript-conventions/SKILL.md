---
name: typescript-conventions
description: Use when writing, editing, or reviewing .ts or .tsx files.
---

Prefer `function myFunc() {}` over `const myFunc = () => {}`. Arrow
functions are still correct for inline callbacks.

Annotate parameters and return values. Rely on inference inside function
bodies.

```ts
function activeNames(users: readonly User[]): string[] {
  const active = users.filter((u) => u.isActive); // inferred
  return active.map((u) => u.name);
}
```

Do not import a large domain type to use a small part of it. Declare what you need, and use
a generic when the caller needs its own type back.

```ts
// Bad:
import type { ApiUser } from "../api/types";
function byName(users: ApiUser[]): ApiUser[] {}

// Good:
function byName<T extends { name: string }>(items: readonly T[]): T[] {}
```

Avoid `as SomeType`. Fix the types instead. Narrow with a type guard,
a discriminated union, or a schema parse at the boundary.

Avoid non-null `!` assertions, even when you are sure they hold.
Verify in a way the compiler can check.

```ts
// Bad
const user = users.find((u) => u.id === id)!;

// Good
const user = users.find((u) => u.id === id);
if (!user) throw new MeaningfulError();
```
