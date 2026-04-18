# Feature Spec: DevKit v0.3 Terse Workflows

## Overview

DevKit v0.3 adds optional terse workflows for concise answers, review findings, commit messages, and context compression. These workflows reduce noisy output while preserving technical decisions, constraints, risks, and verification details.

## Goals

- Provide optional terse output guidance.
- Provide concise review finding guidance.
- Provide commit message guidance.
- Provide context compression guidance.
- Keep terse mode opt-in and professional.

## Non-Goals

- Do not enable terse mode globally.
- Do not use caveman-speak as the default style.
- Do not copy Caveman source code.
- Do not integrate Cavekit.
- Do not add automatic parallel build orchestration.
- Do not add plugin marketplace behavior.

## User Scenarios

### Scenario 1: Request concise output

A user asks for a shorter response. The agent removes filler while preserving decisions, risks, commands, file paths, and next actions.

### Scenario 2: Write terse review findings

A reviewer needs compact PR comments. The agent returns findings with severity, file reference, impact, and required fix.

### Scenario 3: Generate a commit message

A developer asks for a commit message. The agent returns a concise Conventional Commit style message with optional body and verification notes.

### Scenario 4: Compress context

A long session or repo memory needs compression. The agent produces a compact summary that preserves state, decisions, files, verification, open items, and next actions.

## Functional Requirements

- FR-001: DevKit MUST provide a terse output skill.
- FR-002: DevKit MUST provide a terse review skill.
- FR-003: DevKit MUST provide a commit message skill.
- FR-004: DevKit MUST provide a context compression skill.
- FR-005: DevKit MUST provide templates for terse review, commit message, and context compression.
- FR-006: DevKit MUST update active version metadata to v0.3.
- FR-007: DevKit MUST keep terse workflows optional.
- FR-008: DevKit MUST not copy Caveman source code or enable caveman-speak by default.
- FR-009: DevKit MUST keep Cavekit, parallel build orchestration, and plugin marketplace behavior out of v0.3.

## Acceptance Criteria

- AC-001: A developer can find v0.3 guidance in `docs/devkit-v0.3-plan.md`.
- AC-002: `AGENTS.md` states that v0.3 is active.
- AC-003: The repo contains four v0.3 skills: terse output, terse review, commit message, and context compression.
- AC-004: The repo contains three v0.3 templates: terse review, commit message, and context compression.
- AC-005: Terse output rules explicitly preserve technical detail and decisions.
- AC-006: No Cavekit, parallel build orchestration, plugin marketplace behavior, or copied Caveman source is added.
- AC-007: v0.3 tasks map acceptance criteria to verification steps.

## Assumptions

- Terse workflows are useful as opt-in guidance before any automation exists.
- Commit message generation should prefer Conventional Commit style when it fits.
- Context compression should preserve constraints and decisions over narrative.

## Verification

- List repo files and confirm v0.3 artifacts exist.
- Check all skill frontmatter.
- Confirm `AGENTS.md` and `README.md` name v0.3 as active.
- Confirm no Cavekit, parallel build, plugin marketplace, or copied Caveman source implementation exists.
