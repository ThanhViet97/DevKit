# DevKit v0.2 Plan

## Goal

DevKit v0.2 adds lightweight quality gates around the v0.1 workflow. The goal is to catch artifact drift, uncovered acceptance criteria, and review-blocking gaps without turning DevKit into a heavy automation framework.

## Scope v0.2

- Add artifact consistency check guidance.
- Add acceptance criteria coverage matrix guidance.
- Add review gate guidance before implementation or merge.
- Add brownfield reconcile guidance for updating spec, plan, and tasks after gaps are found.
- Add reusable report templates.

## Non-Goals v0.2

- Do not implement v0.3.
- Do not add Caveman integration.
- Do not add Cavekit integration.
- Do not add automatic parallel build orchestration.
- Do not add executable automation unless a later version explicitly needs it.

## New Skills

```text
skills/
  devkit-artifact-check/
  devkit-coverage-matrix/
  devkit-review-gate/
  devkit-reconcile-flow/
```

## New Templates

```text
templates/
  artifact-consistency-check.md
  acceptance-coverage-matrix.md
  reconcile-report.md
```

## Gate Policy

Gates should block only when a gap affects correctness, behavior, security, data contracts, or testability.

Do not block on cosmetic documentation issues. Report them as advisory.

## Main Additions

### Artifact Consistency

Check that:

- `spec.md` requirements are represented in `plan.md` or `tasks.md`.
- `plan.md` decisions do not contradict `spec.md`.
- `tasks.md` includes verification for behavior-changing work.
- Assumptions and clarifications are not stale.

### Acceptance Coverage

Map each acceptance criterion to:

- requirement ID
- task ID
- verification method
- current status
- owner or next action when uncovered

### Review Gate

Before implementation or merge, classify gaps:

- Blocker: must fix before proceeding.
- Advisory: should fix soon but does not block.
- Deferred: intentionally postponed with rationale.

### Reconcile Flow

When implementation and artifacts drift, update the smallest necessary artifact set:

- `spec.md` for intended behavior changes
- `plan.md` for architecture or contract changes
- `tasks.md` for follow-up implementation or verification work

## Success Criteria

- A developer can run a manual artifact consistency review using the template.
- A developer can create a coverage matrix that maps acceptance criteria to tasks and verification.
- A reviewer can distinguish blocker gaps from advisory notes.
- Brownfield gaps can be reconciled without recreating the whole feature.
