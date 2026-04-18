# Install

DevKit can be used directly from the repository, or installed into local agent directories.

The installer is intentionally small. It copies or symlinks existing Markdown skills, docs, templates, examples, and adapters. It does not install packages, download dependencies, or modify shell profiles.

## Choose An Agent

The installer requires an explicit agent:

```bash
scripts/install.sh --agent codex
```

Supported values:

```text
codex
claude-code
cursor
gemini-cli
opencode
cline
all
```

## Preview Install

```bash
scripts/install.sh --agent codex --dry-run
```

## Codex Install

```bash
scripts/install.sh --agent codex
```

Default Codex targets:

```text
skills: ${CODEX_HOME:-$HOME/.codex}/skills
docs:   ${CODEX_HOME:-$HOME/.codex}/devkit
```

## Claude Code Install

```bash
scripts/install.sh --agent claude-code
```

Default Claude Code targets:

```text
skills: ${CLAUDE_HOME:-$HOME/.claude}/skills
rules:  ${CLAUDE_HOME:-$HOME/.claude}/CLAUDE.md
docs:   ${CLAUDE_HOME:-$HOME/.claude}/devkit
```

## Project Adapter Install

Cursor, Gemini CLI, OpenCode, and Cline use project-local rule files, so they require `--agent-target`.

Install one adapter:

```bash
scripts/install.sh \
  --agent cursor \
  --agent-target /path/to/project
```

Install all project adapters:

```bash
scripts/install.sh \
  --agent all \
  --agent-target /path/to/project
```

When `--agent-target` is set, docs install to:

```text
/path/to/project/devkit
```

Project adapter files:

| Agent | Installed files |
| --- | --- |
| Codex | `AGENTS.md` |
| Claude Code | `CLAUDE.md`, `.claude/skills/` |
| Cursor | `.cursor/rules/devkit.mdc` |
| Gemini CLI | `GEMINI.md` |
| OpenCode | `AGENTS.md`, `opencode.json` |
| Cline | `.clinerules/devkit.md` |

## Custom Targets

```bash
scripts/install.sh \
  --agent codex \
  --skills-target "$HOME/.codex/skills" \
  --docs-target "$HOME/.codex/devkit"
```

## Copy vs Symlink

Default mode is `copy`.

```bash
scripts/install.sh --agent codex --mode copy
```

Use symlink mode when you want local changes in this repo to immediately affect installed skills:

```bash
scripts/install.sh --agent codex --mode symlink
```

## Overwrite Policy

The installer refuses to overwrite existing installed paths.

It checks all destination paths before writing. If any conflict exists and `--force` is not provided, the install fails before copying or symlinking files.

To replace existing DevKit files:

```bash
scripts/install.sh --agent codex --force
```

Use `--dry-run --force` first when replacing an existing install:

```bash
scripts/install.sh --agent codex --dry-run --force
```

## Skills Only

```bash
scripts/install.sh --agent codex --no-docs
```

## Include Development History

Development specs, plans, and dogfood reports live under `dev/`. They are not installed by default.

To include them in the docs install:

```bash
scripts/install.sh --agent codex --include-dev
```

## Verify The Installer

Run the local verification script:

```bash
scripts/verify.sh
```

It checks syntax, help output, required agent handling, dry-run behavior, temp copy install, temp symlink install, project adapter install, conflict preflight, force replacement, include-dev install, invalid agent handling, and invalid mode handling.

## Update From Git

```bash
git pull
scripts/install.sh --agent codex --dry-run --force
scripts/install.sh --agent codex --force
```

## Use In Another Repo

1. Choose the target agent in `docs/agents.md`.
2. Install the relevant adapter with `--agent-target`.
3. Choose a workflow from `docs/workflows.md`.
4. Create specs under the target repo's `specs/` directory.
5. Use templates from `templates/` for checks and reports.

## Safety Notes

- Run `--dry-run` before installing into an existing skill directory.
- Use `copy` mode when sharing a stable setup.
- Use `symlink` mode only when you understand that changes in this repo affect installed files immediately.
