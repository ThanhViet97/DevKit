# DevKit v0.6 Plan

## Goal

DevKit v0.6 makes DevKit agent-neutral by adding adapters for multiple coding agents while keeping shared workflow logic in one place.

## Scope

- Add adapters for Codex, Claude Code, Cursor, Gemini CLI, OpenCode, and Cline.
- Require explicit `--agent` in the installer.
- Add `--agent-target` for project-local adapter files.
- Keep Caveman-inspired terse workflows as custom DevKit guidance for token-efficient output.
- Keep shared workflow behavior in `AGENTS.md`, `skills/`, `docs/`, and `templates/`.
- Update docs, changelog, and verifier.

## Non-Goals

- Do not add package-manager distribution.
- Do not add unapproved external integrations.
- Do not add plugin marketplace behavior.
- Do not add adapters beyond the approved six agents.
- Do not vendor or fork any external agent source.

## Success Criteria

- Users can install Codex and Claude Code skill adapters.
- Users can install project adapters for Cursor, Gemini CLI, OpenCode, and Cline.
- `--agent all --agent-target /path/to/project` installs all project adapter files.
- `scripts/install.sh` no longer assumes Codex when no agent is provided.
- `scripts/verify.sh` passes.
