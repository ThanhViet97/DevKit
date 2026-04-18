# Feature Spec: DevKit v0.5 Install And Examples

## Overview

DevKit v0.5 makes the public repository easier to install, update, and apply in real projects. It adds a lightweight installer, install documentation, examples, changelog, and release-ready artifacts.

## Goals

- Provide a safe installer for skills and docs.
- Document install and update flows.
- Provide examples for common DevKit workflows.
- Document release history in a changelog.
- Keep DevKit Markdown-first and low-complexity.

## Non-Goals

- Do not add package-manager distribution.
- Do not integrate unapproved external workflow.
- Do not add automatic parallel build orchestration.
- Do not add plugin marketplace behavior.
- Do not enable terse mode globally.

## User Scenarios

### Scenario 1: Preview an install

A user runs `scripts/install.sh --dry-run` and sees exactly which skills and docs would be installed.

### Scenario 2: Install DevKit locally

A user runs `scripts/install.sh` and DevKit copies skills to the local Codex skills directory and docs to the local DevKit docs directory.

### Scenario 3: Use symlink mode

A contributor runs `scripts/install.sh --mode symlink` so local edits in the repo are reflected in installed skills and docs.

### Scenario 4: Update an existing install

A user pulls the latest repo changes, runs dry-run with `--force`, then replaces installed DevKit files.

### Scenario 5: Learn from examples

A user opens `examples/` and follows a representative new feature, brownfield change, review, or context compression workflow.

## Functional Requirements

- FR-001: DevKit MUST provide a shell installer at `scripts/install.sh`.
- FR-002: The installer MUST support `--dry-run`.
- FR-003: The installer MUST default to `copy` mode.
- FR-004: The installer MUST support opt-in `symlink` mode.
- FR-005: The installer MUST refuse to replace existing paths unless `--force` is passed.
- FR-006: The installer MUST support custom skills and docs targets.
- FR-007: DevKit MUST provide install documentation.
- FR-008: DevKit MUST provide examples for new feature, brownfield change, review, and context compression workflows.
- FR-009: DevKit MUST provide a changelog.
- FR-010: DevKit MUST update active version metadata to v0.5.
- FR-011: DevKit MUST keep package-manager distribution and excluded integrations out of v0.5.

## Acceptance Criteria

- AC-001: `scripts/install.sh --help` documents install options.
- AC-002: `scripts/install.sh --dry-run --no-docs` runs without modifying installed files.
- AC-003: `bash -n scripts/install.sh` passes.
- AC-004: `docs/install.md` documents default install, custom targets, copy/symlink mode, update flow, and overwrite policy.
- AC-005: `examples/` contains the four approved workflow examples.
- AC-006: `CHANGELOG.md` documents v0.5.0.
- AC-007: `AGENTS.md` and `README.md` state v0.5 is active.
- AC-008: No package-manager distribution, unapproved external workflow integration, parallel build orchestration, plugin marketplace behavior, or global terse mode is added.

## Assumptions

- Bash is available on target machines that use the installer.
- Copy mode is safer than symlink mode as the default.
- Users who want replacement behavior can explicitly pass `--force`.

## Verification

- Run `bash -n scripts/install.sh`.
- Run `scripts/install.sh --help`.
- Run `scripts/install.sh --dry-run --no-docs`.
- Check expected docs, examples, changelog, and specs exist.
- Search for excluded implementation paths.
