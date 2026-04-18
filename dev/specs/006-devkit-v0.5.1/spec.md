# Feature Spec: DevKit v0.5.1 Installer Safety Patch

## Overview

DevKit v0.5.1 fixes installer partial-install behavior and moves development artifacts under `dev/` so normal users see a cleaner repository.

## Functional Requirements

- FR-001: Installer MUST preflight all destinations before writing.
- FR-002: Installer MUST fail without writing when a destination conflict exists and `--force` is not passed.
- FR-003: Installer MUST keep development history out of default docs install.
- FR-004: Installer MUST support `--include-dev` for users who want development history installed.
- FR-005: Repository MUST move specs, version plans, and reports under `dev/`.
- FR-006: DevKit MUST provide `scripts/verify.sh`.
- FR-007: Docs and changelog MUST describe v0.5.1 behavior.

## Acceptance Criteria

- AC-001: Conflict install leaves no partial copied skills.
- AC-002: Default install does not create docs `dev/`.
- AC-003: `--include-dev` installs docs `dev/`.
- AC-004: `scripts/verify.sh` passes.
- AC-005: README points normal users to docs, skills, templates, scripts, and examples while keeping `dev/` contributor-oriented.

## Verification

- Run `scripts/verify.sh`.
- Run `git diff --check`.
- Confirm root has no `specs/` or `reports/` directories.
