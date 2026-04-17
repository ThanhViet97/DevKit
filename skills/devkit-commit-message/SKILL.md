---
name: devkit-commit-message
description: Use to generate concise commit messages from changed files, behavior, and verification results.
---

# DevKit Commit Message

## Goal

Generate compact, useful commit messages that describe behavior or artifact changes.

## When To Use

Use this skill when:

- The user asks for a commit message.
- Work is ready to commit.
- A change needs a short summary for handoff.

## Rules

- Prefer Conventional Commit style when it fits.
- Use imperative mood.
- Mention the user-visible or workflow-visible change.
- Do not mention implementation noise unless it matters.
- Include verification only in the body when useful.

## Output Shape

Short:

```text
feat: add DevKit v0.3 terse workflows
```

With body:

```text
feat: add DevKit v0.3 terse workflows

- add terse output, review, commit, and compression skills
- add templates for compact review, commit, and context summaries
- mark v0.3 active while keeping terse mode optional

Verified: rg --files; skill frontmatter check
```
