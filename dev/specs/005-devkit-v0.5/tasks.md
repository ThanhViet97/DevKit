# Tasks: DevKit v0.5

## Phase 1: Version Metadata

- [x] T001 Create v0.5 plan at `docs/devkit-v0.5-plan.md`.
- [x] T002 Update `AGENTS.md` and `README.md` to mark v0.5 active.

## Phase 2: Installer

- [x] T003 Create `scripts/` directory.
- [x] T004 Create `scripts/install.sh`.
- [x] T005 Create `docs/install.md`.

## Phase 3: Examples And Changelog

- [x] T006 Create `examples/new-feature.md`.
- [x] T007 Create `examples/brownfield-change.md`.
- [x] T008 Create `examples/review.md`.
- [x] T009 Create `examples/context-compress.md`.
- [x] T010 Create `CHANGELOG.md`.

## Phase 4: Dogfood Artifacts

- [x] T011 Create `specs/005-devkit-v0.5/spec.md`.
- [x] T012 Create `specs/005-devkit-v0.5/plan.md`.
- [x] T013 Create `specs/005-devkit-v0.5/tasks.md`.
- [x] T014 Create `reports/devkit-v0.5-artifact-check.md`.
- [x] T015 Create `reports/devkit-v0.5-coverage-matrix.md`.
- [x] T016 Create `reports/devkit-v0.5-review-gate.md`.

## Phase 5: Verification

- [x] T017 Run `bash -n scripts/install.sh`.
- [x] T018 Run `scripts/install.sh --help`.
- [x] T019 Run `scripts/install.sh --dry-run --no-docs`.
- [x] T020 Confirm expected docs, examples, changelog, and v0.5 artifacts exist.
- [x] T021 Confirm no package-manager distribution, unapproved external workflow integration, parallel build orchestration, plugin marketplace behavior, or global terse mode was added.
- [x] T022 Commit and push v0.5.
- [x] T023 Create and push tag `v0.5.0`.
- [x] T024 Create GitHub release `v0.5.0`.
