#!/usr/bin/env bash
#
# setup.sh — vendor and build gbagfx for FE8J.
#
# gbagfx (pret's GBA graphics tool, originally YamaArashi's) is THE critical
# asset tool: it converts committed PNG/.pal source into the raw GBA tile/palette
# bytes the ROM contains (png->1/4/8bpp, .pal<->gbapal) AND does the GBA LZ77 /
# RL (run-length) (de)compression that FE8 uses for most graphics. The whole
# Phase-1 data-extraction front (replacing `.incbin "baserom.gba"` with
# `INCBIN_U8` of a REBUILT asset) depends on it. See docs/tools/gbagfx.md.
#
# Vendoring convention (matches tools/m2c, tools/coddog, tools/objdiff):
#   - the built tool lives in the GITIGNORED tools/gbagfx/ (a per-checkout
#     artifact, never committed);
#   - this setup script + docs/tools/gbagfx.md are TRACKED.
# Re-run any time to rebuild; it is idempotent.
#
# Source of truth: the sibling US decomp at ../fireemblem8u/tools/gbagfx (the
# exact gbagfx FE8U byte-matches its LZ assets with — same -mindist semantics),
# falling back to pret's upstream `agbcc`-adjacent `pokeemerald` tool if the US
# tree is absent. The C is identical across pret projects; we prefer the US copy
# so the LZ compressor matches what FE8U proved against the GBA Fire Emblem ROMs.
#
# Build dep: libpng + zlib dev headers (gbagfx links -lpng -lz). On Debian/Ubuntu:
#   sudo apt-get install libpng-dev zlib1g-dev pkg-config
#
# Usage:
#   scripts/tools/gbagfx/setup.sh
#   tools/gbagfx/gbagfx in.png out.4bpp           # encode
#   tools/gbagfx/gbagfx in.4bpp out.lz -mindist N # LZ77-compress (N=1/2/3)
set -euo pipefail

# --- locate repo root (works from the main tree and from a git worktree) ----
REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
DEST="${REPO_ROOT}/tools/gbagfx"
# US decomp source (primary). Override with FE8U=/path if it lives elsewhere.
FE8U="${FE8U:-${REPO_ROOT}/../fireemblem8u}"
US_SRC="${FE8U}/tools/gbagfx"
# Upstream fallback (pret). gbagfx ships inside the larger gba decomp repos; we
# clone pokeemerald shallowly and lift just tools/gbagfx if the US tree is gone.
UPSTREAM_REPO="https://github.com/pret/pokeemerald"

echo "==> gbagfx setup (repo root: ${REPO_ROOT})"

# --- 0. host build deps -----------------------------------------------------
command -v gcc >/dev/null 2>&1 || { echo "ERROR: gcc not found." >&2; exit 1; }
if ! pkg-config --exists libpng 2>/dev/null; then
    echo "ERROR: libpng dev headers not found (pkg-config can't see libpng)." >&2
    echo "       Install them, e.g.: sudo apt-get install libpng-dev zlib1g-dev pkg-config" >&2
    exit 1
fi

# --- 1. stage the source into tools/gbagfx ----------------------------------
# These are the C sources + headers gbagfx needs (the Makefile's SRCS plus the
# headers and license). Kept explicit so we copy exactly the tool, nothing else.
SRC_FILES=(
    main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c
    convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
    Makefile LICENSE
)

mkdir -p "${DEST}"

stage_from() {
    # $1 = source dir containing the gbagfx C files
    local src="$1"
    local f
    for f in "${SRC_FILES[@]}"; do
        [ -f "${src}/${f}" ] || { echo "   missing ${src}/${f}" >&2; return 1; }
    done
    for f in "${SRC_FILES[@]}"; do
        cp -f "${src}/${f}" "${DEST}/${f}"
    done
    return 0
}

if [ -d "${US_SRC}" ] && stage_from "${US_SRC}"; then
    echo "==> staged gbagfx C source from US decomp: ${US_SRC}"
else
    echo "==> US source unavailable; fetching gbagfx from upstream pret (${UPSTREAM_REPO})"
    TMP="$(mktemp -d)"
    trap 'rm -rf "${TMP}"' EXIT
    git clone --depth 1 --filter=blob:none --sparse "${UPSTREAM_REPO}" "${TMP}/pokeemerald"
    git -C "${TMP}/pokeemerald" sparse-checkout set tools/gbagfx
    stage_from "${TMP}/pokeemerald/tools/gbagfx" \
        || { echo "ERROR: could not stage gbagfx from upstream either." >&2; exit 1; }
    echo "==> staged gbagfx C source from upstream pret"
fi

# --- 2. build ---------------------------------------------------------------
echo "==> building gbagfx (gcc -O2, -lpng -lz)"
make -C "${DEST}" clean >/dev/null 2>&1 || true
make -C "${DEST}"

BIN="${DEST}/gbagfx"
[ -x "${BIN}" ] || { echo "ERROR: expected binary not found at ${BIN}" >&2; exit 1; }

# --- 3. smoke test: LZ round-trips byte-identically -------------------------
# Compress a tiny payload and decompress it; the decompressed bytes must equal
# the original. This proves the LZ77 path (the part Phase 1 leans on) works.
echo "==> smoke test: LZ compress/decompress round-trip"
TMPD="$(mktemp -d)"
# 64 bytes with repeats so the compressor actually emits back-references.
python3 - "${TMPD}/in.bin" <<'PY'
import sys
open(sys.argv[1], "wb").write((bytes(range(16)) * 2 + b"\xAA" * 32))
PY
"${BIN}" "${TMPD}/in.bin" "${TMPD}/out.lz" -mindist 2
"${BIN}" "${TMPD}/out.lz" "${TMPD}/rt.bin"
if cmp -s "${TMPD}/in.bin" "${TMPD}/rt.bin"; then
    echo "    OK: LZ round-trip byte-identical."
else
    echo "ERROR: LZ round-trip mismatch — gbagfx build is broken." >&2
    rm -rf "${TMPD}"
    exit 1
fi
rm -rf "${TMPD}"

cat <<EOF

==> gbagfx ready.
    Binary : ${BIN}

Common conversions (run from the repo root):
  # Encode committed PNG -> raw GBA tiles (bit depth from the OUTPUT extension):
  tools/gbagfx/gbagfx graphics/foo.png graphics/foo.4bpp
  # Palette: JASC .pal -> gbapal (and back):
  tools/gbagfx/gbagfx graphics/foo.pal    graphics/foo.gbapal
  tools/gbagfx/gbagfx graphics/foo.gbapal graphics/foo.pal
  # LZ77 compress (tune -mindist 1/2/3 to byte-match the original ROM blob):
  tools/gbagfx/gbagfx graphics/foo.4bpp graphics/foo.4bpp.lz -mindist 2
  # ...and decompress a ROM blob back to raw bytes (extraction):
  tools/gbagfx/gbagfx blob.lz blob.bin

The Makefile's generic rules (%.4bpp: %.png, %.gbapal: %.pal, %.lz: %, %.rl: %)
drive these automatically; per-asset LZ_FLAGS pin the -mindist. See
docs/tools/gbagfx.md for the extraction recipe and the pilot example.
EOF
