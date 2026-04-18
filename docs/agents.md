# Agent Adapters

DevKit is agent-neutral. The core workflow lives in `AGENTS.md`, `skills/`, `docs/`, `templates/`, and `examples/`. Adapters translate that workflow into the file conventions of each coding agent.

## Adapter Map

| Agent | Primary files | Install command |
| --- | --- | --- |
| Codex | `AGENTS.md`, `skills/` | `scripts/install.sh --agent codex` |
| Claude Code | `CLAUDE.md`, `.claude/skills/` | `scripts/install.sh --agent claude-code` |
| Cursor | `.cursor/rules/devkit.mdc` | `scripts/install.sh --agent cursor --agent-target /path/to/project` |
| Gemini CLI | `GEMINI.md` | `scripts/install.sh --agent gemini-cli --agent-target /path/to/project` |
| OpenCode | `AGENTS.md`, `opencode.json` | `scripts/install.sh --agent opencode --agent-target /path/to/project` |
| Cline | `.clinerules/devkit.md` | `scripts/install.sh --agent cline --agent-target /path/to/project` |

Install every project adapter:

```bash
scripts/install.sh --agent all --agent-target /path/to/project
```

## Agent Notes

### Codex

Use Codex with DevKit's root `AGENTS.md` and Agent Skill folders. Codex remains supported, but it is not DevKit's identity.

### Claude Code

Claude Code can use `CLAUDE.md` for persistent instructions and `.claude/skills/` for project skills. DevKit installs the same `skills/` workflow folders into Claude Code's skill directory.

### Cursor

Cursor project rules live in `.cursor/rules/` as `.mdc` files. DevKit installs one agent-requested rule, `devkit.mdc`, so Cursor can attach the workflow when the task needs it.

### Gemini CLI

Gemini CLI loads project context from `GEMINI.md` files. DevKit installs a concise `GEMINI.md` that points Gemini toward the DevKit workflow.

### OpenCode

OpenCode reads `AGENTS.md` and can also load instruction references from `opencode.json`. DevKit installs both so OpenCode can reuse the same root rules as Codex-compatible agents.

### Cline

Cline workspace rules live in `.clinerules/`. DevKit installs one focused rule file, `.clinerules/devkit.md`.

## Boundary

Adapters should stay thin. Add shared workflow behavior to core DevKit files, not separately to each adapter, unless the behavior is specific to that agent's file format.

## References

- Claude Code memory and skills: `https://code.claude.com/docs/en/memory`, `https://code.claude.com/docs/en/skills`
- Cursor rules: `https://docs.cursor.com/context/rules`
- Gemini CLI context files: `https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html`
- OpenCode rules: `https://opencode.ai/docs/rules/`
- Cline rules: `https://docs.cline.bot/customization/cline-rules`

