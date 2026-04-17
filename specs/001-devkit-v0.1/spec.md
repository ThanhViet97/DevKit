# Feature Spec: DevKit v0.1 Workflow Kit

## Overview

DevKit v0.1 provides a minimal workflow layer for AI-assisted coding. It defines rules, skills, and artifacts that help agents clarify requirements, inspect existing code, plan work, and avoid drifting from specs.

## Goals

- Provide one clear rule file for agents.
- Provide thin skill wrappers for core development workflows.
- Provide a simple spec/plan/tasks artifact set for DevKit itself.
- Keep v0.1 small enough to use immediately.

## Non-Goals

- Do not fork or copy Spec Kit, GitNexus, Cavekit, or Caveman source code.
- Do not implement v0.2 or v0.3 behavior.
- Do not add Caveman integration in v0.1.
- Do not add Cavekit integration in v0.1.
- Do not build marketplace, plugin, UI, or parallel build orchestration.

## User Scenarios

### Scenario 1: Start a new feature

An agent receives a new feature request and uses DevKit rules to clarify requirements, produce spec/plan/tasks, and only then implement.

### Scenario 2: Change an existing codebase

An agent receives a brownfield change request and inspects code context and impact before editing files.

### Scenario 3: Debug a failure

An agent receives a bug report, reproduces or locates the failure, traces root cause, patches the issue, and verifies the fix.

### Scenario 4: Review a change

An agent reviews a diff with findings first, then calls out missing tests, behavior risk, and artifact drift.

## Functional Requirements

- FR-001: DevKit MUST define base rules for agents in `AGENTS.md`.
- FR-002: DevKit MUST include a v0.1 plan document.
- FR-003: DevKit MUST include skill skeletons for requirement gate, spec flow, brownfield flow, debug flow, and review flow.
- FR-004: Each skill MUST state when to use it, workflow order, rules, and expected output.
- FR-005: DevKit MUST state that v0.2 and v0.3 work requires explicit user approval.
- FR-006: DevKit MUST keep Cavekit as reference-only in v0.1.
- FR-007: DevKit MUST keep Caveman out of v0.1 implementation.
- FR-008: DevKit MUST provide initial spec, plan, and tasks artifacts for its own v0.1 work.

## Acceptance Criteria

- AC-001: A new agent can read `AGENTS.md` and know the active version, rules, and approval boundary.
- AC-002: A developer can inspect `skills/` and find the five v0.1 workflow skills.
- AC-003: A developer can read this spec and identify what v0.1 includes and excludes.
- AC-004: No v0.2, v0.3, Caveman, or Cavekit implementation files are added in v0.1.
- AC-005: The repo contains enough artifact structure to continue work through specs, plans, and tasks.

## Assumptions

- Spec Kit and GitNexus are external tools or workflows; DevKit v0.1 does not vendor their internals.
- v0.1 is documentation and skill-structure heavy; executable automation can come later only if approved.

## Verification

- Check expected files exist.
- Read skill frontmatter and confirm names/descriptions are present.
- Confirm `AGENTS.md` blocks unapproved v0.2/v0.3 work.
- Confirm no Caveman or Cavekit implementation directory exists.
