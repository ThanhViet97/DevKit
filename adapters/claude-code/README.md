# Claude Code Adapter

Claude Code uses DevKit through:

- `CLAUDE.md` for persistent project or user instructions
- `.claude/skills/` for project skills
- `docs/`, `templates/`, and `examples/` for supporting guidance

## Install User Skills

```bash
scripts/install.sh --agent claude-code
```

## Install Project Adapter

```bash
scripts/install.sh --agent claude-code --agent-target /path/to/project
```

Project install copies `CLAUDE.md` and DevKit skills into `.claude/skills/`.

