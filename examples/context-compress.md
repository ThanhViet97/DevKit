# Example: Context Compress

## Original Context

The team discussed DevKit v0.5. The goal is to add a lightweight installer, install docs, examples, changelog, and release prep. The installer should default to copy mode, support symlink mode, support dry-run, and refuse to overwrite existing files unless `--force` is passed. DevKit should stay Markdown-first and should not add Cavekit, parallel build orchestration, package-manager distribution, plugin marketplace behavior, or global terse mode.

## Compressed Context

State:

- DevKit v0.5 is approved.
- Scope is install/use story and release prep.

Decisions:

- Add `scripts/install.sh`.
- Default installer mode is `copy`.
- `symlink` is opt-in.
- `--dry-run` previews operations.
- Existing paths are protected unless `--force` is passed.

Non-Goals:

- No package-manager distribution.
- No Cavekit integration.
- No automatic parallel build orchestration.
- No plugin marketplace.
- No global terse mode.

Files:

- `docs/install.md`: install and update guidance.
- `examples/`: workflow examples.
- `CHANGELOG.md`: release history.
- `specs/005-devkit-v0.5/`: v0.5 artifacts.

Next:

- Verify installer syntax and dry-run.
- Commit and push v0.5.
