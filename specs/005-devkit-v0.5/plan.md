# Implementation Plan: DevKit v0.5

## Technical Context

- Repository type: lightweight workflow/documentation kit
- Runtime code: shell-only installer
- Primary artifacts: Markdown docs, examples, specs, tasks, reports, and one Bash script
- Distribution: GitHub repository clone
- Package manager: out of scope

## Architecture

v0.5 adds:

```text
scripts/install.sh
docs/install.md
examples/new-feature.md
examples/brownfield-change.md
examples/review.md
examples/context-compress.md
CHANGELOG.md
specs/005-devkit-v0.5/
reports/devkit-v0.5-artifact-check.md
reports/devkit-v0.5-coverage-matrix.md
reports/devkit-v0.5-review-gate.md
```

v0.5 updates:

```text
AGENTS.md
README.md
```

## Installer Design

- Resolve repository root relative to `scripts/install.sh`.
- Install each skill directory into the skills target.
- Install docs package into the docs target unless `--no-docs` is passed.
- Default skills target: `${CODEX_HOME:-$HOME/.codex}/skills`.
- Default docs target: `${CODEX_HOME:-$HOME/.codex}/devkit`.
- Default mode: `copy`.
- Optional mode: `symlink`.
- Existing destination paths fail unless `--force` is passed.
- `--dry-run` prints commands and does not write.

## Acceptance Coverage

| AC ID | Requirement ID | Task ID | Verification |
| --- | --- | --- | --- |
| AC-001 | FR-001..FR-006 | T004 | Run `scripts/install.sh --help` |
| AC-002 | FR-002 | T004 | Run `scripts/install.sh --dry-run --no-docs` |
| AC-003 | FR-001 | T004 | Run `bash -n scripts/install.sh` |
| AC-004 | FR-007 | T005 | Read `docs/install.md` |
| AC-005 | FR-008 | T006..T009 | Check `examples/` files |
| AC-006 | FR-009 | T010 | Check `CHANGELOG.md` |
| AC-007 | FR-010 | T001, T002 | Read `AGENTS.md` and `README.md` |
| AC-008 | FR-011 | T018 | Search excluded implementation paths |

## Verification Plan

- Run installer syntax check.
- Run installer help.
- Run installer dry-run.
- List repo files.
- Search excluded implementation paths.
- Commit, push, tag `v0.5.0`, and create GitHub release notes if verification passes.
