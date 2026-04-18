#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALLER="$ROOT_DIR/scripts/install.sh"
VERIFY_TMP_PARENT="$(mktemp -d /tmp/devkit-verify.XXXXXX)"

cleanup() {
  rm -rf "$VERIFY_TMP_PARENT"
}

trap cleanup EXIT

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

pass() {
  printf 'ok - %s\n' "$*"
}

make_tmp() {
  mktemp -d "$VERIFY_TMP_PARENT/case.XXXXXX"
}

assert_file() {
  [[ -f "$1" ]] || fail "expected file missing: $1"
}

assert_dir() {
  [[ -d "$1" ]] || fail "expected directory missing: $1"
}

assert_link() {
  [[ -L "$1" ]] || fail "expected symlink missing: $1"
}

bash -n "$INSTALLER"
pass "installer syntax"

"$INSTALLER" --help >/dev/null
pass "installer help"

set +e
"$INSTALLER" --dry-run --no-docs >"$VERIFY_TMP_PARENT/missing-agent.out" 2>"$VERIFY_TMP_PARENT/missing-agent.err"
missing_agent_code=$?
set -e
[[ "$missing_agent_code" -ne 0 ]] || fail "missing agent should fail"
pass "missing agent"

"$INSTALLER" --agent codex --dry-run --no-docs >/dev/null
pass "installer dry-run"

copy_tmp="$(make_tmp)"
"$INSTALLER" --agent codex --skills-target "$copy_tmp/skills" --docs-target "$copy_tmp/docs" >/dev/null
assert_file "$copy_tmp/skills/devkit-debug-flow/SKILL.md"
assert_file "$copy_tmp/docs/README.md"
assert_file "$copy_tmp/docs/docs/install.md"
assert_file "$copy_tmp/docs/docs/development-history.md"
assert_file "$copy_tmp/docs/skills/devkit-debug-flow/SKILL.md"
assert_file "$copy_tmp/docs/adapters/README.md"
[[ ! -e "$copy_tmp/docs/dev" ]] || fail "dev history should not install by default"
pass "copy install"

link_tmp="$(make_tmp)"
"$INSTALLER" --agent codex --mode symlink --skills-target "$link_tmp/skills" --docs-target "$link_tmp/docs" >/dev/null
assert_link "$link_tmp/skills/devkit-debug-flow"
assert_link "$link_tmp/docs/docs"
pass "symlink install"

include_dev_tmp="$(make_tmp)"
"$INSTALLER" --agent codex --skills-target "$include_dev_tmp/skills" --docs-target "$include_dev_tmp/docs" --include-dev >/dev/null
assert_dir "$include_dev_tmp/docs/dev"
assert_file "$include_dev_tmp/docs/dev/specs/005-devkit-v0.5/tasks.md"
pass "include-dev install"

claude_tmp="$(make_tmp)"
CLAUDE_HOME="$claude_tmp/home" "$INSTALLER" --agent claude-code --no-docs >/dev/null
assert_file "$claude_tmp/home/CLAUDE.md"
assert_file "$claude_tmp/home/skills/devkit-spec-flow/SKILL.md"
pass "claude-code user install"

project_tmp="$(make_tmp)"
"$INSTALLER" --agent all --agent-target "$project_tmp/project" >/dev/null
assert_file "$project_tmp/project/AGENTS.md"
assert_file "$project_tmp/project/CLAUDE.md"
assert_file "$project_tmp/project/.claude/skills/devkit-spec-flow/SKILL.md"
assert_file "$project_tmp/project/.cursor/rules/devkit.mdc"
assert_file "$project_tmp/project/GEMINI.md"
assert_file "$project_tmp/project/opencode.json"
assert_file "$project_tmp/project/.clinerules/devkit.md"
assert_file "$project_tmp/project/devkit/docs/agents.md"
pass "all project adapters"

conflict_tmp="$(make_tmp)"
mkdir -p "$conflict_tmp/skills/devkit-debug-flow"
set +e
"$INSTALLER" --agent codex --skills-target "$conflict_tmp/skills" --no-docs >"$VERIFY_TMP_PARENT/conflict.out" 2>"$VERIFY_TMP_PARENT/conflict.err"
conflict_code=$?
set -e
[[ "$conflict_code" -ne 0 ]] || fail "conflict install should fail"
[[ ! -e "$conflict_tmp/skills/devkit-artifact-check" ]] || fail "conflict install left partial files"
pass "conflict preflight"

project_conflict_tmp="$(make_tmp)"
mkdir -p "$project_conflict_tmp/project/.cursor/rules"
touch "$project_conflict_tmp/project/.cursor/rules/devkit.mdc"
set +e
"$INSTALLER" --agent all --agent-target "$project_conflict_tmp/project" --no-docs >"$VERIFY_TMP_PARENT/project-conflict.out" 2>"$VERIFY_TMP_PARENT/project-conflict.err"
project_conflict_code=$?
set -e
[[ "$project_conflict_code" -ne 0 ]] || fail "project conflict install should fail"
[[ ! -e "$project_conflict_tmp/project/GEMINI.md" ]] || fail "project conflict install left partial files"
pass "project adapter conflict preflight"

force_tmp="$(make_tmp)"
mkdir -p "$force_tmp/skills/devkit-debug-flow"
touch "$force_tmp/skills/devkit-debug-flow/OLD"
"$INSTALLER" --agent codex --force --skills-target "$force_tmp/skills" --no-docs >/dev/null
assert_file "$force_tmp/skills/devkit-debug-flow/SKILL.md"
[[ ! -f "$force_tmp/skills/devkit-debug-flow/OLD" ]] || fail "force install did not replace old path"
pass "force replacement"

project_force_tmp="$(make_tmp)"
mkdir -p "$project_force_tmp/project/.clinerules"
touch "$project_force_tmp/project/.clinerules/devkit.md"
"$INSTALLER" --agent cline --agent-target "$project_force_tmp/project" --force --no-docs >/dev/null
assert_file "$project_force_tmp/project/.clinerules/devkit.md"
pass "project adapter force replacement"

invalid_tmp="$(make_tmp)"
set +e
"$INSTALLER" --agent codex --mode bad --skills-target "$invalid_tmp/skills" --no-docs >"$VERIFY_TMP_PARENT/invalid.out" 2>"$VERIFY_TMP_PARENT/invalid.err"
invalid_code=$?
set -e
[[ "$invalid_code" -ne 0 ]] || fail "invalid mode should fail"
pass "invalid mode"

set +e
"$INSTALLER" --agent unknown --no-docs >"$VERIFY_TMP_PARENT/invalid-agent.out" 2>"$VERIFY_TMP_PARENT/invalid-agent.err"
invalid_agent_code=$?
set -e
[[ "$invalid_agent_code" -ne 0 ]] || fail "invalid agent should fail"
pass "invalid agent"

set +e
"$INSTALLER" --agent cursor --no-docs >"$VERIFY_TMP_PARENT/missing-target.out" 2>"$VERIFY_TMP_PARENT/missing-target.err"
missing_target_code=$?
set -e
[[ "$missing_target_code" -ne 0 ]] || fail "cursor without agent target should fail"
pass "missing agent target"

printf 'DevKit verification passed.\n'
