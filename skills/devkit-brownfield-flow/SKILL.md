---
name: devkit-brownfield-flow
description: Use when modifying an existing codebase, especially shared modules, public contracts, data models, or user-visible behavior.
---

# DevKit Brownfield Flow

## Goal

Make safe changes to an existing codebase by understanding current behavior and impact before editing.

## When To Use

Use this skill for:

- Existing feature changes
- Refactors
- Data model or public contract changes
- Changes across multiple files or modules
- User-visible behavior changes

## Workflow

```text
request
-> requirement gate
-> code context
-> impact analysis
-> create/update spec
-> plan/tasks
-> edit
-> test
-> update artifacts if behavior changed
```

## GitNexus Usage

Use GitNexus when available:

- `context` for repo overview and index freshness
- `query` or exploring workflow for execution flow
- `impact` for blast radius before editing
- `detect_changes` after edits when risk is not local

If GitNexus is unavailable, use local code search and focused file reads.

## Rules

- Read the existing implementation before proposing the change.
- Check likely callers, contracts, tests, and data flow.
- Keep edits scoped to the requested behavior.
- Do not rewrite unrelated code.
- If behavior changes, update spec, plan, or tasks.

## Output

Report:

- Current behavior found
- Files likely affected
- Impact risks
- Change made
- Verification performed
