#!/usr/bin/env bash
# One-time setup for m2c (matt-kempster/m2c) on FE8J: clone upstream into
# tools/m2c and create a uv venv with its deps. Both the clone and the venv are
# gitignored (like tools/agbcc and tools/decomp-permuter); the FE8J wrapper
# scripts under scripts/tools/m2c/ are tracked. Re-run to update m2c.
#
# m2c ("machine code to C") turns GNU `as` assembly into matching-oriented C.
# It supports the GBA ARM/Thumb target we need (see docs/tools/m2c.md). We use
# it to generate "seed C" for region-different functions, then refine the seed
# with the AI / decomp-permuter loop against `make compare`.
#
# Idempotent: skips the clone if it already exists, skips venv creation if the
# venv python is already present.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
VENV="${M2C_VENV:-$HOME/m2c-venv}"
REPO="$ROOT/tools/m2c"
cd "$ROOT"

# 1. Clone (or update) the upstream m2c repo into the gitignored tools/m2c.
if [ ! -d "$REPO/.git" ]; then
  echo "Cloning upstream m2c -> tools/m2c ..."
  git clone --depth 1 https://github.com/matt-kempster/m2c "$REPO"
else
  echo "Updating tools/m2c ..."
  git -C "$REPO" pull --ff-only || true
fi

# 2. Create the venv and install deps.
#    m2c is mostly pure Python: pycparser is *vendored* as m2c_pycparser, so the
#    only third-party runtime dep is graphviz (used only by --visualize). We
#    install it so every m2c feature works. Deps are declared in
#    tools/m2c/pyproject.toml ([project].dependencies).
if [ ! -x "$VENV/bin/python" ]; then
  echo "Creating venv $VENV ..."
  if command -v uv >/dev/null 2>&1; then
    uv venv --python "$(command -v python3)" "$VENV"
    uv pip install --python "$VENV/bin/python" "graphviz~=0.20.1"
  else
    python3 -m venv "$VENV"
    "$VENV/bin/python" -m pip install -U pip "graphviz~=0.20.1"
  fi
else
  echo "Reusing existing venv $VENV"
fi

# 3. Smoke check: decompile one of m2c's own bundled agbcc/Thumb tests so a
#    fresh setup proves the GBA target works end to end.
SMOKE="$REPO/tests/end_to_end/store-casts/agbcc-o2.s"
if [ -f "$SMOKE" ]; then
  echo "Smoke test (m2c --target gba on a bundled agbcc/Thumb function):"
  "$VENV/bin/python" "$REPO/m2c.py" --target gba "$SMOKE" || true
fi

cat <<EOF

Done. m2c is set up.

Usage:
  scripts/tools/m2c/m2c.sh --context <ctx.c> -f <FuncName> <region.s>

Typical FE8J workflow (region-different function -> seed C):
  arm-none-eabi-objdump -d fireemblem8.elf \\
    --start-address=0xADDR --stop-address=0xEND > /tmp/fn.s
  scripts/tools/m2c/m2c.sh /tmp/fn.s > /tmp/fn_seed.c
Then refine the seed with the AI / decomp-permuter loop (oracle: make compare).
See docs/tools/m2c.md for the full workflow and examples.
EOF
