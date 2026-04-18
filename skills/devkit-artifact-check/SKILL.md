---
name: devkit-artifact-check
description: Use to check consistency between spec, plan, tasks, assumptions, and implementation notes before coding, review, or merge.
---

# DevKit Artifact Check

## Goal

Detect drift between requirements, planning decisions, tasks, and verification before work proceeds too far.

## When To Use

Use this skill:

- After tasks are generated and before implementation.
- Before merging a non-trivial change.
- When implementation changes behavior.
- When a reviewer suspects spec, plan, or tasks are stale.

## Inputs

Prefer these artifacts when present:

- `spec.md`
- `plan.md`
- `tasks.md`
- `templates/artifact-consistency-check.md`
- Relevant implementation notes or diff

## Checklist

Check for:

- Requirements missing from plan or tasks.
- Plan decisions that contradict spec requirements.
- Tasks that implement behavior not present in spec.
- Acceptance criteria without verification.
- Stale assumptions or clarifications.
- Behavior changes not reflected in artifacts.

## Gate Policy

Block only on gaps affecting correctness, behavior, security, data contracts, or testability.

Report cosmetic or low-risk documentation drift as advisory.

## Output

Use this shape:

```text
Artifact check: pass|blocked|advisory
Blockers:
- ...
Advisory:
- ...
Next actions:
- ...
```

## Terse Mode

When the user has requested terse output or the session is using `devkit-terse-output`, use this shape instead:

```text
Check: pass | blocked | advisory
Blockers: <item or none>
Advisory: <item or none>
Next: <action>
```
