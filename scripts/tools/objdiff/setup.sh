#!/usr/bin/env bash
#
# setup.sh — install the prebuilt objdiff-cli binary for FE8J.
#
# objdiff (https://github.com/encounter/objdiff) is a local diffing tool for
# decompilation projects. Its CLI produces per-symbol match percentages and a
# whole-project progress report — exactly the granular view that `make compare`
# (an all-or-nothing SHA-1 oracle) does not give us. objdiff supports the
# "ARM (GBA, DS, 3DS)" target, including Thumb, so it works on FE8J (BE8J).
#
# This downloads the latest Linux x86_64 release binary into tools/objdiff/
# (gitignored). It is idempotent: re-running just re-downloads/overwrites.
#
# Usage:
#   scripts/tools/objdiff/setup.sh
#   tools/objdiff/objdiff-cli report generate -o build/objdiff-report.json
#
set -euo pipefail

REPO="encounter/objdiff"
# Release asset name for the prebuilt CLI (Linux x86_64). No archive/extension.
ASSET="objdiff-cli-linux-x86_64"

# This installer only fetches the Linux x86_64 release asset. Guard the host so
# other platforms get a clear message instead of a confusing exec-format error
# at the later `--version` check. (objdiff also ships macOS/Windows/aarch64
# assets; add the mapping here if this repo ever needs them.)
OS="$(uname -s)"
ARCH="$(uname -m)"
if [ "${OS}" != "Linux" ] || { [ "${ARCH}" != "x86_64" ] && [ "${ARCH}" != "amd64" ]; }; then
    echo "!! This script only installs the ${ASSET} asset, but the host is" >&2
    echo "   ${OS}/${ARCH}. Download the matching objdiff-cli asset from" >&2
    echo "   https://github.com/${REPO}/releases/latest and place it at" >&2
    echo "   tools/objdiff/objdiff-cli (chmod +x), or extend ASSET above." >&2
    exit 1
fi

# Resolve repo root (three levels up from scripts/tools/objdiff/).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

DEST_DIR="${ROOT}/tools/objdiff"
DEST_BIN="${DEST_DIR}/objdiff-cli"

mkdir -p "${DEST_DIR}"

echo ">> Installing objdiff-cli into ${DEST_DIR}"

download_with_gh() {
    # gh is authenticated in this environment; prefer it for reliability and
    # rate limits. --pattern matches the exact asset; --clobber overwrites.
    command -v gh >/dev/null 2>&1 || return 1
    echo ">> Trying: gh release download (latest) -R ${REPO} --pattern '${ASSET}'"
    gh release download -R "${REPO}" \
        --pattern "${ASSET}" \
        --output "${DEST_BIN}" \
        --clobber
}

download_with_curl() {
    # Fallback: GitHub's "latest" redirect to the named asset.
    local url="https://github.com/${REPO}/releases/latest/download/${ASSET}"
    echo ">> Falling back to: curl -L ${url}"
    curl --fail --location --show-error --silent --output "${DEST_BIN}" "${url}"
}

if ! download_with_gh; then
    echo ">> gh download failed or unavailable; falling back to curl."
    download_with_curl
fi

if [ ! -s "${DEST_BIN}" ]; then
    echo "!! Download produced no file at ${DEST_BIN}" >&2
    exit 1
fi

chmod +x "${DEST_BIN}"

echo ">> Verifying installation:"
"${DEST_BIN}" --version

cat <<EOF

>> Done. objdiff-cli is installed at:
     ${DEST_BIN}

Usage hints (run from the repo root, where objdiff.json lives):

  # Whole-project per-symbol progress report (JSON with fuzzy_match_percent etc.):
  tools/objdiff/objdiff-cli report generate -f json-pretty -o build/objdiff-report.json

  # Diff a single object (interactive TUI), or one function one-shot:
  tools/objdiff/objdiff-cli diff -1 <target.o> -2 <base.o> [SymbolName]

See docs/tools/objdiff.md for how target objects are produced and the
objdiff.json layout.
EOF
