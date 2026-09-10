---
name: typescript-conventions
description: Use when writing, editing, or reviewing .ts or .tsx files.
---

- `function f() {}` over `const f = () => {}`. Arrows are fine for inline callbacks.
- Annotate parameters and return types. Let inference handle function bodies.
- Declare the shape you need instead of importing a large domain type to use part of it. Use a
  generic when the caller needs its own type back:
  `function byName<T extends { name: string }>(items: readonly T[]): T[]`
- Avoid `as` casts and non-null `!`, even when sure they hold. Narrow in a way the compiler checks:
  a type guard, a discriminated union, a schema parse at the boundary, or
  `if (!user) throw new MeaningfulError()`.
