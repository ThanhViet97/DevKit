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

"$INSTALLER" --dry-run --no-docs >/dev/null
pass "installer dry-run"

copy_tmp="$(make_tmp)"
"$INSTALLER" --skills-target "$copy_tmp/skills" --docs-target "$copy_tmp/docs" >/dev/null
assert_file "$copy_tmp/skills/devkit-debug-flow/SKILL.md"
assert_file "$copy_tmp/docs/README.md"
assert_file "$copy_tmp/docs/docs/install.md"
assert_file "$copy_tmp/docs/docs/development-history.md"
[[ ! -e "$copy_tmp/docs/dev" ]] || fail "dev history should not install by default"
pass "copy install"

link_tmp="$(make_tmp)"
"$INSTALLER" --mode symlink --skills-target "$link_tmp/skills" --docs-target "$link_tmp/docs" >/dev/null
assert_link "$link_tmp/skills/devkit-debug-flow"
assert_link "$link_tmp/docs/docs"
pass "symlink install"

include_dev_tmp="$(make_tmp)"
"$INSTALLER" --skills-target "$include_dev_tmp/skills" --docs-target "$include_dev_tmp/docs" --include-dev >/dev/null
assert_dir "$include_dev_tmp/docs/dev"
assert_file "$include_dev_tmp/docs/dev/specs/005-devkit-v0.5/tasks.md"
pass "include-dev install"

conflict_tmp="$(make_tmp)"
mkdir -p "$conflict_tmp/skills/devkit-debug-flow"
set +e
"$INSTALLER" --skills-target "$conflict_tmp/skills" --no-docs >"$VERIFY_TMP_PARENT/conflict.out" 2>"$VERIFY_TMP_PARENT/conflict.err"
conflict_code=$?
set -e
[[ "$conflict_code" -ne 0 ]] || fail "conflict install should fail"
[[ ! -e "$conflict_tmp/skills/devkit-artifact-check" ]] || fail "conflict install left partial files"
pass "conflict preflight"

force_tmp="$(make_tmp)"
mkdir -p "$force_tmp/skills/devkit-debug-flow"
touch "$force_tmp/skills/devkit-debug-flow/OLD"
"$INSTALLER" --force --skills-target "$force_tmp/skills" --no-docs >/dev/null
assert_file "$force_tmp/skills/devkit-debug-flow/SKILL.md"
[[ ! -f "$force_tmp/skills/devkit-debug-flow/OLD" ]] || fail "force install did not replace old path"
pass "force replacement"

invalid_tmp="$(make_tmp)"
set +e
"$INSTALLER" --mode bad --skills-target "$invalid_tmp/skills" --no-docs >"$VERIFY_TMP_PARENT/invalid.out" 2>"$VERIFY_TMP_PARENT/invalid.err"
invalid_code=$?
set -e
[[ "$invalid_code" -ne 0 ]] || fail "invalid mode should fail"
pass "invalid mode"

printf 'DevKit verification passed.\n'
