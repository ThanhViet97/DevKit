# DevKit Agent Rules

## Purpose

DevKit is a small workflow layer for AI-assisted software development. It coordinates Spec Kit, GitNexus, and local project rules so coding work starts from clear requirements and stays aligned with artifacts.

## Active Version

DevKit v0.6.0 is active.

DevKit v0.6.0 adds agent-neutral adapter support for Codex, Claude Code, Cursor, Gemini CLI, OpenCode, and Cline. Caveman-inspired terse workflows are allowed only as custom DevKit guidance for token-efficient output. Do not implement unapproved external integrations, parallel build orchestration, plugin marketplace behavior, global terse mode, package-manager distribution, or additional agent adapters until the user explicitly approves that work.

## Core Rules

1. Spec is source of truth.
2. Do not code when critical requirement decisions are unclear.
3. Make reasonable assumptions only when low-risk, and record them.
4. Every acceptance criterion must map to a task or verification step.
5. For brownfield work, inspect code and impact before editing.
6. If implementation changes behavior, update spec, plan, or tasks.

## Workflow Rules

For new features:

```text
idea -> spec -> clarify -> plan -> tasks -> analyze -> implement -> test
```

For brownfield changes:

```text
request -> code context -> impact -> spec/update -> plan/tasks -> edit -> test
```

For bugfixes:

```text
bug report -> reproduce/locate -> trace -> patch -> test -> artifact update if behavior changed
```

For reviews:

```text
diff -> impact -> findings -> missing tests/spec drift -> recommendation
```

For artifact checks:

```text
spec + plan + tasks -> consistency check -> coverage matrix -> open gaps
```

For reconcile work:

```text
gap report -> clarify if needed -> update spec/plan/tasks -> produce follow-up tasks
```

For terse output:

```text
normal answer -> remove filler -> preserve technical detail -> return concise result
```

For installation:

```text
choose agent -> inspect target -> dry-run when unsure -> copy or symlink -> verify installed adapter and skill files
```

## Tool Preference

- Use Spec Kit for requirement, clarification, plan, task, analysis, and implementation artifacts.
- Use GitNexus for codebase context, execution flow exploration, impact analysis, debugging, refactor safety, and review.
- Use DevKit's Caveman-inspired terse workflows only when token-saving output is requested or when an output format explicitly calls for concise text.
- Do not use caveman-speak or gimmick speech as the default style.
- Treat Codex, Claude Code, Cursor, Gemini CLI, OpenCode, and Cline as adapter targets, not as DevKit's identity.
- Keep adapter files thin; shared workflow logic belongs in `AGENTS.md`, `skills/`, `docs/`, and `templates/`.

## Output Discipline

Keep output concise and practical. Ask only questions that affect scope, behavior, data model, UX flow, security, acceptance criteria, test strategy, or implementation correctness.

When reviewing code, lead with findings ordered by severity.

When changing code or artifacts, summarize what changed and how it was verified.

Before non-trivial implementation or merge, check for artifact drift and uncovered acceptance criteria. Block only on gaps that affect correctness, behavior, security, data contracts, or testability.

Terse mode must not drop constraints, risks, commands, file paths, verification results, or user decisions.

Install workflows must require an explicit `--agent` and must not overwrite existing files unless the user explicitly passes `--force`.
