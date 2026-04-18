# DevKit Workflow Rules

Use DevKit as a lightweight workflow layer for AI-assisted software development.

## Before Coding

- Ask targeted clarification questions when ambiguity affects behavior, data, UX, security, acceptance criteria, tests, or implementation correctness.
- For non-trivial work, create or update a spec, plan, and tasks before implementation.
- For brownfield changes, inspect existing code and likely impact before editing.

## During Implementation

- Treat specs, plans, tasks, and acceptance criteria as the source of truth.
- Map every acceptance criterion to a task or verification step.
- Make low-risk assumptions only when needed and record them.
- Update artifacts if implementation changes behavior or contracts.

## Review And Output

- For reviews, lead with findings ordered by severity.
- Report missing tests, artifact drift, and unverified acceptance criteria.
- Keep output concise without dropping risks, commands, file paths, verification results, or decisions.

Use installed DevKit docs, skills, templates, and examples under `devkit/` when more detail is needed.

