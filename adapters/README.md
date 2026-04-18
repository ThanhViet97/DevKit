# Agent Adapters

DevKit adapters translate the same workflow rules into file conventions used by different coding agents.

Adapters do not fork agent internals. They provide lightweight rules that point agents back to DevKit's shared docs, skills, templates, and examples.

## Supported Agents

| Agent | Adapter files | Notes |
| --- | --- | --- |
| Codex | `AGENTS.md`, `skills/` | Uses DevKit's root agent rules and Agent Skill folders. |
| Claude Code | `CLAUDE.md`, `.claude/skills/` | Uses Claude project memory plus project skills. |
| Cursor | `.cursor/rules/devkit.mdc` | Uses project rules in MDC format. |
| Gemini CLI | `GEMINI.md` | Uses Gemini context files. |
| OpenCode | `AGENTS.md`, `opencode.json` | Uses project rules and config instruction references. |
| Cline | `.clinerules/devkit.md` | Uses workspace rules. |

## Install Shape

Install one adapter into a target project:

```bash
scripts/install.sh --agent cursor --agent-target /path/to/project
```

Install all project adapters into a target project:

```bash
scripts/install.sh --agent all --agent-target /path/to/project
```

The installer refuses to overwrite existing files unless `--force` is passed.

