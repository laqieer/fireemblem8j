#!/bin/sh
# build_jp_agbcc.sh — install the agbcc toolchain with the JP "-mjp-promote" flag.
#
# WHY (D276/D276b/D276c): a subset of FE8-JP functions only byte-match under an agbcc
# whose thumb config (a) PRESERVES sub-word type signedness in PROMOTE_MODE and (b)
# defines PROMOTE_FUNCTION_ARGS (declaration-order incoming-param extension). Both are
# gated behind a new `-mjp-promote` target flag (scripts/agbcc_jp_promote.patch) so ONE
# agbcc serves everything:
#   * DEFAULT (no flag) = byte-identical to stock agbcc -> the ~8078 normal TUs unchanged.
#   * `-mjp-promote`     = the JP promotion behavior -> the per-TU JP functions byte-match.
# The Makefile adds `CC1FLAGS += -mjp-promote` per-TU (like the m4a CC1_OLD override).
#
# The flag patch is applied to the agbcc source BEFORE ./build.sh, so the toolchain is
# built exactly ONCE (no stock build + overwrite). This REPLACES the plain
# "git clone agbcc && ./build.sh && ./install.sh" install step.
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGBCC_URL="https://github.com/pret/agbcc.git"
# PINNED for determinism: the pret/agbcc commit the flag patch + validation were done on.
AGBCC_COMMIT="da598c1d918402c42c0c0d7128ba14567f3175e9"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "[agbcc] cloning pret/agbcc @ $AGBCC_COMMIT ..."
git clone "$AGBCC_URL" "$WORK/agbcc"
git -C "$WORK/agbcc" checkout --quiet "$AGBCC_COMMIT"

echo "[agbcc] applying the -mjp-promote flag patch (scripts/agbcc_jp_promote.patch) ..."
# --check first so a context drift (e.g. an upstream agbcc change) fails LOUD, not silently.
git -C "$WORK/agbcc" apply --check "$ROOT/scripts/agbcc_jp_promote.patch"
git -C "$WORK/agbcc" apply "$ROOT/scripts/agbcc_jp_promote.patch"
echo "[agbcc] flag patch applied cleanly"

echo "[agbcc] building + installing the flag-capable toolchain (one build) ..."
( cd "$WORK/agbcc" && ./build.sh && ./install.sh "$ROOT" )
echo "[agbcc] installed -> tools/agbcc (default = stock; -mjp-promote = JP)"
