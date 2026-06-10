#!/usr/bin/env bash
#
# setup.sh — vendor and build mid2agb for FE8J.
#
# mid2agb (pret's m4a song compiler) compiles a Standard MIDI File (.mid) into
# the m4a/sappy song bytecode (`.s`) the ROM contains. Each FE8 song is built
# with EXACT per-song flags (`-E -G<voicegroup> -R<reverb> -P<priority>
# -V<volume>`); the bitstream is sensitive to those flags AND to the MIDI's exact
# event timing/ordering, so reproducing the original ROM song bodies byte-for-byte
# from a re-exported `.mid` is HARD (see docs/sound.md, "mid2agb feasibility").
# This tool is vendored so that work can proceed; the song bodies remain
# named-incbin (snd_song*.s) until a byte-matching `.mid` is reconstructed.
#
# Vendoring convention (matches tools/aif2pcm, tools/gbagfx, tools/m2c):
#   - the built tool lives in the GITIGNORED tools/mid2agb/ (per-checkout
#     artifact, never committed);
#   - this setup script + docs/tools/mid2agb.md are TRACKED.
# Idempotent: re-run any time to rebuild.
#
# Source of truth: ../fireemblem8u/tools/mid2agb, falling back to pret upstream.
#
# Build dep: a C++11 compiler. No external libs.
#
# Usage:
#   scripts/tools/mid2agb/setup.sh
#   tools/mid2agb/mid2agb song.mid song.s -E -G000 -R020 -P010 -V051
set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
DEST="${REPO_ROOT}/tools/mid2agb"
# Locate the sibling US decomp (worktree-aware; see aif2pcm/setup.sh).
MAIN_ROOT="$(git -C "${REPO_ROOT}" rev-parse --path-format=absolute --git-common-dir 2>/dev/null | sed 's:/\.git$::')"
FE8U="${FE8U:-}"
if [ -z "${FE8U}" ]; then
    for cand in "${REPO_ROOT}/../fireemblem8u" "${MAIN_ROOT}/../fireemblem8u" \
                "${HOME}/fireemblem8u" /home/laqieer/fireemblem8u; do
        [ -d "${cand}/tools/mid2agb" ] && { FE8U="${cand}"; break; }
    done
fi
US_SRC="${FE8U:-/nonexistent}/tools/mid2agb"
UPSTREAM_REPO="https://github.com/pret/pokeemerald"

echo "==> mid2agb setup (repo root: ${REPO_ROOT})"

command -v g++ >/dev/null 2>&1 || { echo "ERROR: g++ not found." >&2; exit 1; }

SRC_FILES=( agb.cpp error.cpp main.cpp midi.cpp tables.cpp \
            agb.h error.h main.h midi.h tables.h Makefile LICENSE )
mkdir -p "${DEST}"

stage_from() {
    local src="$1" f
    for f in "${SRC_FILES[@]}"; do
        [ -f "${src}/${f}" ] || { echo "   missing ${src}/${f}" >&2; return 1; }
    done
    for f in "${SRC_FILES[@]}"; do cp -f "${src}/${f}" "${DEST}/${f}"; done
}

if [ -d "${US_SRC}" ] && stage_from "${US_SRC}"; then
    echo "==> staged mid2agb C++ source from US decomp: ${US_SRC}"
else
    echo "==> US source unavailable; fetching mid2agb from upstream pret"
    TMP="$(mktemp -d)"; trap 'rm -rf "${TMP}"' EXIT
    git clone --depth 1 --filter=blob:none --sparse "${UPSTREAM_REPO}" "${TMP}/pe"
    git -C "${TMP}/pe" sparse-checkout set tools/mid2agb
    stage_from "${TMP}/pe/tools/mid2agb" \
        || { echo "ERROR: could not stage mid2agb from upstream." >&2; exit 1; }
    echo "==> staged mid2agb C++ source from upstream pret"
fi

echo "==> building mid2agb (g++ -std=c++11 -O2)"
make -C "${DEST}" clean >/dev/null 2>&1 || true
make -C "${DEST}"

BIN="${DEST}/mid2agb"
[ -x "${BIN}" ] || { echo "ERROR: expected binary not found at ${BIN}" >&2; exit 1; }

echo "==> mid2agb ready."
echo "    Binary : ${BIN}"
echo "    Usage  : tools/mid2agb/mid2agb song.mid song.s -E -G000 -R020 -P010 -V051"
echo "    Reproducing the ROM song bytes byte-for-byte requires a matching .mid;"
echo "    see docs/sound.md for the feasibility assessment."
