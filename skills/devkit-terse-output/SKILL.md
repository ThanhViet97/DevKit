---
name: devkit-terse-output
description: Use when the user asks for concise output or when a DevKit workflow requires a compact answer without losing technical detail.
---

# DevKit Terse Output

## Goal

Produce short, precise output while preserving technical substance.

## When To Use

Use this skill when:

- The user asks for a short answer.
- A workflow template requires compact output.
- The response is mostly status, decision, summary, or next action.
- Long prose would slow down the user.

## Rules

Remove:

- filler
- repeated context
- unnecessary hedging
- broad explanations not needed for the decision

Preserve:

- requirements
- constraints
- risks
- commands
- file paths
- verification results
- decisions
- next actions

## Output Shape

Prefer:

```text
Decision: ...
Reason: ...
Next: ...
```

For code work:

```text
Changed: ...
Verified: ...
Next: ...
```

Do not use caveman-speak unless explicitly requested.
