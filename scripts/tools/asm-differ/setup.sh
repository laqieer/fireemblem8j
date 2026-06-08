#!/usr/bin/env bash
# One-time setup for asm-differ on FE8J: clone simonlindholm/asm-differ into
# tools/ and create a venv with its deps. Both are gitignored (like tools/agbcc
# and tools/decomp-permuter); the FE8J-specific config (diff_settings.py at the
# repo root, docs/tools/asm-differ.md) is tracked.
#
# asm-differ is the interactive per-function assembly differ used by decomp.me.
# It supports ARM32, which is what FE8J (GBA / ARM7TDMI / agbcc Thumb) needs.
# Re-run to update the differ.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
VENV="${ASM_DIFFER_VENV:-$HOME/asm-differ-venv}"
cd "$ROOT"

if [ ! -d tools/asm-differ/.git ]; then
  echo "Cloning upstream asm-differ -> tools/asm-differ ..."
  git clone --depth 1 https://github.com/simonlindholm/asm-differ tools/asm-differ
else
  echo "Updating tools/asm-differ ..."
  git -C tools/asm-differ pull --ff-only || true
fi

# Dependencies, per asm-differ's README/pyproject (requirements.txt is not
# shipped upstream): colorama watchdog levenshtein cxxfilt. argcomplete is
# optional (tab completion) and intentionally omitted.
DEPS="colorama watchdog levenshtein cxxfilt"

if [ ! -x "$VENV/bin/python" ]; then
  echo "Creating venv $VENV ..."
  if command -v uv >/dev/null 2>&1; then
    uv venv --python "$(command -v python3)" "$VENV"
  else
    python3 -m venv "$VENV"
  fi
fi

echo "Installing deps ($DEPS) ..."
if command -v uv >/dev/null 2>&1; then
  # shellcheck disable=SC2086
  uv pip install --python "$VENV/bin/python" $DEPS
else
  "$VENV/bin/python" -m pip install -U pip
  # shellcheck disable=SC2086
  "$VENV/bin/python" -m pip install $DEPS
fi

echo
echo "Done. asm-differ is at tools/asm-differ; deps in $VENV."
echo "Build the ROM first (make compare) so fireemblem8.elf/.map exist, then run"
echo "from the repo root, e.g.:"
echo "  $VENV/bin/python tools/asm-differ/diff.py -mwo1 <SymbolName>"
echo "See docs/tools/asm-differ.md for the full FE8J invocation and caveats."
