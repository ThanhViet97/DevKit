# Implementation Plan: DevKit v0.5.1

## Technical Context

- Runtime code: Bash installer and verifier
- Primary change: installer preflight and repo layout cleanup

## Changes

- Move `specs/` to `dev/specs/`.
- Move `reports/` to `dev/reports/`.
- Move version plans from `docs/` to `dev/plans/`.
- Add installer destination preflight.
- Add `--include-dev`.
- Add `scripts/verify.sh`.

## Verification Plan

- Installer syntax.
- Installer help.
- Dry-run.
- Temp copy install.
- Temp symlink install.
- Temp include-dev install.
- Conflict preflight with no partial files.
- Force replacement.
- Invalid mode failure.
