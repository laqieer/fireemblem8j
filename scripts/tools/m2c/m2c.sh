#!/usr/bin/env bash
# Thin wrapper around m2c (matt-kempster/m2c) pinned to the GBA ARM/Thumb target
# used by FE8J. Forwards every argument straight to m2c.py, so all upstream
# flags work (e.g. --context, -f <func>, --globals, --stack-structs).
#
# The GBA target ("gba") is ARM with the APCS ABI used on the Game Boy Advance
# (see m2c/arch_arm.py:ArmGbaArch and docs/tools/m2c.md). It handles the .code 16
# / .thumb_func Thumb assembly that agbcc emits.
#
# Setup first:  scripts/tools/m2c/setup.sh
#
# Example:
#   scripts/tools/m2c/m2c.sh --context src/header_ctx.c -f SomeFunc /tmp/fn.s
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
VENV="${M2C_VENV:-$HOME/m2c-venv}"
REPO="$ROOT/tools/m2c"

if [ ! -f "$REPO/m2c.py" ]; then
  echo "m2c not found at $REPO. Run scripts/tools/m2c/setup.sh first." >&2
  exit 1
fi

# Prefer the dedicated venv python; fall back to python3 on PATH.
PY="$VENV/bin/python"
[ -x "$PY" ] || PY="python3"

exec "$PY" "$REPO/m2c.py" --target gba "$@"
