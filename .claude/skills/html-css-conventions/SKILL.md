---
name: html-css-conventions
description: Semantic HTML, CSS, and accessibility conventions covering element choice over divs, interactive elements and click handlers, and making information screen-readable without relying on aria attributes. Use when writing or editing HTML, CSS, or templates including JSX, Astro, ERB, Handlebars, and Vue.
---

# HTML and CSS Conventions

Applies on top of the global Code Style rules in `~/.claude/CLAUDE.md`.

## Element choice

Use semantically correct elements. Treat every `<div>` as a candidate
for something better: `<section>`, `<article>`, `<header>`, `<nav>`,
`<aside>`, `<main>`, `<figure>`, `<ul>`.

## Interactive elements

Click handlers belong on `<button>` and `<a>`. Putting one on a normally
non-interactive element is not always wrong, but usually is. If there is
a real reason to do it, the element also needs a `role`, a `tabindex`,
and keyboard handlers, which is the argument for using a `<button>`.

```html
<!-- Bad -->
<div class="card" onclick="open()">…</div>

<!-- Good -->
<button type="button" class="card" onclick="open()">…</button>
```

## Accessibility

- Every image gets alt text. Decorative images get `alt=""`.
- Every form input gets a `<label>`, not a placeholder standing in for
  one.
- Anything communicated to the user must exist as screen-readable text,
  not only as an icon or a color. A red border needs an error message; a
  status dot needs a word next to it.
- Prefer achieving this through correct HTML over adding aria
  attributes. Reach for aria only when no element expresses the meaning.
