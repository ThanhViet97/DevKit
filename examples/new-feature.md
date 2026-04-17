# Example: New Feature

## Request

Add a project archive feature.

## Workflow

```text
idea
-> requirement gate
-> spec
-> clarify
-> plan
-> tasks
-> coverage matrix
-> implement
-> test
```

## Requirement Gate

Status: `blocked`

Need clarification:

1. Should archived projects be hidden by default or shown with a filter?
2. Can archived projects be restored?
3. Should archived projects remain included in analytics?

## After Clarification

Assumptions:

- Archived projects are hidden by default.
- Archived projects can be restored.
- Analytics include archived projects unless a report explicitly excludes them.

## Acceptance Criteria

- AC-001: A user can archive an active project.
- AC-002: Archived projects are hidden from the default project list.
- AC-003: A user can restore an archived project.
- AC-004: Archive and restore actions are recorded in the audit log.

## Task Mapping

| AC ID | Task | Verification |
| --- | --- | --- |
| AC-001 | Add archive action | Unit test and UI flow check |
| AC-002 | Add default list filter | Integration test |
| AC-003 | Add restore action | Unit test and UI flow check |
| AC-004 | Add audit log event | Unit test |

## Review Gate

Status: `pass`

No blockers. Verification covers all acceptance criteria.
