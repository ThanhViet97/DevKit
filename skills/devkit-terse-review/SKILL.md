---
name: devkit-terse-review
description: Use to produce concise review findings that keep severity, file references, risk, and required fixes intact.
---

# DevKit Terse Review

## Goal

Write short review comments that remain actionable.

## When To Use

Use this skill when:

- A review needs compact findings.
- The user asks for terse or one-line review output.
- Review findings will be copied into PR comments.

## Rules

Keep:

- severity
- file and line reference when available
- bug or risk
- required fix

Drop:

- long background
- generic praise
- repeated explanation
- optional commentary

## Output Shape

```text
P1 path/to/file:line - Problem. Impact. Fix.
P2 path/to/file:line - Problem. Impact. Fix.
```

If no findings:

```text
No blocking findings. Residual risk: ...
```
