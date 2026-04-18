# Codex Adapter

Codex uses DevKit through:

- `AGENTS.md` for project rules
- `skills/` for workflow skills
- `docs/`, `templates/`, and `examples/` for supporting guidance

## Install User Skills

```bash
scripts/install.sh --agent codex
```

## Install Project Rules

```bash
scripts/install.sh --agent codex --agent-target /path/to/project
```

Project install copies `AGENTS.md` into the target project. User install copies skills to `${CODEX_HOME:-$HOME/.codex}/skills` and docs to `${CODEX_HOME:-$HOME/.codex}/devkit`.

