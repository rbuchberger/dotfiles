---
name: html-css-conventions
description: Use when writing or editing HTML, CSS, or templates that render them.
---

- Use semantically correct elements. Treat every `<div>` as a candidate
  for something better.

- Every image gets alt text. Decorative images get `alt=""`.
- Every form input gets a `<label>`, not a placeholder standing in for
  one.
- Anything communicated to the user must exist as screen-readable text,
  not only as an icon or a color. A red border needs an error message; a
  status dot needs a word next to it.
- Prefer achieving this through correct HTML over adding aria
  attributes.
- Click handlers belong on `<button>` and `<a>`. Putting one on a normally
  non-interactive element is not always wrong, but usually is. If there is
  a real reason to do it, the element also needs a `role`, a `tabindex`,
  and keyboard handlers.

```html
<!-- Bad -->
<div class="card" onclick="open()">…</div>

<!-- Good -->
<button type="button" class="card" onclick="open()">…</button>
```
