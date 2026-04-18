---
name: devkit-requirement-gate
description: Use before code-changing work to decide whether requirements are clear enough to proceed, or whether the user must answer clarification questions first.
---

# DevKit Requirement Gate

## Goal

Prevent coding from starting when a decision would materially affect correctness, scope, UX, data, security, tests, or acceptance criteria.

## When To Use

Use this skill before:

- New feature implementation
- Brownfield behavior changes
- Refactors with user-visible or contract impact
- Bugfixes where expected behavior is unclear
- Any task that lacks a usable spec, task, or acceptance criteria

## Gate Checklist

Proceed only if these are true:

- User goal is clear enough to define success.
- Critical scope boundaries are known.
- Main user/system behavior is testable.
- Data model or state changes are clear enough.
- Security/privacy impact is either clear or not relevant.
- Acceptance criteria can map to tasks or verification.

## Clarification Rules

Ask questions only when the answer changes implementation or validation.

Prioritize:

1. Scope and exclusions
2. User-visible behavior
3. Data model and state transitions
4. Security, privacy, or compliance
5. Acceptance criteria and tests

Do not ask about low-risk details. Make a reasonable assumption and record it.

## Output

If clear:

```text
Requirement gate: pass
Assumptions: ...
Next: ...
```

If blocked:

```text
Requirement gate: blocked
Need clarification:
1. ...
2. ...
```

Keep questions short. Prefer 1-3 questions per round.

## Terse Mode

When the user has requested terse output or the session is using `devkit-terse-output`, use this shape instead:

Pass:

```text
Gate: pass
Assumptions: <any>
Next: <next action>
```

Blocked:

```text
Gate: blocked
Q:
1. ...
2. ...
```
