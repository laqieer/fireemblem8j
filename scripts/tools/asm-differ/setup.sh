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

# tools/ is gitignored (so untracked) and may not exist on a clean checkout;
# create it up front so the clone/update below works from a fresh repo.
mkdir -p tools

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
echo "Build first (make compare) so fireemblem8.gba/.elf/.map and baserom.gba"
echo "exist, then run from the repo root. The everyday TARGET diff (our build vs"
echo "the original ROM) is the raw-binary file-offset mode, e.g.:"
echo "  $VENV/bin/python tools/asm-differ/diff.py -mw 0x<START> 0x<END>"
echo "  (START/END are file offsets = vma - 0x08000000)"
echo "To just VIEW a symbol's current asm (not a diff): diff.py -o1 <SymbolName>."
echo "See docs/tools/asm-differ.md for the full FE8J invocation and caveats."
