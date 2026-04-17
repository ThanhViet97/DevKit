---
name: devkit-coverage-matrix
description: Use to map acceptance criteria to requirements, tasks, and verification before implementation or review.
---

# DevKit Coverage Matrix

## Goal

Make sure every acceptance criterion has an implementation task and a verification path.

## When To Use

Use this skill:

- After `spec.md` and `tasks.md` exist.
- Before implementation starts.
- During review when missing tests or unimplemented requirements are suspected.
- After reconcile work changes acceptance criteria.

## Inputs

Prefer these artifacts when present:

- `spec.md`
- `tasks.md`
- `templates/acceptance-coverage-matrix.md`

## Matrix Columns

Track:

- Acceptance criterion ID
- Requirement ID
- Task ID
- Verification method
- Status
- Gap or next action

## Status Values

- `Covered`: task and verification exist.
- `Task Missing`: no task maps to the criterion.
- `Verification Missing`: task exists but no test/check exists.
- `Deferred`: intentionally postponed with rationale.
- `Blocked`: cannot proceed without clarification or work.

## Output

Return a compact matrix and call out blockers first.

Do not block on every missing test. Block when missing verification can hide behavior, security, data contract, or correctness risk.
