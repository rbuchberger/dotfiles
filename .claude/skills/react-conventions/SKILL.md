---
name: react-conventions
description: Use when writing, editing, or reviewing React components.
---

- Do existence checks once, near the top of the component.
- Fetch data near the top of the tree, ideally at the page level.
- Keep logic out of the template.
- Multiple components per file is fine, especially for ones not used elsewhere.
- Use component boundaries to handle possibly-undefined data and the rules of hooks: the parent does
  `if (!user) return <ProfileSkeleton />; return <Profile user={user} />`, and `Profile` gets a
  defined `user` and calls its hooks unconditionally.
