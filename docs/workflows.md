# Workflows

## New Feature

Use when building a new feature from an idea or product request.

```text
idea
-> requirement gate
-> spec
-> clarify
-> plan
-> tasks
-> analyze
-> implement
-> test
```

Relevant skills:

- `devkit-requirement-gate`
- `devkit-spec-flow`
- `devkit-coverage-matrix`
- `devkit-artifact-check`

## Brownfield Change

Use when changing an existing codebase.

```text
request
-> requirement gate
-> code context
-> impact analysis
-> create/update spec
-> plan/tasks
-> edit
-> test
-> reconcile if behavior changed
```

Relevant skills:

- `devkit-requirement-gate`
- `devkit-brownfield-flow`
- `devkit-artifact-check`
- `devkit-reconcile-flow`

## Bugfix

Use when fixing a failing test, runtime error, crash, or incorrect behavior.

```text
bug report
-> reproduce or locate failure
-> clarify expected behavior if needed
-> trace root cause
-> patch
-> focused test
-> update artifacts if behavior changed
```

Relevant skills:

- `devkit-debug-flow`
- `devkit-requirement-gate`
- `devkit-reconcile-flow`

## Review

Use when reviewing a branch, diff, PR, or patch.

```text
diff
-> impact analysis
-> inspect risky paths
-> findings
-> missing tests/spec drift
-> recommendation
```

Relevant skills:

- `devkit-review-flow`
- `devkit-review-gate`
- `devkit-terse-review`

## Artifact Check

Use before non-trivial implementation or merge.

```text
spec + plan + tasks
-> consistency check
-> coverage matrix
-> blockers/advisory/deferred
```

Relevant skills:

- `devkit-artifact-check`
- `devkit-coverage-matrix`
- `devkit-review-gate`

## Reconcile

Use when implementation and artifacts drift.

```text
gap report
-> identify affected artifact
-> clarify if behavior changes
-> update spec/plan/tasks
-> add follow-up tasks
-> produce reconcile report
```

Relevant skills:

- `devkit-reconcile-flow`
- `devkit-artifact-check`
- `devkit-coverage-matrix`

## Terse Output

Use only when requested or when a template expects compact output.

This workflow is Caveman-inspired, but the style must stay professional and technical.

```text
normal answer
-> remove filler
-> preserve technical detail
-> return concise result
```

Relevant skills:

- `devkit-terse-output`
- `devkit-terse-review`
- `devkit-commit-message`
- `devkit-context-compress`
