---
name: react-conventions
description: Use when writing, editing, or reviewing React components.
---

- Do existence checks once, near the top of the component.
- Fetch data near the top of the tree, ideally at the page level.
- Reduce or avoid logic inside the template.
- Multiple components per file is fine, and useful for components not intended for use elsewhere.
- Component boundaries are a good way to deal with the rules of hooks and possibly undefined data:

```tsx
function ProfilePage({ userId }: { userId: string }) {
  const { data: user } = useUser(userId); // possibly undefined
  if (!user) return <ProfileSkeleton />;
  return <Profile user={user} />;
}

function Profile({ user }: { user: User }) {
    // user is definitely defined.
    useSomeHook()
    // 
}
```
