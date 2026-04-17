# Implementation Plan: DevKit v0.4

## Technical Context

- Repository type: lightweight workflow/documentation kit
- Runtime code: none in v0.4
- Primary artifacts: Markdown docs, rules, skills, templates, specs, tasks, and reports
- License: MIT
- Install automation: out of scope

## Architecture

v0.4 adds:

```text
LICENSE
.gitignore
CONTRIBUTING.md
SECURITY.md
docs/getting-started.md
docs/workflows.md
docs/skills.md
docs/spec-kit-and-gitnexus.md
reports/devkit-v0.4-artifact-check.md
reports/devkit-v0.4-coverage-matrix.md
reports/devkit-v0.4-review-gate.md
specs/004-devkit-v0.4/
```

v0.4 updates:

```text
AGENTS.md
README.md
specs/003-devkit-v0.3/tasks.md
```

## Design Decisions

- Keep open-source readiness as documentation-only.
- Use MIT license with `DevKit contributors`.
- Keep README concise and point to deeper docs.
- Use dogfood reports instead of executable checks.
- Preserve all previous version artifacts.

## Acceptance Coverage

| AC ID | Requirement ID | Task ID | Verification |
| --- | --- | --- | --- |
| AC-001 | FR-005 | T005 | Read `README.md` |
| AC-002 | FR-002 | T002 | Read `CONTRIBUTING.md` |
| AC-003 | FR-003 | T003 | Read `SECURITY.md` |
| AC-004 | FR-004 | T004 | Read `.gitignore` |
| AC-005 | FR-006 | T006 | Read `docs/getting-started.md` |
| AC-006 | FR-007 | T007 | Read `docs/workflows.md` |
| AC-007 | FR-008 | T008 | Read `docs/skills.md` |
| AC-008 | FR-009 | T009 | Read `docs/spec-kit-and-gitnexus.md` |
| AC-009 | FR-010 | T010..T012 | Check `reports/` |
| AC-010 | FR-012 | T016 | Search excluded implementation paths |

## Verification Plan

- Run `rg --files`.
- Run `rg -n "v0.4" AGENTS.md README.md`.
- Run `test -f` checks for expected docs and hygiene files.
- Search for excluded implementation paths.
