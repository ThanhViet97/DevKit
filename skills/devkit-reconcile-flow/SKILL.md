---
name: devkit-reconcile-flow
description: Use when implementation, spec, plan, or tasks drift and the artifacts need to be brought back into sync without recreating the feature.
---

# DevKit Reconcile Flow

## Goal

Bring artifacts back into sync after gaps are discovered in brownfield work, implementation, review, or testing.

## When To Use

Use this skill when:

- Code behavior differs from `spec.md`.
- `plan.md` no longer matches architecture or contracts.
- `tasks.md` misses remediation or verification work.
- A review finds artifact drift.
- A bugfix changes intended behavior.

## Workflow

```text
gap report
-> identify affected artifact
-> ask clarification only if behavior changes
-> update spec/plan/tasks surgically
-> add follow-up tasks
-> produce reconcile report
```

## Update Rules

- Update `spec.md` for intended behavior changes.
- Update `plan.md` for architecture, contract, or integration changes.
- Update `tasks.md` for remaining implementation, tests, or docs work.
- Prefer append-only notes unless replacing stale or contradictory text.
- Do not recreate the feature from scratch.

## Output

Use `templates/reconcile-report.md` when appropriate.

Report:

- Gap found
- Artifact updated
- New or changed tasks
- Remaining open decisions
- Suggested next gate
