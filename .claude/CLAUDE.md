# AGENTS.md

## Tone

- Do not flatter, do not give compliments. Sycophancy is not useful.
- Be skeptical. Feel free to ask many questions.
- Be extremely concise. Sacrifice grammar for the sake of concision.

## Tool Usage

- You are welcome and encouraged to consult any relevant documentation, online or locally.
- You are limited to read-only git commands.
  - Never change the state of the repository. Do not use `git commit`, `git rebase`, `git add`, etc.
    Don't even THINK about changing history.
  - You are welcome and encouraged to review git history (`git log`, `git reflog`, `git status`,
    etc) to build context.

## Code Style

- First and foremost, follow the existing conventions within whatever codebase we're working in.
- Prefer a Functional style over Object Oriented. (Defer to whatever is idiomatic.)
- Stick to 80 character line widths.
- Try to keep code flat. Avoid deep nesting.  
- Prefer immutability; use constants and make copies instead of modifying values in place.
- If you repeat a chunk of code 3 times or more, extract it for reuse.
- If a file is longer than about 100 lines, try to break it out into smaller ones.
- Never use a nested ternary. Avoid multiline ternaries.
- Use guard clauses to avoid repeated checks within a function body.
- Never add a comment that is a restatement of a function or variable name.
- Only add comments in the following scenarios:
  - The purpose of a block of code is not obvious (possibly because it is long or convoluted).
  - We are deviating from the standard or obvious way to accomplish something.
  - If there are any caveats, gotchas, or foot-guns, and only if they can't be eliminated.
- Never use emojis or UTF symbols such as ✅ or ❌ in code or comments, and especially not inside
  user-facing text.
- Variable and function names should be complete words, and as short as possible while
  maintaining specificity in the given context. Example: in a module `DB::Users`, `create`, `delete`,
  `getAll`, `getById`, etc. would be good names. Bad names would be `getUser` or `deleteUser`, because
  they are redundant. Worse names would be `getUserFromDatabase`, `validateUserAndPersistToDatabase`,
  `cr`, or `crUsr`.
- Single letter variable names are only acceptable in the following scenarios:
  - The variable is declared and used in the same line, such as short function definitions - `users.map((u) => u.name)`
  - i, j, and k for indexing within loops.
  - Extremely common conventions, such as e for "event" in an event handler or for "error" in an error handler.
- Before you implement a new solution to some general problem, look for an existing helper or
  utility. For example, if you need to alphabatize an array of users by name, look for a utils
  folder that might have an alphabatizer in it.
- Prefer array methods over loops.
  Good: `myArray.forEach(...)`
  Bad: `for (const el of myArray) {...}`

## Context-specific Instructions

### HTML

When working with HTML and CSS (including templates):

- Use semantically correct elements. Try to replace `<div>`s with something else; `<section>`,
  `<header>`, `<nav>`, etc.
- Think carefully before putting a click handler on a normally non-interactive element. It's not
  necessarily wrong, but it often is.
- Prioritize accessibility. Add alt text and form input labels, and ensure that all information
  communicated to the user is provided as some form of appropriately screen-readable text; not just
  icons or colors.

### Typescript

- Prefer `function myFunc() {}` over `const myFunc = () => {}`
- Provide types for function parameters and return values, but rely on inference within
  function bodies.
- Avoid importing complex types for input parameters. Write a smaller type that only specifies
  the properties we care about, and use a generic if necessary to provide the correct return type
  for consumers.
- Avoid `as SomeType`. Fix the types.
- Avoid non-null `!` assertions, even if you're sure it's correct. Verify in a way that typescript
understands.

### React

- Perform existence checks once, near the top of the component.
- Component boundaries are a good tool to deal with the rules of hooks and potentially undefined
  data. (Check presence in the parent component, handle missing data appropriately. Pass to child
  component as a required prop and use hooks freely.)
- Reduce or avoid logic inside JSX template code.
- Fetch data near the top of the component tree, ideally at the page level. Pass down as props.
- Tailwind is meant to be used with components. If you are writing the same set of classes
  repeatedly, extract a component.
- It's ok to put multiple components in one file, though don't let the file get too big. This can be
  useful when creating components not intended for use elsewhere.
- When rendering a dynamic list, use a property of the item being iterated over (preferably the ID)
  as the key. Never use the array index, that defeats the purpose.
  Good: `{items.map((item) => <li key={item.id}>item.name</li>)}`
  Bad: `{items.map((item, index) => <li key={index}>item.name</li>)}`

### Online Research

When I ask you to do research and write up the results:

- Please include all of the URLs you referenced near the beginning of the file.
- Do not begin planning the implementation.
- Do not place a summary at the end.
- If I have specific questions, focus on answering them rather than creating a general overview.

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
