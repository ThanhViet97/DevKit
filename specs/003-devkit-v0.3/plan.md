# Implementation Plan: DevKit v0.3

## Technical Context

- Repository type: lightweight workflow/documentation kit
- Runtime code: none in v0.3
- Primary artifacts: Markdown rules, skills, templates, specs, and tasks
- External tools: Spec Kit and GitNexus remain external
- Caveman: used only as inspiration for optional terse workflows; source is not copied

## Architecture

v0.3 adds:

```text
docs/
  devkit-v0.3-plan.md
skills/
  devkit-terse-output/
  devkit-terse-review/
  devkit-commit-message/
  devkit-context-compress/
templates/
  terse-review.md
  commit-message.md
  context-compression.md
specs/
  003-devkit-v0.3/
```

v0.3 updates:

```text
AGENTS.md
README.md
specs/002-devkit-v0.2/tasks.md
```

## Design Decisions

- Keep terse workflows opt-in.
- Use professional concise output, not caveman-speak.
- Do not install or vendor Caveman.
- Keep all v0.3 behavior as Markdown guidance.
- Preserve v0.1 and v0.2 workflows.

## Acceptance Coverage

| AC ID | Requirement ID | Task ID | Verification |
| --- | --- | --- | --- |
| AC-001 | FR-001..FR-005 | T001 | Check `docs/devkit-v0.3-plan.md` exists |
| AC-002 | FR-006 | T002 | Read `AGENTS.md` |
| AC-003 | FR-001..FR-004 | T003..T006 | Check v0.3 skill files and frontmatter |
| AC-004 | FR-005 | T007..T009 | Check template files exist |
| AC-005 | FR-007, FR-008 | T003, T010 | Inspect terse output rules |
| AC-006 | FR-008, FR-009 | T014 | Search excluded implementation paths |
| AC-007 | FR-001..FR-009 | T011, T012 | Read v0.3 tasks and coverage mapping |

## Verification Plan

- Run `rg --files`.
- Run `rg -n "^(name|description):" skills`.
- Search for excluded implementation paths.
- Review `AGENTS.md` and `README.md` active version text.
