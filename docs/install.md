# Install

DevKit can be used directly from the repository, or installed into local agent directories.

The installer is intentionally small. It copies or symlinks existing Markdown skills and docs. It does not install packages, download dependencies, or modify shell profiles.

## Preview Install

```bash
scripts/install.sh --dry-run
```

## Default Install

```bash
scripts/install.sh
```

Default targets:

```text
skills: ${CODEX_HOME:-$HOME/.codex}/skills
docs:   ${CODEX_HOME:-$HOME/.codex}/devkit
```

## Custom Targets

```bash
scripts/install.sh \
  --skills-target "$HOME/.codex/skills" \
  --docs-target "$HOME/.codex/devkit"
```

## Copy vs Symlink

Default mode is `copy`.

```bash
scripts/install.sh --mode copy
```

Use symlink mode when you want local changes in this repo to immediately affect installed skills:

```bash
scripts/install.sh --mode symlink
```

## Overwrite Policy

The installer refuses to overwrite existing installed paths.

To replace existing DevKit files:

```bash
scripts/install.sh --force
```

Use `--dry-run --force` first when replacing an existing install:

```bash
scripts/install.sh --dry-run --force
```

## Skills Only

```bash
scripts/install.sh --no-docs
```

## Update From Git

```bash
git pull
scripts/install.sh --dry-run --force
scripts/install.sh --force
```

## Use In Another Repo

1. Install the skills.
2. Copy or reference `AGENTS.md` in the target repo.
3. Choose a workflow from `docs/workflows.md`.
4. Create specs under the target repo's `specs/` directory.
5. Use templates from `templates/` for checks and reports.

## Safety Notes

- Run `--dry-run` before installing into an existing skill directory.
- Use `copy` mode when sharing a stable setup.
- Use `symlink` mode only when you understand that changes in this repo affect installed files immediately.
