---
name: react-conventions
description: React and Tailwind conventions covering existence checks, component boundaries as a tool for the rules of hooks, where to fetch data, keeping logic out of JSX, and when to extract a component. Use when writing, editing, or reviewing React components.
---

# React Conventions

Applies on top of `typescript-conventions` and the global Code Style
rules in `~/.claude/CLAUDE.md`.

## Existence checks and component boundaries

Do every existence check once, near the top of the component. A
component boundary is the tool for dealing with the rules of hooks and
possibly-undefined data: check presence in the parent, handle the
missing case there, and pass the value to a child as a required prop so
the child can use hooks freely.

```tsx
function ProfilePage({ userId }: { userId: string }) {
  const { data: user } = useUser(userId);
  if (!user) return <ProfileSkeleton />;
  return <Profile user={user} />;
}

// user is required here, so hooks below it are unconditional.
function Profile({ user }: { user: User }) {
  const initials = useInitials(user.name);
  return <article>{initials}</article>;
}
```

## Data fetching

Fetch near the top of the tree, ideally at the page level. Pass results
down as props.

## JSX

Reduce or avoid logic inside the template. Compute values above the
`return` and name them.

## Tailwind

Tailwind is meant to be used with components. Repeating the same set of
classes is the signal to extract a component, not to copy the string.

## File layout

Multiple components per file is fine, and useful for components not
intended for use elsewhere. The global ~200 line limit still applies.
