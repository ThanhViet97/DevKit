#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"

SKILLS_TARGET="$CODEX_ROOT/skills"
DOCS_TARGET="$CODEX_ROOT/devkit"
MODE="copy"
DRY_RUN=0
FORCE=0
INSTALL_DOCS=1

usage() {
  cat <<'USAGE'
Usage: scripts/install.sh [options]

Install DevKit skills and docs into local agent directories.

Options:
  --skills-target DIR   Directory where skill folders are installed
                        Default: ${CODEX_HOME:-$HOME/.codex}/skills
  --docs-target DIR     Directory where DevKit docs/templates/specs are installed
                        Default: ${CODEX_HOME:-$HOME/.codex}/devkit
  --mode MODE           copy or symlink. Default: copy
  --no-docs             Install skills only
  --dry-run             Print operations without changing files
  --force               Replace existing DevKit-installed paths
  -h, --help            Show this help

Examples:
  scripts/install.sh --dry-run
  scripts/install.sh
  scripts/install.sh --mode symlink
  scripts/install.sh --skills-target "$HOME/.codex/skills" --docs-target "$HOME/.codex/devkit"
USAGE
}

log() {
  printf '%s\n' "$*"
}

run() {
  if [[ "$DRY_RUN" == "1" ]]; then
    printf '[dry-run] '
    printf '%q ' "$@"
    printf '\n'
  else
    "$@"
  fi
}

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

replace_path() {
  local dest="$1"

  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$FORCE" != "1" ]]; then
      fail "$dest already exists. Re-run with --force to replace it."
    fi
    run rm -rf "$dest"
  fi
}

install_path() {
  local src="$1"
  local dest="$2"

  [[ -e "$src" ]] || fail "source path does not exist: $src"

  replace_path "$dest"
  run mkdir -p "$(dirname "$dest")"

  case "$MODE" in
    copy)
      run cp -R "$src" "$dest"
      ;;
    symlink)
      run ln -s "$src" "$dest"
      ;;
    *)
      fail "unknown mode: $MODE"
      ;;
  esac
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skills-target)
      [[ $# -ge 2 ]] || fail "--skills-target requires a directory"
      SKILLS_TARGET="$2"
      shift 2
      ;;
    --docs-target)
      [[ $# -ge 2 ]] || fail "--docs-target requires a directory"
      DOCS_TARGET="$2"
      INSTALL_DOCS=1
      shift 2
      ;;
    --mode)
      [[ $# -ge 2 ]] || fail "--mode requires copy or symlink"
      MODE="$2"
      shift 2
      ;;
    --no-docs)
      INSTALL_DOCS=0
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      fail "unknown option: $1"
      ;;
  esac
done

[[ "$MODE" == "copy" || "$MODE" == "symlink" ]] || fail "--mode must be copy or symlink"

log "DevKit installer"
log "Root: $ROOT_DIR"
log "Mode: $MODE"
log "Skills target: $SKILLS_TARGET"
if [[ "$INSTALL_DOCS" == "1" ]]; then
  log "Docs target: $DOCS_TARGET"
else
  log "Docs target: skipped"
fi

for skill_dir in "$ROOT_DIR"/skills/*; do
  [[ -d "$skill_dir" ]] || continue
  install_path "$skill_dir" "$SKILLS_TARGET/$(basename "$skill_dir")"
done

if [[ "$INSTALL_DOCS" == "1" ]]; then
  install_path "$ROOT_DIR/README.md" "$DOCS_TARGET/README.md"
  install_path "$ROOT_DIR/AGENTS.md" "$DOCS_TARGET/AGENTS.md"
  install_path "$ROOT_DIR/CONTRIBUTING.md" "$DOCS_TARGET/CONTRIBUTING.md"
  install_path "$ROOT_DIR/SECURITY.md" "$DOCS_TARGET/SECURITY.md"
  install_path "$ROOT_DIR/CHANGELOG.md" "$DOCS_TARGET/CHANGELOG.md"
  install_path "$ROOT_DIR/docs" "$DOCS_TARGET/docs"
  install_path "$ROOT_DIR/templates" "$DOCS_TARGET/templates"
  install_path "$ROOT_DIR/examples" "$DOCS_TARGET/examples"
  install_path "$ROOT_DIR/specs" "$DOCS_TARGET/specs"
  install_path "$ROOT_DIR/reports" "$DOCS_TARGET/reports"
fi

log "Done."
