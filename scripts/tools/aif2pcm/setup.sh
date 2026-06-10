#!/usr/bin/env bash
#
# setup.sh — vendor and build aif2pcm for FE8J.
#
# aif2pcm (pret's m4a sound tool) converts a committed AIFF (.aif) PCM sample
# into the raw GBA direct-sound sample blob (`.bin`) the ROM contains: an 0x10
# byte header (loop flag, pitch tune, loop point, length) + signed-8-bit PCM. It
# is the SOURCE-of-truth tool for FE8's 439 direct-sound samples (the 3.12 MB
# `asm/direct_sound_data.s` blob). With the committed `.aif` + this tool the
# whole sample blob is reproduced from source — no `.incbin "baserom.gba"`.
# See docs/tools/aif2pcm.md and docs/sound.md.
#
# Vendoring convention (matches tools/gbagfx, tools/bin2c, tools/m2c):
#   - the built tool lives in the GITIGNORED tools/aif2pcm/ (per-checkout
#     artifact, never committed);
#   - this setup script + docs/tools/aif2pcm.md are TRACKED.
# Idempotent: re-run any time to rebuild.
#
# Source of truth: ../fireemblem8u/tools/aif2pcm (the exact aif2pcm FE8U byte-
# matches its samples with), falling back to pret's pokeemerald upstream. The C
# is identical across pret projects; the JP samples are byte-identical to the US
# aif2pcm output for every shared sample (verified — see docs/sound.md).
#
# Build dep: a C11 compiler + libm. No external headers.
#
# Usage:
#   scripts/tools/aif2pcm/setup.sh
#   tools/aif2pcm/aif2pcm in.aif out.bin     # AIFF -> raw GBA PCM sample
set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
DEST="${REPO_ROOT}/tools/aif2pcm"
# Locate the sibling US decomp. From a git WORKTREE, REPO_ROOT is deep under
# .claude/worktrees/, so ../fireemblem8u does not resolve -- resolve against the
# MAIN worktree's parent (git common-dir's repo) and a few common locations.
MAIN_ROOT="$(git -C "${REPO_ROOT}" rev-parse --path-format=absolute --git-common-dir 2>/dev/null | sed 's:/\.git$::')"
FE8U="${FE8U:-}"
if [ -z "${FE8U}" ]; then
    for cand in "${REPO_ROOT}/../fireemblem8u" "${MAIN_ROOT}/../fireemblem8u" \
                "${HOME}/fireemblem8u" /home/laqieer/fireemblem8u; do
        [ -d "${cand}/tools/aif2pcm" ] && { FE8U="${cand}"; break; }
    done
fi
US_SRC="${FE8U:-/nonexistent}/tools/aif2pcm"
UPSTREAM_REPO="https://github.com/pret/pokeemerald"

echo "==> aif2pcm setup (repo root: ${REPO_ROOT})"

command -v gcc >/dev/null 2>&1 || { echo "ERROR: gcc not found." >&2; exit 1; }

SRC_FILES=( main.c extended.c Makefile LICENSE )
mkdir -p "${DEST}"

stage_from() {
    local src="$1" f
    for f in "${SRC_FILES[@]}"; do
        [ -f "${src}/${f}" ] || { echo "   missing ${src}/${f}" >&2; return 1; }
    done
    for f in "${SRC_FILES[@]}"; do cp -f "${src}/${f}" "${DEST}/${f}"; done
}

if [ -d "${US_SRC}" ] && stage_from "${US_SRC}"; then
    echo "==> staged aif2pcm C source from US decomp: ${US_SRC}"
else
    echo "==> US source unavailable; fetching aif2pcm from upstream pret"
    TMP="$(mktemp -d)"; trap 'rm -rf "${TMP}"' EXIT
    git clone --depth 1 --filter=blob:none --sparse "${UPSTREAM_REPO}" "${TMP}/pe"
    git -C "${TMP}/pe" sparse-checkout set tools/aif2pcm
    stage_from "${TMP}/pe/tools/aif2pcm" \
        || { echo "ERROR: could not stage aif2pcm from upstream." >&2; exit 1; }
    echo "==> staged aif2pcm C source from upstream pret"
fi

echo "==> building aif2pcm (gcc -O2 -lm)"
make -C "${DEST}" clean >/dev/null 2>&1 || true
make -C "${DEST}"

BIN="${DEST}/aif2pcm"
[ -x "${BIN}" ] || { echo "ERROR: expected binary not found at ${BIN}" >&2; exit 1; }

echo "==> aif2pcm ready."
echo "    Binary : ${BIN}"
echo "    Usage  : tools/aif2pcm/aif2pcm sound/direct_sound_samples/foo.aif foo.bin"
echo "    The Makefile drives this via 'sound/%.bin: sound/%.aif'. See docs/sound.md."
