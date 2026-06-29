#!/usr/bin/env bash
#
# setup.sh — vendor and build scaninc for FE8J.
#
# scaninc (pret's GBA-decomp include-dependency scanner) reads a .s/.c source and
# prints the .include/#include files it pulls in, so Make can add them as extra
# prerequisites of the object. The battle-animation pipeline (BA1) uses it for the
# `banim/%.o` rule: editing include/banim_code.inc (or banim_sheet.inc /
# banim_code_frame.inc) must rebuild every banim/*_motion.o that .includes it.
#
# Vendoring convention (matches tools/gbagfx, tools/bin2c, tools/preproc):
#   - the built tool lives in the GITIGNORED tools/scaninc/ (a per-checkout
#     artifact, never committed);
#   - this setup script + docs/tools/scaninc.md are TRACKED.
# Re-run any time to rebuild; it is idempotent.
#
# Source of truth: pret's scaninc C++ source (identical across pret projects).
# We prefer the sibling US decomp's prebuilt binary at ../fireemblem8u/tools/scaninc
# (the exact scaninc FE8U uses) when present, and fall back to building from
# pret/pokeemerald upstream.
#
# Build dep: a C++ compiler (g++). No external libs.
#
# Usage:
#   scripts/tools/scaninc/setup.sh
#   tools/scaninc/scaninc -I include -I "" banim/banim_lorm_sp1_motion.s

set -euo pipefail

# --- locate repo root (works from the main tree and from a git worktree) ----
REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
DEST="${REPO_ROOT}/tools/scaninc"
# US decomp (primary). Override with FE8U=/path if it lives elsewhere.
FE8U="${FE8U:-${REPO_ROOT}/../fireemblem8u}"
US_BIN="${FE8U}/tools/scaninc/scaninc"
# Upstream source fallback (pret). scaninc ships inside the larger gba decomp
# repos; we clone pokeemerald shallowly and lift just tools/scaninc.
UPSTREAM_REPO="https://github.com/pret/pokeemerald"

echo "==> scaninc setup (repo root: ${REPO_ROOT})"
mkdir -p "${DEST}"

BIN="${DEST}/scaninc"

build_from_source() {
    # $1 = source dir containing the scaninc C++ files (with a Makefile)
    local src="$1"
    [ -f "${src}/Makefile" ] || return 1
    ls "${src}"/*.cpp >/dev/null 2>&1 || return 1
    echo "==> building scaninc from source: ${src}"
    cp -rf "${src}/." "${DEST}/"
    make -C "${DEST}" clean >/dev/null 2>&1 || true
    make -C "${DEST}"
    [ -x "${BIN}" ]
}

# --- 1. try to build from US source, else copy US prebuilt binary, else pret -
if build_from_source "${FE8U}/tools/scaninc" 2>/dev/null; then
    echo "==> built scaninc from US decomp source"
elif [ -x "${US_BIN}" ]; then
    echo "==> US scaninc source unavailable; copying US prebuilt binary: ${US_BIN}"
    cp -f "${US_BIN}" "${BIN}"
    chmod +x "${BIN}"
else
    echo "==> US tree unavailable; building scaninc from upstream pret (${UPSTREAM_REPO})"
    TMP="$(mktemp -d)"
    trap 'rm -rf "${TMP}"' EXIT
    git clone --depth 1 --filter=blob:none --sparse "${UPSTREAM_REPO}" "${TMP}/pokeemerald"
    git -C "${TMP}/pokeemerald" sparse-checkout set tools/scaninc
    build_from_source "${TMP}/pokeemerald/tools/scaninc" \
        || { echo "ERROR: could not build scaninc from upstream either." >&2; exit 1; }
    echo "==> built scaninc from upstream pret"
fi

[ -x "${BIN}" ] || { echo "ERROR: expected binary not found at ${BIN}" >&2; exit 1; }

# --- 2. smoke test: scan a banim motion .s for its include deps -------------
echo "==> smoke test: include-dependency scan"
TEST_S="${REPO_ROOT}/banim/banim_lorm_sp1_motion.s"
if [ -f "${TEST_S}" ]; then
    DEPS="$("${BIN}" -I include -I "" "${TEST_S}" 2>/dev/null || true)"
    if echo "${DEPS}" | grep -q "banim_sheet.inc"; then
        echo "    OK: scaninc resolved banim include deps."
    else
        echo "ERROR: scaninc did not resolve the expected banim includes." >&2
        echo "       output was: ${DEPS}" >&2
        exit 1
    fi
else
    echo "    (banim motion .s not present; skipped functional smoke test)"
fi

cat <<EOF

==> scaninc ready.
    Binary : ${BIN}

The Makefile's banim/%.o rule uses it to track include/banim_*.inc edits:
  tools/scaninc/scaninc -I include -I "" banim/<name>_motion.s
See docs/tools/scaninc.md.
EOF
