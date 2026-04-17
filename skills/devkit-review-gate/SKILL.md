---
name: devkit-review-gate
description: Use before implementation handoff or merge to decide whether findings, uncovered criteria, or artifact drift should block progress.
---

# DevKit Review Gate

## Goal

Prevent high-risk work from moving forward while keeping low-risk advisory notes from slowing normal development.

## When To Use

Use this skill:

- Before merging a PR or branch.
- Before advancing from planning to implementation on risky work.
- After an artifact check or coverage matrix finds gaps.
- After a code review finds P0/P1 issues.

## Gate Levels

- `Blocked`: must fix before proceeding.
- `Advisory`: proceed allowed, but follow-up should be tracked.
- `Deferred`: intentionally delayed with owner/rationale.
- `Pass`: no material issues found.

## Blockers

Block on:

- Incorrect behavior.
- Security or privacy risk.
- Breaking public API, data contract, or migration path.
- Missing verification for critical behavior.
- Spec/implementation contradiction.
- Unresolved clarification that changes implementation.

## Non-Blockers

Do not block on:

- Cosmetic wording.
- Minor documentation cleanup.
- Low-risk refactor notes.
- Nice-to-have tests for unchanged behavior.

## Output

Use this shape:

```text
Review gate: blocked|advisory|deferred|pass
Decision:
- ...
Required fixes:
- ...
Follow-up:
- ...
```
