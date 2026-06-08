#!/usr/bin/env bash
#
# Make a fresh git worktree build-ready for a parallel carve agent.
#
# tools/agbcc, baserom.gba, fireemblem8.elf and the built *.o objects are all
# gitignored, so a freshly-created worktree cannot run `make compare`. This
# symlinks the read-only inputs in from the main repo (no copy: they're large and
# read-only during a build) and hardlink-copies the warm object cache so the
# worktree's first build is the ~0.3s incremental relink, not a ~13s clean.
#
# Usage:  scripts/parallel/worktree_setup.sh <main-repo-root>
# Intended to be wired to the Claude Code `WorktreeCreate` hook so every agent
# worktree is build-ready automatically.
set -euo pipefail

MAIN="${1:?usage: worktree_setup.sh <main-repo-root>}"
MAIN="$(cd "$MAIN" && pwd)"
HERE="$(git rev-parse --show-toplevel)"

if [ "$MAIN" = "$HERE" ]; then
    echo "worktree_setup: refusing to set up the main tree onto itself ($HERE)" >&2
    exit 1
fi
if [ ! -x "$MAIN/tools/agbcc/bin/agbcc" ] || [ ! -f "$MAIN/baserom.gba" ]; then
    echo "worktree_setup: $MAIN is missing tools/agbcc or baserom.gba" >&2
    exit 1
fi

cd "$HERE"

# --- read-only inputs: symlink ---------------------------------------------
mkdir -p tools
ln -sfn "$MAIN/tools/agbcc" tools/agbcc
ln -sf  "$MAIN/baserom.gba" baserom.gba
[ -f "$MAIN/fireemblem8.elf" ] && ln -sf "$MAIN/fireemblem8.elf" fireemblem8.elf || true
# objdiff/asm-differ/m2c/coddog (per-symbol pre-gate + triage) if the agent uses them
for t in objdiff asm-differ m2c coddog; do
    [ -e "$MAIN/tools/$t" ] && ln -sfn "$MAIN/tools/$t" "tools/$t" || true
done

# --- warm object cache: hardlink built objects, then touch so make skips them --
# Hardlinks share inodes (near-zero disk). We touch the cached .o AFTER the
# checkout so they are newer than the just-checked-out sources and make relinks
# rather than recompiling everything. (A .o make does rewrite simply breaks its
# hardlink — harmless.)
n=0
for d in src asm; do
    if compgen -G "$MAIN/$d/*.o" >/dev/null; then
        mkdir -p "$d"
        cp -al "$MAIN/$d/"*.o "$d/" 2>/dev/null || cp -l "$MAIN/$d/"*.o "$d/" 2>/dev/null || true
        n=$((n + $(ls "$MAIN/$d/"*.o 2>/dev/null | wc -l)))
    fi
done
# generated glue (gitignored) — copy so the first build doesn't even regenerate it
for f in ldscript.txt asm/baserom.s asm/jp_syms.s; do
    [ -f "$MAIN/$f" ] && { mkdir -p "$(dirname "$f")"; cp "$MAIN/$f" "$f"; } || true
done
# make every cached artifact newer than the sources so `make compare` is incremental
find src asm -name '*.o' -o -name '*.s' 2>/dev/null | xargs -r touch
[ -f ldscript.txt ] && touch ldscript.txt || true

echo "worktree_setup: $HERE ready (toolchain symlinked from $MAIN, $n warm objects)."
echo "  verify with: make compare"
