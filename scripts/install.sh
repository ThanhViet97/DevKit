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
INCLUDE_DEV=0

usage() {
  cat <<'USAGE'
Usage: scripts/install.sh [options]

Install DevKit skills and docs into local agent directories.

Options:
  --skills-target DIR   Directory where skill folders are installed
                        Default: ${CODEX_HOME:-$HOME/.codex}/skills
  --docs-target DIR     Directory where DevKit docs/templates/examples are installed
                        Default: ${CODEX_HOME:-$HOME/.codex}/devkit
  --mode MODE           copy or symlink. Default: copy
  --no-docs             Install skills only
  --include-dev         Include development specs, plans, and reports in docs install
  --dry-run             Print operations without changing files
  --force               Replace existing DevKit-installed paths
  -h, --help            Show this help

Examples:
  scripts/install.sh --dry-run
  scripts/install.sh
  scripts/install.sh --mode symlink
  scripts/install.sh --include-dev
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

preflight_path() {
  local dest="$1"

  if [[ "$FORCE" == "1" ]]; then
    return 0
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    fail "$dest already exists. Re-run with --force to replace it."
  fi
}

collect_install_paths() {
  INSTALL_SOURCES=()
  INSTALL_DESTS=()

  for skill_dir in "$ROOT_DIR"/skills/*; do
    [[ -d "$skill_dir" ]] || continue
    INSTALL_SOURCES+=("$skill_dir")
    INSTALL_DESTS+=("$SKILLS_TARGET/$(basename "$skill_dir")")
  done

  if [[ "$INSTALL_DOCS" == "1" ]]; then
    INSTALL_SOURCES+=("$ROOT_DIR/README.md")
    INSTALL_DESTS+=("$DOCS_TARGET/README.md")
    INSTALL_SOURCES+=("$ROOT_DIR/AGENTS.md")
    INSTALL_DESTS+=("$DOCS_TARGET/AGENTS.md")
    INSTALL_SOURCES+=("$ROOT_DIR/CONTRIBUTING.md")
    INSTALL_DESTS+=("$DOCS_TARGET/CONTRIBUTING.md")
    INSTALL_SOURCES+=("$ROOT_DIR/SECURITY.md")
    INSTALL_DESTS+=("$DOCS_TARGET/SECURITY.md")
    INSTALL_SOURCES+=("$ROOT_DIR/CHANGELOG.md")
    INSTALL_DESTS+=("$DOCS_TARGET/CHANGELOG.md")
    INSTALL_SOURCES+=("$ROOT_DIR/docs")
    INSTALL_DESTS+=("$DOCS_TARGET/docs")
    INSTALL_SOURCES+=("$ROOT_DIR/templates")
    INSTALL_DESTS+=("$DOCS_TARGET/templates")
    INSTALL_SOURCES+=("$ROOT_DIR/examples")
    INSTALL_DESTS+=("$DOCS_TARGET/examples")

    if [[ "$INCLUDE_DEV" == "1" ]]; then
      INSTALL_SOURCES+=("$ROOT_DIR/dev")
      INSTALL_DESTS+=("$DOCS_TARGET/dev")
    fi
  fi
}

preflight_install() {
  local index

  for index in "${!INSTALL_DESTS[@]}"; do
    [[ -e "${INSTALL_SOURCES[$index]}" ]] || fail "source path does not exist: ${INSTALL_SOURCES[$index]}"
    preflight_path "${INSTALL_DESTS[$index]}"
  done
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
    --include-dev)
      INCLUDE_DEV=1
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
  if [[ "$INCLUDE_DEV" == "1" ]]; then
    log "Development artifacts: included"
  else
    log "Development artifacts: skipped"
  fi
else
  log "Docs target: skipped"
fi

collect_install_paths
preflight_install

for index in "${!INSTALL_SOURCES[@]}"; do
  install_path "${INSTALL_SOURCES[$index]}" "${INSTALL_DESTS[$index]}"
done

log "Done."
