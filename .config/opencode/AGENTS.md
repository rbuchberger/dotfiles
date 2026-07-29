# AGENTS.md

Be extremely concise.

## Code Style

Applies to every language. Language specifics live in the skills below.

- Use guard clauses. Return early instead of nesting.
- Never use a nested ternary. Avoid multiline ternaries.
- Names are complete words, as short as possible while staying specific
  in context. In a module `DB::Users`: `create`, `delete`, `getAll`,
  `getById`. Not `getUser` or `deleteUser` (redundant), not
  `getUserFromDatabase` (verbose), not `cr` or `crUsr` (abbreviated).
- Single letters only for: declared and used on one line (`users.map((u) => u.name)`), or strong
  conventions like `i`/`j`/`k` for loops or `e` for errors.
- Never add a comment that restates a function or variable name. Comment
  only when the purpose of a block is not obvious, when deviating from
  the standard approach, or for a gotcha that cannot be eliminated. Before adding such a comment,
  consider changing the code so it is not necessary.
- Never use emojis or UTF symbols such as ✅ or ❌ in code or comments,
  and especially not inside user-facing text.

## Skills

Load these when the work touches them; they are not otherwise in context.

- `typescript-conventions` - TypeScript and TSX.
- `react-conventions` - React components and Tailwind.
- `html-css-conventions` - HTML, CSS, templates, accessibility.
- `sql-conventions` - SQL authoring.
- `research-writeup` - format for online research write-ups.

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
