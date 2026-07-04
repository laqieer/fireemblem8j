#!/usr/bin/env bash
#
# Auto-prune finished parallel-carve worktrees.
#
# The parallel workflow (carve-worker + carve-integrator) creates one git worktree
# per task but never removes it, so worktrees + their branches pile up (this repo
# once had 100+). A worktree is "done" once its branch is banked — i.e. fully
# merged into origin/main. This reaper removes exactly those, and only those:
#
#   * fetches origin/main (the oracle of "banked"),
#   * `git worktree prune` for dead metadata (dirs already deleted),
#   * for every LINKED worktree whose HEAD is an ancestor of origin/main AND whose
#     tracked tree is clean -> `git worktree remove` + delete the merged branch.
#
# Worktrees with un-merged commits or uncommitted tracked changes are KEPT and
# reported (never destroyed) — harvest them first (see docs/handoff.md). This makes
# the reaper safe to run unconditionally as the integrator's final step, on a timer,
# or by hand.
#
# Usage:
#   scripts/parallel/reap_worktrees.sh            # DRY-RUN: list what would be reaped
#   scripts/parallel/reap_worktrees.sh --apply    # actually remove merged worktrees
#   scripts/parallel/reap_worktrees.sh --apply --keep-branches   # remove trees, keep refs
#   scripts/parallel/reap_worktrees.sh --no-fetch --apply        # skip network fetch
#
# Exit: 0 always (a kept worktree is a warning, not an error).
set -euo pipefail

APPLY=0; FETCH=1; KEEP_BRANCHES=0
for a in "$@"; do
    case "$a" in
        --apply)         APPLY=1 ;;
        --no-fetch)      FETCH=0 ;;
        --keep-branches) KEEP_BRANCHES=1 ;;
        -h|--help)       sed -n '2,30p' "$0"; exit 0 ;;
        *) echo "reap_worktrees: unknown arg '$a'" >&2; exit 2 ;;
    esac
done

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
MAINTREE="$(git worktree list --porcelain | awk '/^worktree /{print $2; exit}')"
if [ "$ROOT" != "$MAINTREE" ]; then
    echo "reap_worktrees: run from the MAIN worktree ($MAINTREE), not a linked one" >&2
    exit 2
fi

[ "$FETCH" -eq 1 ] && git fetch -q origin main || true
MAIN="$(git rev-parse origin/main)"
git worktree prune -v || true

reaped=0; kept=0
# Parse `git worktree list --porcelain` into "path<TAB>branch" records.
while IFS= read -r line; do
    case "$line" in
        worktree\ *) wt="${line#worktree }" ;;
        branch\ *)   br="${line#branch refs/heads/}" ;;
        detached)    br="(detached)" ;;
        "")  # end of a record
            if [ -n "${wt:-}" ] && [ "$wt" != "$MAINTREE" ]; then
                head="$(git -C "$wt" rev-parse HEAD 2>/dev/null || echo)"
                dirty="$(git -C "$wt" status --porcelain -uno 2>/dev/null | wc -l | tr -d ' ')"
                if [ -n "$head" ] && git merge-base --is-ancestor "$head" "$MAIN" 2>/dev/null && [ "$dirty" = "0" ]; then
                    echo "REAP  $wt  [$br]  (merged into origin/main)"
                    if [ "$APPLY" -eq 1 ]; then
                        git worktree remove --force "$wt"
                        if [ "$KEEP_BRANCHES" -eq 0 ] && [ "$br" != "(detached)" ] && [ "$br" != "main" ]; then
                            git branch -d "$br" >/dev/null 2>&1 || true
                        fi
                    fi
                    reaped=$((reaped + 1))
                else
                    reason="unmerged commits"; [ "$dirty" != "0" ] && reason="$dirty uncommitted change(s)"
                    echo "KEEP  $wt  [$br]  ($reason — harvest before pruning)"
                    kept=$((kept + 1))
                fi
            fi
            wt=""; br="" ;;
    esac
done < <(git worktree list --porcelain; echo)

mode=$([ "$APPLY" -eq 1 ] && echo "removed" || echo "would remove (dry-run; pass --apply)")
echo "reap_worktrees: $mode $reaped merged worktree(s); kept $kept."
