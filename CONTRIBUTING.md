# Contributing

Thank you for helping improve DevKit.

DevKit is intentionally small. Changes should make AI-assisted development clearer, safer, or easier to apply without adding unnecessary process.

## Development Principles

- Keep workflows lightweight and practical.
- Prefer Markdown guidance before executable automation.
- Do not copy source from Spec Kit, GitNexus, Cavekit, or Caveman.
- Keep external tools decoupled.
- Preserve version boundaries in `AGENTS.md`.
- Add or update specs, plans, tasks, and reports when behavior changes.

## Change Workflow

1. Read `AGENTS.md`.
2. Identify the active version.
3. Create or update the relevant spec in `specs/`.
4. Update docs, skills, templates, or reports.
5. Run a manual artifact check for non-trivial changes.
6. Update the task checklist.

## Review Expectations

Reviews should focus on:

- unclear requirements
- artifact drift
- missing acceptance coverage
- over-engineering
- version boundary violations
- copied upstream source

## Commit Messages

Prefer concise Conventional Commit style when it fits:

```text
docs: add v0.4 getting started guide
feat: add artifact consistency template
chore: update active version metadata
```

## Scope Discipline

If a change belongs to a future version, document it in a plan or task first. Do not implement it early unless explicitly approved.
