#!/usr/bin/env bash
#
# setup.sh — vendor and build bin2c for FE8J.
#
# bin2c (pret's, originally YamaArashi's) turns a binary blob into a C array
# initializer / `.h`. In the asset pipeline it backs the `%.4bpp.h: %.4bpp` rule
# (used where a tile blob must appear as a C `const` array rather than an incbin).
# It is a tiny, dependency-free C11 program. See docs/tools/bin2c.md.
#
# Vendoring convention (matches tools/gbagfx, tools/m2c, tools/objdiff):
#   - the built tool lives in the GITIGNORED tools/bin2c/ (per-checkout artifact);
#   - this setup script + docs/tools/bin2c.md are TRACKED.
# Idempotent: re-run any time to rebuild.
#
# Source of truth: ../fireemblem8u/tools/bin2c, falling back to pret upstream.
#
# Usage:
#   scripts/tools/bin2c/setup.sh
#   tools/bin2c/bin2c INPUT_FILE VAR_NAME [OPTIONS...] > out.h
set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
DEST="${REPO_ROOT}/tools/bin2c"
FE8U="${FE8U:-${REPO_ROOT}/../fireemblem8u}"
US_SRC="${FE8U}/tools/bin2c"
UPSTREAM_REPO="https://github.com/pret/pokeemerald"

echo "==> bin2c setup (repo root: ${REPO_ROOT})"

command -v gcc >/dev/null 2>&1 || { echo "ERROR: gcc not found." >&2; exit 1; }

SRC_FILES=( bin2c.c Makefile LICENSE )
mkdir -p "${DEST}"

stage_from() {
    local src="$1" f
    for f in "${SRC_FILES[@]}"; do
        [ -f "${src}/${f}" ] || { echo "   missing ${src}/${f}" >&2; return 1; }
    done
    for f in "${SRC_FILES[@]}"; do cp -f "${src}/${f}" "${DEST}/${f}"; done
}

if [ -d "${US_SRC}" ] && stage_from "${US_SRC}"; then
    echo "==> staged bin2c C source from US decomp: ${US_SRC}"
else
    echo "==> US source unavailable; fetching bin2c from upstream pret"
    TMP="$(mktemp -d)"; trap 'rm -rf "${TMP}"' EXIT
    git clone --depth 1 --filter=blob:none --sparse "${UPSTREAM_REPO}" "${TMP}/pe"
    git -C "${TMP}/pe" sparse-checkout set tools/bin2c
    stage_from "${TMP}/pe/tools/bin2c" \
        || { echo "ERROR: could not stage bin2c from upstream." >&2; exit 1; }
    echo "==> staged bin2c C source from upstream pret"
fi

echo "==> building bin2c"
make -C "${DEST}" clean >/dev/null 2>&1 || true
make -C "${DEST}"

BIN="${DEST}/bin2c"
[ -x "${BIN}" ] || { echo "ERROR: expected binary not found at ${BIN}" >&2; exit 1; }

echo "==> smoke test: 4 bytes -> C array"
TMPD="$(mktemp -d)"
printf '\xDE\xAD\xBE\xEF' > "${TMPD}/in.bin"
"${BIN}" "${TMPD}/in.bin" smoke_blob > "${TMPD}/out.h"
# bin2c emits lowercase hex with a 'u' suffix (e.g. 0xdeu); match case-insensitively.
if grep -qi '0xde' "${TMPD}/out.h" && grep -qi '0xef' "${TMPD}/out.h"; then
    echo "    OK: bin2c emitted the expected bytes."
else
    echo "ERROR: bin2c output did not contain the input bytes." >&2
    cat "${TMPD}/out.h" >&2; rm -rf "${TMPD}"; exit 1
fi
rm -rf "${TMPD}"

cat <<EOF

==> bin2c ready.
    Binary : ${BIN}

Usage:
  tools/bin2c/bin2c foo.4bpp foo_4bpp > foo.4bpp.h
The Makefile drives this via the '%.4bpp.h: %.4bpp' rule. See docs/tools/bin2c.md.
EOF
