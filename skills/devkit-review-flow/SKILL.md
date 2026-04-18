---
name: devkit-review-flow
description: Use for reviewing a diff, branch, PR, or recent code changes with attention to bugs, regressions, missing tests, and artifact drift.
---

# DevKit Review Flow

## Goal

Review changes for defects and risk before merge or handoff.

## When To Use

Use this skill when:

- The user asks for a review.
- A PR, branch, diff, or patch needs risk assessment.
- The user asks whether a change is safe.

## Workflow

```text
diff
-> impact analysis
-> inspect risky paths
-> findings
-> missing tests/spec drift
-> recommendation
```

## Review Priorities

Findings first:

1. Correctness bugs
2. Security or privacy issues
3. Behavior regressions
4. Contract/API/data model drift
5. Missing tests for changed behavior
6. Spec, plan, or task drift

## Rules

- Do not summarize before findings.
- Order findings by severity.
- Include file and line references when possible.
- If no findings, say so and name residual risk or test gaps.
- Keep style concise and actionable.

## Tool Requirements

Use GitNexus `impact` and `detect_changes` when available to assess blast radius before finalizing findings.

If GitNexus is unavailable:

- Use local diff, grep, and file reads to inspect risky paths.
- See `docs/prerequisites.md` for setup guidance.

## Output

Use this shape:

```text
Findings
- P1 ...
- P2 ...

Open questions
- ...

Notes
- ...
```

## Terse Mode

When the user has requested terse output, compact output, or PR comment format, use `devkit-terse-review` instead:

```text
P1 path/to/file:line - Problem. Impact. Fix.
P2 path/to/file:line - Problem. Impact. Fix.
```

If no findings:

```text
No blocking findings. Residual risk: ...
```
