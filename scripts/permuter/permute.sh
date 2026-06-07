#!/usr/bin/env bash
# Convenience wrapper around upstream decomp-permuter for FE8J. Run scripts/
# permuter/setup.sh once first. See docs/reverse-engineering.md for the workflow.
#
#   scripts/permuter/permute.sh import <src/foo.c> <func.s>
#       Create nonmatchings/<func>/ from a ported C file + the JP function's
#       descriptive .s (which must start with `glabel <func>`).
#
#   scripts/permuter/permute.sh run <nonmatchings/<func>/> [-j] [permuter args]
#       Run the permuter; it prints "base score = N" (0 = already byte-matching)
#       then searches for a closer/0-score permutation. -j enables threads.
#
# Both `nonmatchings/` and `tools/decomp-permuter` are gitignored.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VENV="${PERMUTER_VENV:-$HOME/permuter-venv}"
PY="$VENV/bin/python"
PERM="$ROOT/tools/decomp-permuter"
cd "$ROOT"

if [ ! -x "$PY" ] || [ ! -d "$PERM" ]; then
  echo "decomp-permuter not set up. Run: scripts/permuter/setup.sh" >&2
  exit 1
fi

cmd="${1:-}"; shift || true
case "$cmd" in
  import) exec "$PY" "$PERM/import.py" "$@" ;;
  run)    exec "$PY" "$PERM/permuter.py" "$@" ;;
  *) echo "usage: $0 {import <c> <s> | run <dir> [args]}" >&2; exit 1 ;;
esac
