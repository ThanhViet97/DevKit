# OpenCode Adapter

OpenCode uses DevKit through `AGENTS.md`. The adapter also installs `opencode.json` so OpenCode can include project instructions explicitly.

## Install

```bash
scripts/install.sh --agent opencode --agent-target /path/to/project
```

This installs `AGENTS.md`, `opencode.json`, and DevKit docs under `devkit/` in the target project.

