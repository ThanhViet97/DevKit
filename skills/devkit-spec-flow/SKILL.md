---
name: devkit-spec-flow
description: Use for new features that should go through Spec Kit style specification, clarification, plan, tasks, analysis, implementation, and verification.
---

# DevKit Spec Flow

## Goal

Turn a new product or engineering request into a clear spec, plan, tasks, and verification path before implementation.

## When To Use

Use this skill when:

- The user asks for a new feature.
- No feature spec exists yet.
- The request needs product behavior, UX, data, or acceptance criteria.
- The task is bigger than a small one-line change.

## Workflow

```text
idea
-> requirement gate
-> /speckit.specify
-> /speckit.clarify
-> /speckit.plan
-> /speckit.tasks
-> /speckit.analyze
-> implement
-> test
```

## Rules

- Keep the spec focused on what and why, not implementation details.
- Use clarification before planning when ambiguity affects downstream work.
- Do not start implementation while critical `NEEDS CLARIFICATION` items remain.
- Ensure acceptance criteria are testable.
- After implementation, update artifacts if behavior changed.

## Output

Report:

- Spec path
- Plan path
- Tasks path
- Open assumptions
- Verification steps
