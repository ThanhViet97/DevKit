# Feature Spec: DevKit v0.4 Open-Source Readiness

## Overview

DevKit v0.4 makes the repository understandable and usable by another developer. It adds open-source hygiene files, usage documentation, and dogfood reports that apply DevKit's own quality gates.

## Goals

- Provide open-source license, contribution, security, and ignore files.
- Improve the README as a clear entrypoint.
- Add usage documentation for workflows, skills, and external tool roles.
- Add dogfood reports for artifact consistency, acceptance coverage, and review gate.
- Keep DevKit Markdown-first and lightweight.

## Non-Goals

- Do not add executable install automation.
- Do not integrate Cavekit.
- Do not add automatic parallel build orchestration.
- Do not add plugin marketplace behavior.
- Do not enable terse mode globally.

## User Scenarios

### Scenario 1: New developer evaluates DevKit

A developer opens the repo and uses the README to understand what DevKit is, what is included, and where to start.

### Scenario 2: Contributor proposes a change

A contributor reads `CONTRIBUTING.md`, understands version boundaries, and updates artifacts when changing behavior.

### Scenario 3: User applies DevKit manually

A user reads `docs/getting-started.md`, chooses a workflow, opens the relevant skill, and uses templates for checks or reports.

### Scenario 4: Maintainer verifies repo consistency

A maintainer reads dogfood reports to confirm that v0.4 artifacts are covered and do not introduce blocked gaps.

## Functional Requirements

- FR-001: DevKit MUST provide an open-source license.
- FR-002: DevKit MUST provide contribution guidance.
- FR-003: DevKit MUST provide security reporting guidance.
- FR-004: DevKit MUST provide a `.gitignore`.
- FR-005: DevKit MUST update the README as the primary entrypoint.
- FR-006: DevKit MUST provide getting started documentation.
- FR-007: DevKit MUST provide workflow documentation.
- FR-008: DevKit MUST provide skill catalog documentation.
- FR-009: DevKit MUST provide Spec Kit and GitNexus integration guidance.
- FR-010: DevKit MUST provide dogfood artifact check, coverage matrix, and review gate reports.
- FR-011: DevKit MUST update active version metadata to v0.4.
- FR-012: DevKit MUST keep executable install automation out of v0.4.

## Acceptance Criteria

- AC-001: A developer can identify DevKit's purpose and entrypoints from `README.md`.
- AC-002: A contributor can find contribution and review expectations in `CONTRIBUTING.md`.
- AC-003: A user can find security reporting guidance in `SECURITY.md`.
- AC-004: Local/editor/build files are covered by `.gitignore`.
- AC-005: A user can manually apply DevKit from `docs/getting-started.md`.
- AC-006: A user can choose a workflow from `docs/workflows.md`.
- AC-007: A user can choose a skill from `docs/skills.md`.
- AC-008: A user can understand Spec Kit and GitNexus roles from `docs/spec-kit-and-gitnexus.md`.
- AC-009: v0.4 dogfood reports exist in `reports/`.
- AC-010: No executable install automation, Cavekit integration, parallel build orchestration, plugin marketplace behavior, or global terse mode is added.

## Assumptions

- MIT is an acceptable default license for this open-source-ready draft.
- DevKit should remain usable without installing anything.
- Usage docs are more valuable than automation at this stage.

## Verification

- List repo files and confirm v0.4 artifacts exist.
- Check active version in `AGENTS.md` and `README.md`.
- Check expected docs and hygiene files exist.
- Check dogfood reports exist.
- Confirm excluded implementation paths do not exist.
