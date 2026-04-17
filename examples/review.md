# Example: Review

## Request

Review a change that adds project archiving.

## Workflow

```text
diff
-> impact analysis
-> findings
-> missing tests/spec drift
-> review gate
```

## Findings

- `P1 src/projects/archive.ts:42` - Archive does not check project ownership. A user could archive another user's project. Fix: verify ownership before changing status.
- `P2 src/projects/list.ts:18` - Default list still includes archived projects. This violates AC-002. Fix: exclude archived projects unless the archive filter is active.

## Missing Tests

- Add ownership test for archive action.
- Add default list test that excludes archived projects.

## Review Gate

Status: `blocked`

Required fixes:

- Add ownership check.
- Exclude archived projects from default list.
- Add tests for both behaviors.

Follow-up:

- Re-run artifact check after fixes.
