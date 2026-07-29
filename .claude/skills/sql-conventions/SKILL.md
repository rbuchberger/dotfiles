---
name: sql-conventions
description: Follow these conventions when writing SQL. If you are using an ORM, only reference if you are writing a raw SQL string or template that it will pass through to the database more or less directly.
---

## Naming

Do not use the common convention of aliasing tables to single letters. If a name is awkwardly long
for the context, give it a meaningful alias.

Bad:

```sql
    SELECT 
        r.title, r.id
    FROM
        user_account_issue_resolutions r
    INNER JOIN
       user_account_issues i ON r.issue_id = i.id
    WHERE
      i.account_id = ?;
```

Good:

```sql
    SELECT 
        resolutions.title, resolutions.id
    FROM
        user_account_issue_resolutions AS resolutions
    INNER JOIN
       user_account_issues AS issues ON resolutions.issue_id = issues.id
    WHERE
      issues.account_id = ?;
```
