# DevKit For Claude Code

Use DevKit as a workflow layer for AI-assisted software development.

## Core Rules

1. Clarify requirements before coding when ambiguity affects behavior, data, UX, security, acceptance criteria, or verification.
2. Treat specs, plans, tasks, and acceptance criteria as the source of truth for non-trivial work.
3. Inspect existing code and likely impact before brownfield edits.
4. Map every acceptance criterion to an implementation task or verification step.
5. Update artifacts when implementation changes behavior.
6. Keep output concise and findings-first during review.

## Tool Roles

- Use Spec Kit style artifacts for requirements, clarification, planning, tasks, and analysis.
- Use GitNexus style exploration for codebase context, impact analysis, debugging, refactor safety, and review.
- Use Caveman-inspired terse workflows only for token-efficient professional output. Do not add unapproved external workflow layers or use gimmick speech.

## DevKit Skills

If DevKit skills are installed, prefer the relevant skill in `.claude/skills/`:

- `devkit-requirement-gate`
- `devkit-spec-flow`
- `devkit-brownfield-flow`
- `devkit-debug-flow`
- `devkit-review-flow`
- `devkit-artifact-check`
- `devkit-coverage-matrix`
- `devkit-review-gate`
- `devkit-reconcile-flow`
- `devkit-terse-output`
- `devkit-terse-review`
- `devkit-commit-message`
- `devkit-context-compress`

Load only the skill needed for the current task.
