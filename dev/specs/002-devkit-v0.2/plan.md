# Implementation Plan: DevKit v0.2

## Technical Context

- Repository type: lightweight workflow/documentation kit
- Runtime code: none in v0.2
- Primary artifacts: Markdown rules, skills, templates, specs, and tasks
- External tools: Spec Kit and GitNexus remain external

## Architecture

v0.2 adds:

```text
docs/
  devkit-v0.2-plan.md
skills/
  devkit-artifact-check/
  devkit-coverage-matrix/
  devkit-review-gate/
  devkit-reconcile-flow/
templates/
  artifact-consistency-check.md
  acceptance-coverage-matrix.md
  reconcile-report.md
specs/
  002-devkit-v0.2/
```

v0.2 updates:

```text
AGENTS.md
README.md
specs/001-devkit-v0.1/tasks.md
```

## Design Decisions

- Keep v0.2 manual and template-driven.
- Add gates as guidance, not hardcoded automation.
- Block only material gaps that can affect correctness or delivery.
- Keep v0.3 and Caveman out of scope.
- Keep Cavekit as reference-only.

## Acceptance Coverage

| AC ID | Requirement ID | Task ID | Verification |
| --- | --- | --- | --- |
| AC-001 | FR-001 | T001, T008 | Check `docs/devkit-v0.2-plan.md` exists |
| AC-002 | FR-006 | T002 | Read `AGENTS.md` |
| AC-003 | FR-001..FR-004 | T003..T006 | Check skill files and frontmatter |
| AC-004 | FR-005 | T007 | Check template files exist |
| AC-005 | FR-007 | T012 | Confirm no excluded directories/files |
| AC-006 | FR-008 | T009, T010 | Read v0.2 tasks and coverage mapping |

## Verification Plan

- Run `rg --files`.
- Run `rg -n "^(name|description):" skills`.
- Search for v0.3/Caveman/Cavekit implementation paths.
- Review `AGENTS.md` and `README.md` active version text.
