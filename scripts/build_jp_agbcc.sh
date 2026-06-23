#!/bin/sh
# build_jp_agbcc.sh — build the agbcc thumb compiler with the JP "-mjp-promote" FLAG.
#
# WHY (D276/D276b/D276c): a subset of FE8-JP functions only byte-match under an agbcc
# whose thumb config (a) PRESERVES sub-word type signedness in PROMOTE_MODE (s8/s16 ->
# sign-extend) and (b) defines PROMOTE_FUNCTION_ARGS (callee extends incoming sub-word
# params at entry in DECLARATION order). Rather than ship a SECOND binary, both behaviors
# are gated behind a new `-mjp-promote` target flag so ONE agbcc serves everything:
#   * DEFAULT (no flag) = byte-identical to stock agbcc -> the ~8077 normal TUs are unchanged.
#   * `-mjp-promote`     = the JP promotion behavior -> the per-TU JP functions byte-match.
# The Makefile adds `CC1FLAGS += -mjp-promote` per-TU (like the m4a CC1_OLD override).
#
# This OVERWRITES the thumb compiler tools/agbcc/bin/agbcc (built earlier by the normal
# pret/agbcc ./build.sh) with the flag-capable build. old_agbcc / agbcc_arm / libc /
# libgcc from the normal install are kept (the flag defaults off, so they are unaffected).
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGBCC_URL="https://github.com/pret/agbcc.git"
# PINNED for determinism: the pret/agbcc commit the flag patch + validation were done on.
AGBCC_COMMIT="da598c1d918402c42c0c0d7128ba14567f3175e9"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "[jp_agbcc] cloning pret/agbcc @ $AGBCC_COMMIT ..."
git clone "$AGBCC_URL" "$WORK/agbcc"
git -C "$WORK/agbcc" checkout --quiet "$AGBCC_COMMIT"

echo "[jp_agbcc] applying the -mjp-promote flag patch (scripts/agbcc_jp_promote.patch) ..."
# Unified diff against pret/agbcc gcc/{thumb.h,calls.c,function.c,combine.c}: declares the
# ARM_FLAG_JP_PROMOTE flag, runtime-gates the PROMOTE_MODE force-line, and always-defines
# PROMOTE_FUNCTION_ARGS with its 3 promotion actions each gated on TARGET_JP_PROMOTE.
# --check first so a context drift (e.g. an upstream agbcc change) fails LOUD, not silently.
git -C "$WORK/agbcc" apply --check "$ROOT/scripts/agbcc_jp_promote.patch"
git -C "$WORK/agbcc" apply "$ROOT/scripts/agbcc_jp_promote.patch"
echo "[jp_agbcc] flag patch applied cleanly"

echo "[jp_agbcc] building the flag-capable thumb agbcc (serial) ..."
make -C "$WORK/agbcc/gcc" -j1

mkdir -p "$ROOT/tools/agbcc/bin"
cp "$WORK/agbcc/gcc/agbcc" "$ROOT/tools/agbcc/bin/agbcc"
echo "[jp_agbcc] installed flag-capable agbcc -> tools/agbcc/bin/agbcc (default = stock; -mjp-promote = JP)"
