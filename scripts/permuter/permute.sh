#!/usr/bin/env bash
# Convenience wrapper around upstream decomp-permuter for FE8J. Run scripts/
# permuter/setup.sh once first. See docs/reverse-engineering.md for the workflow.
#
#   scripts/permuter/permute.sh import <src/foo.c> <func.s>
#       Create nonmatchings/<func>/ from a ported C file + the JP function's
#       descriptive .s (which must start with `glabel <func>`).
#
#   scripts/permuter/permute.sh run <nonmatchings/<func>/> [-j N] [permuter args]
#       Run the permuter in the FOREGROUND; it prints "base score = N" (0 = already
#       byte-matching) then searches for a closer/0-score permutation. `-j N` uses
#       N worker processes (multiprocessing; ~5x faster than the default 1).
#
#   scripts/permuter/permute.sh bg <nonmatchings/<func>/> [-j N] [permuter args]
#       Same, but DETACHED via setsid into its own session+process group, with
#       output to nonmatchings/<func>/permute.log. Use this for LONG runs in a
#       sandbox/agent harness: a foreground command that outlives the harness's
#       wall-clock timeout gets SIGTERM'd (exit 143/144) — which kills the whole
#       multiprocessing pool and looks like "the permuter died". setsid severs the
#       job from that timeout so it keeps searching across turns. Add --stop-on-zero
#       so it exits by itself the moment it finds a byte-exact (score 0) source
#       (written to nonmatchings/<func>/output-0-*). Prints the PID; watch with:
#         tail -f nonmatchings/<func>/permute.log    # \r-separated status line
#         ls nonmatchings/<func>/output-*            # output-<SCORE>-<seq>.c, best kept
#       Stop early with: pkill -f 'permuter.py.*<func>'
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
  bg)
    dir="${1:?usage: $0 bg <nonmatchings/<func>/> [permuter args]}"
    log="${dir%/}/permute.log"
    # setsid -> new session, detached from the caller's (timeout-bounded) process
    # group; </dev/null + redirected output so it survives the parent exiting.
    setsid bash -c 'exec "$@"' _ "$PY" "$PERM/permuter.py" "$@" \
      < /dev/null > "$log" 2>&1 &
    sleep 2
    pid="$(pgrep -nf "permuter.py.*$(basename "${dir%/}")" || true)"
    echo "permuter detached (session pid ${pid:-?}); log: $log"
    echo "  watch:  tail -f $log    |    outputs: ls ${dir%/}/output-*"
    echo "  stop:   pkill -f 'permuter.py.*$(basename "${dir%/}")'"
    ;;
  *) echo "usage: $0 {import <c> <s> | run <dir> [-j N] [args] | bg <dir> [-j N] [args]}" >&2; exit 1 ;;
esac
