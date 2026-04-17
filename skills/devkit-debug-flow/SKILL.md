---
name: devkit-debug-flow
description: Use when debugging a failing test, runtime error, reported bug, crash, or unexpected behavior.
---

# DevKit Debug Flow

## Goal

Fix bugs by identifying root cause before patching symptoms.

## When To Use

Use this skill when:

- The user asks why something fails.
- A test, build, app, or command fails.
- There is a crash, exception, or incorrect behavior.
- The expected behavior is known or can be clarified.

## Workflow

```text
bug report
-> reproduce or locate failure
-> requirement gate if expected behavior is unclear
-> trace execution path
-> identify root cause
-> patch
-> focused test
-> update artifact if behavior changed
```

## GitNexus Usage

Use GitNexus debugging tools when available to trace execution flow and related symbols.

If unavailable, use:

- Failing command output
- Focused search
- Relevant tests
- Local call flow inspection

## Rules

- Capture the concrete failure before editing when feasible.
- Prefer a minimal fix that addresses root cause.
- Add or update a focused test when risk justifies it.
- If the fix changes intended behavior, update spec or task notes.

## Output

Report:

- Failure observed
- Root cause
- Fix made
- Verification performed
- Remaining risk, if any
