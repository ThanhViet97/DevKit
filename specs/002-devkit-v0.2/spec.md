# Feature Spec: DevKit v0.2 Quality Gates

## Overview

DevKit v0.2 extends v0.1 with lightweight quality gates for artifact consistency, acceptance coverage, review decisions, and brownfield reconciliation.

## Goals

- Detect drift between spec, plan, tasks, and implementation.
- Map acceptance criteria to tasks and verification.
- Classify review findings as blocker, advisory, deferred, or pass.
- Provide a reconcile flow for updating artifacts without recreating a feature.

## Non-Goals

- Do not implement v0.3.
- Do not integrate Caveman.
- Do not integrate Cavekit.
- Do not add automatic parallel build orchestration.
- Do not build executable automation in v0.2.

## User Scenarios

### Scenario 1: Check artifacts before implementation

An agent has a spec, plan, and tasks. Before coding, the agent checks whether requirements are represented in tasks and whether acceptance criteria have verification.

### Scenario 2: Build a coverage matrix

An agent maps each acceptance criterion to a requirement, task, and verification method so gaps are visible before implementation or review.

### Scenario 3: Gate a review

A reviewer finds issues and classifies them as blocker, advisory, deferred, or pass so the team knows whether work can proceed.

### Scenario 4: Reconcile drift

Implementation, spec, plan, or tasks drift. The agent updates the smallest necessary artifact set and creates follow-up tasks.

## Functional Requirements

- FR-001: DevKit MUST provide an artifact consistency check skill.
- FR-002: DevKit MUST provide an acceptance coverage matrix skill.
- FR-003: DevKit MUST provide a review gate skill.
- FR-004: DevKit MUST provide a reconcile flow skill.
- FR-005: DevKit MUST provide templates for artifact consistency checks, coverage matrices, and reconcile reports.
- FR-006: DevKit MUST update active version metadata to v0.2.
- FR-007: DevKit MUST keep v0.3, Caveman, Cavekit, and parallel build behavior out of v0.2.
- FR-008: DevKit MUST preserve all v0.1 rules and workflows unless explicitly superseded.

## Acceptance Criteria

- AC-001: A developer can find v0.2 guidance in `docs/devkit-v0.2-plan.md`.
- AC-002: `AGENTS.md` states that v0.2 is active and v0.3 requires explicit approval.
- AC-003: The repo contains four v0.2 skills: artifact check, coverage matrix, review gate, and reconcile flow.
- AC-004: The repo contains three reusable templates: artifact consistency check, acceptance coverage matrix, and reconcile report.
- AC-005: No v0.3, Caveman, Cavekit, or parallel build implementation is added.
- AC-006: v0.2 tasks map acceptance criteria to verification steps.

## Assumptions

- v0.2 should remain manual and Markdown-based.
- Automation can be considered later only if manual gates prove useful.
- Review gates should block only material correctness, behavior, security, data contract, or testability gaps.

## Verification

- List repo files and confirm v0.2 artifacts exist.
- Check all v0.2 skills have frontmatter.
- Confirm `AGENTS.md` and `README.md` name v0.2 as active.
- Confirm no v0.3/Caveman/Cavekit implementation directories exist.
