---
name: html-css-conventions
description: Use when writing or editing HTML, CSS, or templates that render them.
---

- Use semantic elements. Treat every `<div>` as a candidate for something better.
- Every image gets alt text (`alt=""` if decorative). Every input gets a `<label>`; a placeholder
  doesn't count.
- Anything shown by icon or color also needs screen-readable text: an error message with the red
  border, a word next to the status dot.
- Correct HTML over aria attributes.
- Click handlers go on `<button>` and `<a>`. If a non-interactive element really needs one, it also
  needs a `role`, `tabindex`, and keyboard handlers.
