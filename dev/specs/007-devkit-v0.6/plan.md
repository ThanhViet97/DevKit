# Implementation Plan: DevKit v0.6

## Technical Context

- Runtime code: Bash installer and verifier.
- Artifact format: Markdown, MDC, and JSON adapter files.
- External integration style: file convention adapters only.

## Changes

- Add `adapters/` with per-agent templates and READMEs.
- Add `docs/agents.md`.
- Update `scripts/install.sh` with `--agent`, `--agent-target`, adapter path collection, and project adapter preflight.
- Update `scripts/verify.sh` for multi-agent installs.
- Update README, install docs, changelog, and active version rules.

## Verification Plan

- Installer syntax.
- Installer help.
- Missing `--agent` failure.
- Codex dry-run.
- Codex copy install.
- Codex symlink install.
- Include-dev install.
- Claude Code user install.
- All project adapters install.
- Skill conflict preflight.
- Project adapter conflict preflight.
- Force replacement.
- Invalid mode, invalid agent, and missing target failures.

