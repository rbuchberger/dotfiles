Fowler code smells (_Refactoring_, ch. 3), checked against the diff even when the repo documents no
standards. Each is a labelled judgement call ("possible Feature Envy"), never a hard violation. A
documented repo standard that endorses something suppresses the smell. Skip anything tooling
enforces.

Format: smell, what it is, then the fix.

- **Mysterious Name**: name doesn't reveal what it does or holds. Rename; if no honest name comes,
  the design is murky.
- **Duplicated Code**: same logic shape in more than one hunk or file of the change. Extract the
  shared shape.
- **Feature Envy**: method reaches into another object's data more than its own. Move it onto that
  data.
- **Data Clumps**: the same few fields or params keep travelling together. Bundle them into a type.
- **Primitive Obsession**: a primitive or string standing in for a domain concept. Give it its own
  small type.
- **Repeated Switches**: the same `switch`/`if`-cascade on the same type recurs across the change.
  Polymorphism, or one shared map.
- **Shotgun Surgery**: one logical change forces scattered edits across many files in the diff.
  Gather what changes together into one module.
- **Divergent Change**: one module edited for several unrelated reasons. Split it so each changes
  for one reason.
- **Speculative Generality**: abstraction, params, or hooks for needs the spec doesn't have. Delete
  and inline until a real need shows.
- **Message Chains**: long `a.b().c().d()` navigation the caller shouldn't depend on. Hide the walk
  behind one method.
- **Middle Man**: a class or function that mostly delegates. Call the real target directly.
- **Refused Bequest**: a subclass or implementer that ignores or overrides most of what it inherits.
  Use composition.
