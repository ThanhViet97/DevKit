#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_ROOT="${CODEX_HOME:-$HOME/.codex}"
CLAUDE_ROOT="${CLAUDE_HOME:-$HOME/.claude}"

SUPPORTED_AGENTS=(codex claude-code cursor gemini-cli opencode cline)
AGENT=""
SELECTED_AGENTS=()
AGENT_TARGET=""
AGENT_TARGET_SET=0
SKILLS_TARGET=""
SKILLS_TARGET_SET=0
DOCS_TARGET=""
DOCS_TARGET_SET=0
MODE="copy"
DRY_RUN=0
FORCE=0
INSTALL_DOCS=1
INCLUDE_DEV=0
NO_TOOL_CHECK=0

usage() {
  cat <<'USAGE'
Usage: scripts/install.sh --agent AGENT [options]

Install DevKit skills, docs, and optional project adapters.

Agents:
  codex, claude-code, cursor, gemini-cli, opencode, cline, all

Options:
  --agent AGENT        Target agent adapter to install
  --agent-target DIR   Project or user root where adapter files are installed
                        Required for cursor, gemini-cli, opencode, cline, and all
  --skills-target DIR   Directory where skill folders are installed
                        Default for codex: ${CODEX_HOME:-$HOME/.codex}/skills
                        Default for claude-code: ${CLAUDE_HOME:-$HOME/.claude}/skills
  --docs-target DIR     Directory where DevKit docs/templates/examples are installed
                        Default: agent target/devkit when --agent-target is set,
                        otherwise the selected user agent directory/devkit
  --mode MODE           copy or symlink. Default: copy
  --no-docs             Install skills only
  --include-dev         Include development specs, plans, and reports in docs install
  --no-tool-check       Skip optional Spec Kit and GitNexus availability warning
  --dry-run             Print operations without changing files
  --force               Replace existing DevKit-installed paths
  -h, --help            Show this help

Examples:
  scripts/install.sh --agent codex --dry-run
  scripts/install.sh --agent codex
  scripts/install.sh --agent claude-code
  scripts/install.sh --agent cursor --agent-target /path/to/project
  scripts/install.sh --agent all --agent-target /path/to/project
  scripts/install.sh --agent codex --skills-target "$HOME/.codex/skills" --docs-target "$HOME/.codex/devkit"
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

warn() {
  printf 'Warning: %s\n' "$*"
}

check_optional_tools() {
  if [[ "$NO_TOOL_CHECK" == "1" || "$DRY_RUN" == "1" ]]; then
    return 0
  fi

  local missing=()
  local mcp_hints=(
    "$HOME/.claude/settings.json"
    "$HOME/.config/mcp.json"
    ".cursor/mcp.json"
    "cline_mcp_settings.json"
    "opencode.json"
  )

  local found_mcp=0
  local f
  for f in "${mcp_hints[@]}"; do
    if [[ -f "$f" ]]; then
      found_mcp=1
      break
    fi
  done

  if [[ "$found_mcp" == "0" ]]; then
    missing+=("Spec Kit" "GitNexus")
  else
    local mcp_file
    for mcp_file in "${mcp_hints[@]}"; do
      [[ -f "$mcp_file" ]] || continue
      if ! grep -qi 'spec.kit\|speckit' "$mcp_file" 2>/dev/null; then
        missing+=("Spec Kit")
      fi
      if ! grep -qi 'gitnexus\|git.nexus' "$mcp_file" 2>/dev/null; then
        missing+=("GitNexus")
      fi
      break
    done
  fi

  if [[ "${#missing[@]}" -gt 0 ]]; then
    warn "Could not detect the following tools in your MCP configuration: ${missing[*]}"
    warn "DevKit skills will use fallback behavior without these tools."
    warn "See docs/prerequisites.md for setup guidance."
  fi
}

is_supported_agent() {
  local candidate="$1"
  local supported

  if [[ "$candidate" == "all" ]]; then
    return 0
  fi

  for supported in "${SUPPORTED_AGENTS[@]}"; do
    if [[ "$supported" == "$candidate" ]]; then
      return 0
    fi
  done

  return 1
}

contains_agent() {
  local expected="$1"
  local selected

  for selected in "${SELECTED_AGENTS[@]}"; do
    if [[ "$selected" == "$expected" ]]; then
      return 0
    fi
  done

  return 1
}

selected_agent_count() {
  printf '%s\n' "${#SELECTED_AGENTS[@]}"
}

expand_agents() {
  local supported

  [[ -n "$AGENT" ]] || fail "--agent is required. Choose one of: codex, claude-code, cursor, gemini-cli, opencode, cline, all."
  is_supported_agent "$AGENT" || fail "unknown agent: $AGENT"

  SELECTED_AGENTS=()
  if [[ "$AGENT" == "all" ]]; then
    for supported in "${SUPPORTED_AGENTS[@]}"; do
      SELECTED_AGENTS+=("$supported")
    done
  else
    SELECTED_AGENTS+=("$AGENT")
  fi
}

require_agent_target_when_needed() {
  if [[ "$AGENT_TARGET_SET" == "1" ]]; then
    return 0
  fi

  if [[ "$AGENT" == "all" ]]; then
    fail "--agent all requires --agent-target"
  fi

  if contains_agent cursor || contains_agent gemini-cli || contains_agent opencode || contains_agent cline; then
    fail "--agent $AGENT requires --agent-target because this adapter writes project files"
  fi
}

set_default_targets() {
  if [[ "$DOCS_TARGET_SET" != "1" && "$INSTALL_DOCS" == "1" ]]; then
    if [[ "$AGENT_TARGET_SET" == "1" ]]; then
      DOCS_TARGET="$AGENT_TARGET/devkit"
    elif contains_agent codex && [[ "$(selected_agent_count)" == "1" ]]; then
      DOCS_TARGET="$CODEX_ROOT/devkit"
    elif contains_agent claude-code && [[ "$(selected_agent_count)" == "1" ]]; then
      DOCS_TARGET="$CLAUDE_ROOT/devkit"
    else
      fail "--docs-target could not be inferred"
    fi
  fi

  if [[ "$SKILLS_TARGET_SET" != "1" ]]; then
    if [[ "$AGENT_TARGET_SET" == "1" ]]; then
      SKILLS_TARGET=""
    elif contains_agent codex && [[ "$(selected_agent_count)" == "1" ]]; then
      SKILLS_TARGET="$CODEX_ROOT/skills"
    elif contains_agent claude-code && [[ "$(selected_agent_count)" == "1" ]]; then
      SKILLS_TARGET="$CLAUDE_ROOT/skills"
    else
      SKILLS_TARGET=""
    fi
  fi
}

add_install_path() {
  local src="$1"
  local dest="$2"
  local index

  for index in "${!INSTALL_DESTS[@]}"; do
    if [[ "${INSTALL_DESTS[$index]}" == "$dest" ]]; then
      if [[ "${INSTALL_SOURCES[$index]}" == "$src" ]]; then
        return 0
      fi
      fail "multiple sources target the same destination: $dest"
    fi
  done

  INSTALL_SOURCES+=("$src")
  INSTALL_DESTS+=("$dest")
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

  if [[ -n "$SKILLS_TARGET" ]]; then
    collect_skill_paths "$SKILLS_TARGET"
  fi

  if [[ "$AGENT_TARGET_SET" == "1" ]]; then
    collect_project_adapter_paths "$AGENT_TARGET"
  elif contains_agent claude-code && [[ "$(selected_agent_count)" == "1" ]]; then
    add_install_path "$ROOT_DIR/adapters/claude-code/CLAUDE.md" "$CLAUDE_ROOT/CLAUDE.md"
  fi

  if [[ "$INSTALL_DOCS" == "1" ]]; then
    collect_docs_paths "$DOCS_TARGET"
  fi
}

collect_skill_paths() {
  local target="$1"
  local skill_dir

  for skill_dir in "$ROOT_DIR"/skills/*; do
    [[ -d "$skill_dir" ]] || continue
    add_install_path "$skill_dir" "$target/$(basename "$skill_dir")"
  done
}

collect_docs_paths() {
  local target="$1"

  add_install_path "$ROOT_DIR/README.md" "$target/README.md"
  add_install_path "$ROOT_DIR/AGENTS.md" "$target/AGENTS.md"
  add_install_path "$ROOT_DIR/CONTRIBUTING.md" "$target/CONTRIBUTING.md"
  add_install_path "$ROOT_DIR/SECURITY.md" "$target/SECURITY.md"
  add_install_path "$ROOT_DIR/CHANGELOG.md" "$target/CHANGELOG.md"
  add_install_path "$ROOT_DIR/docs" "$target/docs"
  add_install_path "$ROOT_DIR/skills" "$target/skills"
  add_install_path "$ROOT_DIR/templates" "$target/templates"
  add_install_path "$ROOT_DIR/examples" "$target/examples"
  add_install_path "$ROOT_DIR/adapters" "$target/adapters"

  if [[ "$INCLUDE_DEV" == "1" ]]; then
    add_install_path "$ROOT_DIR/dev" "$target/dev"
  fi
}

collect_project_adapter_paths() {
  local target="$1"

  if contains_agent codex || contains_agent opencode; then
    add_install_path "$ROOT_DIR/AGENTS.md" "$target/AGENTS.md"
  fi

  if contains_agent claude-code; then
    add_install_path "$ROOT_DIR/adapters/claude-code/CLAUDE.md" "$target/CLAUDE.md"
    collect_skill_paths "$target/.claude/skills"
  fi

  if contains_agent cursor; then
    add_install_path "$ROOT_DIR/adapters/cursor/.cursor/rules/devkit.mdc" "$target/.cursor/rules/devkit.mdc"
  fi

  if contains_agent gemini-cli; then
    add_install_path "$ROOT_DIR/adapters/gemini-cli/GEMINI.md" "$target/GEMINI.md"
  fi

  if contains_agent opencode; then
    add_install_path "$ROOT_DIR/adapters/opencode/opencode.json" "$target/opencode.json"
  fi

  if contains_agent cline; then
    add_install_path "$ROOT_DIR/adapters/cline/.clinerules/devkit.md" "$target/.clinerules/devkit.md"
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
    --agent)
      [[ $# -ge 2 ]] || fail "--agent requires a value"
      AGENT="$2"
      shift 2
      ;;
    --agent-target|--target)
      [[ $# -ge 2 ]] || fail "--agent-target requires a directory"
      AGENT_TARGET="$2"
      AGENT_TARGET_SET=1
      shift 2
      ;;
    --skills-target)
      [[ $# -ge 2 ]] || fail "--skills-target requires a directory"
      SKILLS_TARGET="$2"
      SKILLS_TARGET_SET=1
      shift 2
      ;;
    --docs-target)
      [[ $# -ge 2 ]] || fail "--docs-target requires a directory"
      DOCS_TARGET="$2"
      DOCS_TARGET_SET=1
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
    --no-tool-check)
      NO_TOOL_CHECK=1
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
expand_agents
require_agent_target_when_needed
set_default_targets

log "DevKit installer"
log "Root: $ROOT_DIR"
log "Agent: $AGENT"
log "Mode: $MODE"
if [[ "$AGENT_TARGET_SET" == "1" ]]; then
  log "Agent target: $AGENT_TARGET"
else
  log "Agent target: skipped"
fi
if [[ -n "$SKILLS_TARGET" ]]; then
  log "Skills target: $SKILLS_TARGET"
else
  log "Skills target: skipped"
fi
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

check_optional_tools

log "Done."
