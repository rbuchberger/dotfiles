---
name: sql-conventions
description: Use when writing raw SQL, including SQL strings passed through an ORM.
---

Refer to tables by full name. If a name is awkwardly long, alias it to a meaningful word, never a
single letter:

```sql
SELECT resolutions.title, resolutions.id
FROM user_account_issue_resolutions AS resolutions
INNER JOIN user_account_issues AS issues ON resolutions.issue_id = issues.id
WHERE issues.account_id = ?;
```
