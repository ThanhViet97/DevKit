# Acceptance Coverage Matrix

Feature: `devkit-v0.5-install-and-examples`
Date: `2026-04-18`

## Matrix

| AC ID | Requirement ID | Task ID | Verification | Status | Gap / Next Action |
| --- | --- | --- | --- | --- | --- |
| AC-001 | FR-001..FR-006 | T004, T018 | Run `scripts/install.sh --help` | `covered` | None |
| AC-002 | FR-002 | T004, T019 | Run `scripts/install.sh --dry-run --no-docs` | `covered` | None |
| AC-003 | FR-001 | T004, T017 | Run `bash -n scripts/install.sh` | `covered` | None |
| AC-004 | FR-007 | T005, T020 | Read `docs/install.md` | `covered` | None |
| AC-005 | FR-008 | T006..T009, T020 | Check `examples/` files | `covered` | None |
| AC-006 | FR-009 | T010, T020 | Check `CHANGELOG.md` | `covered` | None |
| AC-007 | FR-010 | T001, T002, T020 | Read `AGENTS.md` and `README.md` | `covered` | None |
| AC-008 | FR-011 | T021 | Search excluded implementation paths | `covered` | None |

## Blockers

- None.

## Deferred Items

- Package-manager distribution is deferred to a future approved version.
- Shellcheck integration is deferred unless shell script surface grows.

## Notes

- Installer verification uses syntax, help, and dry-run checks to avoid modifying the user's installed skills.
