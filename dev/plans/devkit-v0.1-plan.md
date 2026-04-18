# DevKit v0.1 Plan

## Goal

DevKit v0.1 is a small workflow layer for practical AI-assisted coding. It helps agents clarify requirements, understand existing code before editing, and keep spec/plan/tasks aligned with implementation.

DevKit does not replace Spec Kit or GitNexus. DevKit provides rules, workflows, and thin skill wrappers so those tools are used at the right time.

## Core Direction

- Spec Kit is the primary foundation for spec-driven development.
- GitNexus is used for code understanding, impact analysis, debugging, refactoring, and review in brownfield codebases.
- DevKit rules act as guardrails so agents do not start coding while requirements remain unclear.
- unapproved external workflow is reference material only and is not part of the v0.1 core.
- Caveman-inspired terse mode is not integrated in v0.1. Keep it in the backlog for a future terse/professional output mode.

## Scope v0.1

DevKit v0.1 focuses only on practical development problems:

- Clarify requirements before coding.
- Create specs, plans, and tasks that are clear enough to implement.
- For existing repos, inspect code and impact before editing.
- When a code change affects behavior, update the relevant artifacts.
- Provide clear workflows for new features, brownfield changes, bugfixes, and reviews.

## Non-Goals v0.1

- Do not fork or copy the core source of Spec Kit, GitNexus, unapproved external workflow, or Caveman-inspired terse mode.
- Do not build a marketplace or complex plugin system.
- Do not implement automatic parallel build orchestration.
- Do not add Caveman-inspired terse mode by default.
- Do not create a UI.
- Do not over-engineer the rule system.

## Base Rules

1. Spec is source of truth.
2. Do not code when critical requirement decisions are unclear.
3. Make reasonable assumptions only when low-risk, and record them.
4. Every acceptance criterion must map to a task or verification step.
5. For brownfield work, inspect code and impact before editing.
6. If implementation changes behavior, update spec, plan, or tasks.

## Main Workflows

### New Feature

```text
idea
-> /speckit.specify
-> /speckit.clarify
-> /speckit.plan
-> /speckit.tasks
-> /speckit.analyze
-> implement
-> test
```

Use when:

- Building a new feature from idea or product request.
- Requirement is not yet captured in a spec.

Gate:

- Do not run implementation while spec still has critical ambiguity.
- Proceed only when acceptance criteria are testable enough.

### Brownfield Change

```text
request
-> GitNexus context/explore
-> GitNexus impact
-> create/update spec
-> plan/tasks
-> edit
-> test
-> update artifacts if behavior changed
```

Use when:

- Changing an existing codebase.
- Touching shared modules, public contracts, data model, or user-visible behavior.

Gate:

- Inspect current implementation before deciding solution.
- Check impact before editing files with wide blast radius.

### Bugfix

```text
bug report
-> reproduce or locate failure
-> GitNexus debug/trace
-> patch
-> focused test
-> update artifact if behavior changed
```

Use when:

- User reports a bug, failing test, runtime error, or unexpected behavior.

Gate:

- Prefer understanding root cause before patching symptom.
- If fix changes expected behavior, update spec or task notes.

### Review

```text
diff
-> GitNexus impact
-> code review findings
-> missing tests/spec drift check
-> recommendation
```

Use when:

- Reviewing PR, branch, diff, or recent code changes.

Gate:

- Findings first, ordered by severity.
- Call out behavior regression, missing tests, and artifact drift.

## Skill Skeleton v0.1

DevKit skills should be thin wrappers. They guide order of work; they should not duplicate Spec Kit or GitNexus internals.

Planned skills:

```text
skills/
  devkit-requirement-gate/
  devkit-spec-flow/
  devkit-brownfield-flow/
  devkit-debug-flow/
  devkit-review-flow/
```

Not planned for v0.1:

```text
skills/
  devkit-terse/
  devkit-terse-persona/
  devkit-parallel-build/
  devkit-external-workflow/
```

## Tool Roles

### Spec Kit

Use for:

- Constitution and project principles.
- Feature spec.
- Clarification before planning.
- Technical plan.
- Task generation.
- Cross-artifact analysis.
- Implementation flow.

### GitNexus

Use for:

- Codebase overview.
- Execution flow exploration.
- Symbol/context lookup.
- Impact analysis.
- Debug tracing.
- Refactor safety.
- PR/diff review.

### unapproved external workflow

Reference only for now.

Ideas worth borrowing later:

- Acceptance criteria coverage matrix.
- Tiered task plan.
- Gate review between implementation phases.
- Inspect/check flow after implementation.
- Parallel work packets for independent tasks.

### Caveman-inspired terse mode

Backlog only for now.

Possible v0.3 use:

- Terse professional output mode.
- Short review comments.
- Short commit messages.
- Context/memory compression.

Do not use gimmick speech as default DevKit style.

## Roadmap

### v0.1

- Create DevKit plan and rules.
- Create initial skill skeleton.
- Define main workflows.
- Dogfood DevKit on this repo.
- Keep implementation simple.

### v0.2

- Add artifact consistency check.
- Add acceptance criteria coverage matrix.
- Add review gate before implement or merge.
- Improve brownfield update/reconcile flow.

### v0.3

- Add terse-output optional mode.
- Add terse review output.
- Add terse commit message workflow.
- Add context/memory compression workflow.

## Next Steps

1. Create base rules file for DevKit.
2. Create initial `skills/` skeleton.
3. Write the first Spec Kit feature spec for DevKit itself.
4. Use the workflow on DevKit development instead of adding ad-hoc files.
5. Review after first real use and remove anything that feels heavy.
