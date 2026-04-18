# DevKit For Gemini CLI

Use DevKit as a workflow layer for AI-assisted software development.

## Core Rules

1. Clarify requirements before coding when ambiguity affects behavior, data, UX, security, acceptance criteria, tests, or implementation correctness.
2. Treat specs, plans, tasks, and acceptance criteria as the source of truth for non-trivial work.
3. Inspect existing code and likely impact before brownfield edits.
4. Map every acceptance criterion to a task or verification step.
5. Update artifacts when implementation changes behavior.
6. Keep output concise and practical.

## Workflow Selection

- New feature: requirement gate -> spec -> clarify -> plan -> tasks -> analyze -> implement -> test.
- Brownfield change: code context -> impact analysis -> spec/update -> plan/tasks -> edit -> test.
- Bugfix: reproduce or locate failure -> trace root cause -> patch -> focused verification.
- Review: diff -> impact -> findings -> missing tests or artifact drift -> recommendation.

Use installed DevKit docs, templates, examples, and skills under `devkit/` when more detail is needed.

