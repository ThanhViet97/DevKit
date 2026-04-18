# DevKit v0.5.1 Plan

## Goal

DevKit v0.5.1 patches installer safety and cleans the public repository layout before v0.6.

## Scope

- Add installer preflight conflict checks.
- Move development specs, plans, and reports under `dev/`.
- Keep development history available but out of the normal user path.
- Add `scripts/verify.sh`.
- Update docs and changelog.

## Non-Goals

- Do not add package-manager distribution.
- Do not add unapproved external workflow integration.
- Do not add parallel build orchestration.
- Do not add plugin marketplace behavior.

## Success Criteria

- Installer fails before writing if a destination conflict exists without `--force`.
- Default install does not include development history.
- `--include-dev` installs development history when requested.
- `scripts/verify.sh` passes.
