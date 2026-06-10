#!/usr/bin/env bash
#
# setup.sh — vendor and build preproc for FE8J.
#
# This is the US decomp's `preproc` (NOT pret's charmap preproc): a small C++11
# program that expands INCBIN_{S8,U8,S16,U16,S32,U32}("path"[, off[, size]]...)
# directives in a C source into brace-enclosed integer initializer lists, reading
# the referenced binary at build time. It is what lets an extracted asset live in
# TYPED C (src/data/*.c) as `const u8 foo[] = INCBIN_U8("graphics/.../foo.4bpp.lz")`
# instead of a raw `.incbin` in assembly — the mechanism the data-extraction front
# uses to pull rebuilt gbagfx output into the ROM. See docs/tools/preproc.md.
#
# Vendoring convention (matches tools/gbagfx, tools/bin2c, tools/m2c):
#   - the built tool lives in the GITIGNORED tools/preproc/ (per-checkout artifact);
#   - this setup script + docs/tools/preproc.md are TRACKED.
# Idempotent: re-run any time to rebuild.
#
# Source of truth: ../fireemblem8u/tools/preproc (this INCBIN-expander variant is
# FE8-specific; there is no clean pret upstream for it, so the US tree is required).
#
# Usage:
#   scripts/tools/preproc/setup.sh
#   tools/preproc/preproc src/data/foo.c   # -> expanded C on stdout
set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
DEST="${REPO_ROOT}/tools/preproc"
FE8U="${FE8U:-${REPO_ROOT}/../fireemblem8u}"
US_SRC="${FE8U}/tools/preproc"

echo "==> preproc setup (repo root: ${REPO_ROOT})"

command -v g++ >/dev/null 2>&1 || { echo "ERROR: g++ not found." >&2; exit 1; }

SRC_FILES=( preproc.cpp Makefile )
mkdir -p "${DEST}"

stage_from() {
    local src="$1" f
    for f in "${SRC_FILES[@]}"; do
        [ -f "${src}/${f}" ] || { echo "   missing ${src}/${f}" >&2; return 1; }
    done
    for f in "${SRC_FILES[@]}"; do cp -f "${src}/${f}" "${DEST}/${f}"; done
}

if [ -d "${US_SRC}" ] && stage_from "${US_SRC}"; then
    echo "==> staged preproc C++ source from US decomp: ${US_SRC}"
else
    echo "ERROR: ${US_SRC} not found." >&2
    echo "       FE8J's preproc is the US decomp's INCBIN-expander variant; point" >&2
    echo "       FE8U=/path/to/fireemblem8u at this script, or copy tools/preproc there." >&2
    exit 1
fi

echo "==> building preproc"
make -C "${DEST}" clean >/dev/null 2>&1 || true
make -C "${DEST}"

BIN="${DEST}/preproc"
[ -x "${BIN}" ] || { echo "ERROR: expected binary not found at ${BIN}" >&2; exit 1; }

echo "==> smoke test: INCBIN_U8 expands to an initializer list"
TMPD="$(mktemp -d)"
printf '\x01\x02\x03\x04' > "${TMPD}/blob.bin"
printf 'const unsigned char x[] = INCBIN_U8("%s/blob.bin");\n' "${TMPD}" > "${TMPD}/t.c"
OUT="$("${BIN}" "${TMPD}/t.c")"
if printf '%s' "${OUT}" | grep -q '{0x01,0x02,0x03,0x04}'; then
    echo "    OK: INCBIN_U8 expanded to {0x01,0x02,0x03,0x04}."
else
    echo "ERROR: preproc did not expand INCBIN_U8 as expected." >&2
    printf '%s\n' "${OUT}" >&2; rm -rf "${TMPD}"; exit 1
fi
rm -rf "${TMPD}"

cat <<EOF

==> preproc ready.
    Binary : ${BIN}

It expands INCBIN_{S8,U8,S16,U16,S32,U32}("path"[, off[, size]]...) in a .c file.
When the C front is stood up, the agbcc pipeline will pipe src/data/*.c through it
(preproc -> cpp -> iconv -> agbcc), exactly as the US decomp does. See
docs/tools/preproc.md.
EOF
