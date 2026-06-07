#!/usr/bin/env bash
# One-time setup for decomp-permuter on FE8J: clone upstream into tools/ and
# create a venv with its deps. Both are gitignored (like tools/agbcc); the
# FE8J-specific config (permuter_settings.toml, scripts/permuter/) is tracked.
# Re-run to update the permuter.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VENV="${PERMUTER_VENV:-$HOME/permuter-venv}"
cd "$ROOT"

if [ ! -d tools/decomp-permuter/.git ]; then
  echo "Cloning upstream decomp-permuter -> tools/decomp-permuter ..."
  git clone --depth 1 https://github.com/simonlindholm/decomp-permuter tools/decomp-permuter
else
  echo "Updating tools/decomp-permuter ..."
  git -C tools/decomp-permuter pull --ff-only || true
fi

if [ ! -x "$VENV/bin/python" ]; then
  echo "Creating venv $VENV ..."
  if command -v uv >/dev/null 2>&1; then
    uv venv --python "$(command -v python3)" "$VENV"
    uv pip install --python "$VENV/bin/python" toml Levenshtein
  else
    python3 -m venv "$VENV"
    "$VENV/bin/python" -m pip install -U pip toml Levenshtein
  fi
fi
echo "Done. Use scripts/permuter/permute.sh (see docs/reverse-engineering.md)."
