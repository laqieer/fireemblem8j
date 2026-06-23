#!/usr/bin/env bash
#
# Make a fresh git worktree build-ready for a parallel carve agent.
#
# tools/agbcc, baserom.gba, fireemblem8.elf and the built *.o objects are all
# gitignored, so a freshly-created worktree cannot run `make compare`. This
# symlinks the read-only inputs in from the main repo (no copy: they're large and
# read-only during a build) and copies the warm object cache (objects are mutable
# build outputs — copy, never hardlink) so the worktree's first build is the ~0.3s
# incremental relink, not a ~13s clean.
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
# Only symlink genuinely READ-ONLY build INPUTS. Never symlink build OUTPUTS
# (fireemblem8.elf/.gba/.map) — a relink in the worktree would follow the symlink
# and clobber the main repo's output, breaking isolation. The worktree builds its
# own ELF from the (copied) objects below.
mkdir -p tools
ln -sf  "$MAIN/baserom.gba" baserom.gba
# Symlink EVERY toolchain dir under tools/ (all read-only build inputs). Missing any
# of them makes a whole object class build EMPTY and `make compare` silently produce
# a wrong ROM: agbcc (code), preproc/gbagfx/bin2c (data+gfx), aif2pcm/mid2agb (sound),
# gbadisasm (carve diffs), plus triage tools (objdiff/asm-differ/m2c/coddog). A glob
# is future-proof — new tools are picked up automatically.
for d in "$MAIN/tools/"*/; do
    [ -d "$d" ] || continue
    name="$(basename "$d")"
    ln -sfn "$d" "tools/$name"
done

# --- warm object cache: COPY built objects (do NOT hardlink) -----------------
# Objects are MUTABLE build outputs: a carve that changes the layout rebuilds
# asm/baserom.o (and the assembler truncates the output in place), so a hardlink
# would mutate the main repo's object and break its build. Copy them instead
# (independent inodes), then touch so they're newer than the just-checked-out
# sources and `make compare` is the ~0.3s incremental relink, not a clean build.
n=0
for d in src asm; do
    if compgen -G "$MAIN/$d/*.o" >/dev/null; then
        mkdir -p "$d"
        cp "$MAIN/$d/"*.o "$d/" 2>/dev/null || true
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
