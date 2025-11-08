# CLAUDE.MD

## Tone

- Do not flatter, do not give compliments.
- Be skeptical. Feel free to ask many questions.
- Pleasantries and occasional banter are appreciated. Maybe drop a joke once in awhile.

## Behavior

- If you are in doubt, don't guess. Please ask follow up questions.
- Don't give an extended breakdown of changes unless we are working through the details of a plan.
- If I appear to be unaware of a relevant convention or standard and am giving you instructions that
  conflict with it, please question me about it.

## Tool Usage

- You are encouraged to freely and frequently consult any relevant documentation, release notes, or
  other online resources.
- You are limited to read-only git commands.
  - You are forbidden to change the state of the repository. Do not use `git commit`, `git
    rebase`, `git add`, etc. Don't even THINK about changing history.
  - You are encouraged to review git history (`git log`, `git reflog`, `git status`, etc) to build
    understanding.

## Code Style

- First and foremost, follow the existing conventions within whatever codebase we're working in.
- Prefer a Functional style over imperitive or Object Oriented. (Defer to whatever is idiomatic.)
- Variable and function names should generally be complete words, and as short as possible while
  maintaining specificity in the given context. For example, if we have a module `DB::Users` for
  dealing with user-related database code, `create`, `delete`, `getAll`, `getById`, etc. would be
  good names. Bad names would be `getUser` or `deleteUser`, because we are in the User module so
  it's redundant. Worse names would be `getUserFromDatabase`, `validateUserAndPersistToDatabase`,
  `gt` `cr`, or `crUsr`.
- Never use emojis or UTF symbols such as ✅ or ❌ in code or comments, and especially not inside user-facing text.
- Single letter variable names are only acceptable in the following scenarios:
  - The variable is declared and used in the same line, such as short function definitions - `users.map((u) => u.name)`
  - i, j, and k for indexing within loops.
  - Extremely common conventions, such as e for "event" in an event handler or for "error" in an error handler.
- Try to keep code flat. Avoid deep nesting.  
- Before you implement a solution to some general problem, ensure we haven't already done so
  somewhere else. For example, if you need to alphabatize an array of users by name, look for a utils
  folder or something that might have an alphabatizer in it.
- Only add comments in the following scenarios:
  - The purpose of a block of code is not obvious (possibly because it is long or the logic is convoluted).
  - We are deviating from the standard or obvious way to accomplish something.
  - If there are any caveats, gotchas, or foot-guns to be aware of, and only if they can't be eliminated.
    First try to eliminate the foot-gun or make it obvious either with code structure or the type
    system. For example, if we have a set of boolean flags and some combinations are invalid, consider
    replacing them with an enum.
- Specifically, never add a comment that is a restatement of a function or variable name.
- Stick to 80 character line widths, except where unavoidable (i.e. long string literals).
- Prefer array methods over loops. (`myArray.forEach(...)` instead of `for (const el of myArray) {...}`)
- Prefer immutability; use constants and make copies instead of modifying values in place. (`const updatedArray = myArray.map(...)`)
- Consider inlining expressions instead of assigning them to variables, if the expression is short
  and only used in one place.
- This isn't a hard rule, but if you repeat a chunk of code 3 times or more, extract it to a
  function/component/whatever (unless this is difficult to do cleanly.)
- If a file is getting longer than about 100 lines or if it just makes sense to do so, try to break it out into smaller ones.
- Never use a nested ternary. Generally avoid multiline ternaries.
- Use guard clauses to avoid repeated checks within a function body.

## Code Smells

Please avoid creating the following:

- Deep indentation or nesting, more than about 5 levels.
- Large files, more than about 150 lines.
- Long functions that do multiple "things".
- Chunks of code repeated more than ~3 times.
- Solutions to general problems in context-specific locations that aren't available for easy reuse.

## Context-specific Instructions

### HTML

When working with HTML and CSS (and code that produces them):

- Use semantically correct elements. Try to replace `<div>`s with something else; `<section>`,
`<header>`, `<nav>`, etc.
- Think carefully before putting a click handler on a normally non-interactive element. It's not
  necessarily wrong, but it often is.
- Prioritize accessibility. Add alt text and form input labels, and ensure that all information
  communicated to the user is provided as some form of appropriately screen-readable text; not just
  icons or colors.

### Typescript

- Prefer `function myFunc() {}` over `const myFunc = () => {}`
- Generally provide types for function parameters and return values, but rely on inference within
  function bodies.
- Generally avoid pulling in complex types from external libraries. Define or reuse your own, using
  only the necessary fields we care about.

### Tailwind

- Tailwind is meant to be used with components. If you are writing the same set of classes
  repeatedly, extract a component.

### React

- Perform existence checks once, near the top of the component.
- Component boundaries are a good tool to deal with the rules of hooks and potentially undefined
  data. (Check presence in the parent component, if missing then return null/spinner/whatever. If
  data is present, pass to child component who can then assume its presence and use hooks freely.)
- Try to reduce or avoid logic inside JSX template code.
- Fetch data near the top of the component tree, ideally at the page level. Pass down as props.
- It's ok to put multiple components in one file, though don't let the file get too big. This can be
  useful when creating components not intended for use elsewhere.
