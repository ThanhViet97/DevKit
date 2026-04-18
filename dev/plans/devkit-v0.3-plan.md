# DevKit v0.3 Plan

## Goal

DevKit v0.3 adds optional terse workflows for answers, reviews, commit messages, and context compression. The goal is to reduce noisy output while preserving technical accuracy and decisions.

## Scope v0.3

- Add optional terse output guidance.
- Add concise review finding guidance.
- Add concise commit message guidance.
- Add context and memory compression guidance.
- Add reusable templates for terse review, commit messages, and compression summaries.

## Non-Goals v0.3

- Do not enable terse mode globally.
- Do not use caveman-speak as the default style.
- Do not copy Caveman source code.
- Do not integrate Cavekit.
- Do not add automatic parallel build orchestration.
- Do not add plugin marketplace behavior.

## New Skills

```text
skills/
  devkit-terse-output/
  devkit-terse-review/
  devkit-commit-message/
  devkit-context-compress/
```

## New Templates

```text
templates/
  terse-review.md
  commit-message.md
  context-compression.md
```

## Terse Policy

Terse mode may remove filler, repetition, hedging, and long explanations.

Terse mode must preserve:

- user decisions
- requirements and constraints
- risks and blockers
- file paths
- commands
- verification results
- technical caveats

## Main Additions

### Terse Output

Use when the user asks for short output or when a workflow template expects a compact answer.

### Terse Review

Use for review comments that need to be short but still actionable.

### Commit Message

Generate concise commit messages from changed files, behavior, and verification.

### Context Compression

Compress long session notes, repo memory, or artifact summaries while preserving decisions and next actions.

## Success Criteria

- A developer can request terse output without changing default repo style.
- A reviewer can produce concise findings without dropping severity or file references.
- A developer can generate a compact commit message.
- Long context can be compressed while preserving decisions, constraints, and next steps.
