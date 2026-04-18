# DevKit v0.5 Plan

## Goal

DevKit v0.5 makes the public repo easier to use from another machine or project. It adds install documentation, a lightweight installer, workflow examples, and changelog/release prep.

## Scope v0.5

- Add install and update documentation.
- Add a lightweight installer that copies or symlinks skills and docs.
- Add workflow examples.
- Add a changelog.
- Add v0.5 spec, plan, tasks, and dogfood reports.

## Non-Goals v0.5

- Do not add package-manager distribution.
- Do not add unapproved external workflow integration.
- Do not add automatic parallel build orchestration.
- Do not add plugin marketplace behavior.
- Do not enable terse mode globally.

## Installer Policy

- Default mode is `copy`.
- `symlink` is opt-in.
- `--dry-run` shows planned operations.
- Existing files are not overwritten unless `--force` is passed.
- The installer should be shell-only and easy to inspect.

## New Files

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

## Success Criteria

- A user can preview install operations with `scripts/install.sh --dry-run`.
- A user can install skills and docs without manual copying.
- Existing installed files are protected by default.
- Examples show how to apply the main DevKit workflows.
- Changelog documents the public v0.5.0 state.
