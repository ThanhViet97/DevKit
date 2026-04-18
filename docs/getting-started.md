# Getting Started

This guide shows how to use DevKit manually in an AI-assisted coding session.

## 1. Read The Rules

Start with:

```text
AGENTS.md
```

This file defines the active version, core rules, workflow order, and version boundaries.

## 2. Choose A Workflow

Use `docs/workflows.md` to choose one:

- New feature
- Brownfield change
- Bugfix
- Review
- Artifact check
- Reconcile
- Terse output

## 3. Pick The Skill

Use `docs/skills.md` to pick the relevant skill.

Skills are thin workflow wrappers. They tell an agent when to ask questions, when to inspect code, when to check impact, and what output shape to use.

## 4. Create Or Update Artifacts

For new work in your own project, create a spec under that project's `specs/` directory.

DevKit's own development artifacts live under:

```text
dev/
```

For existing work, update the smallest necessary artifact:

- `spec.md` for intended behavior
- `plan.md` for architecture or contracts
- `tasks.md` for implementation and verification work

## 5. Check Before Coding

Before non-trivial implementation:

- run the requirement gate
- check artifact consistency
- confirm acceptance criteria coverage
- inspect brownfield code and impact when changing existing code

## 6. Verify And Report

After changes:

- run relevant tests or manual checks
- update artifacts if behavior changed
- report changed files and verification

## Minimal Session Shape

```text
1. Clarify requirement
2. Create or update spec
3. Plan and task the work
4. Check coverage
5. Implement
6. Verify
7. Reconcile artifacts if needed
```
