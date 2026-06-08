#!/usr/bin/env bash
#
# Idempotent setup for coddog — the cross-binary function-matcher we use to
# triage FE8J functions against their US siblings (region-same -> carve directly,
# region-different -> hand-decompile).  See docs/tools/coddog.md.
#
#   coddog: https://github.com/ethteck/coddog  (Rust; reads decomp_settings YAML)
#
# What it does (re-running is safe):
#   1. Ensure a Rust toolchain (cargo) exists; install user-level via rustup if not.
#   2. Clone ethteck/coddog (pinned tag) into tools/coddog (gitignored); skip if
#      already cloned.
#   3. cargo build --release the `coddog` CLI crate (coddog-cli).
#   4. Print the resulting binary path and a usage hint.
#
# Usage: scripts/tools/coddog/setup.sh
set -euo pipefail

# --- locate repo root (works from the main tree and from a git worktree) ----
REPO_ROOT="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
CODDOG_DIR="${REPO_ROOT}/tools/coddog"
CODDOG_REPO="https://github.com/ethteck/coddog"
# Pin to the exact upstream tag we verified the GBA patch against (the `from_name`
# needle below matches this revision). Bump deliberately after re-checking the patch.
CODDOG_REF="0.6.3"

echo "==> coddog setup (repo root: ${REPO_ROOT})"

# --- 1. Rust toolchain ------------------------------------------------------
if ! command -v cargo >/dev/null 2>&1; then
    # rustup may already be installed but not on PATH for this shell.
    if [ -f "${HOME}/.cargo/env" ]; then
        # shellcheck disable=SC1091
        . "${HOME}/.cargo/env"
    fi
fi
if ! command -v cargo >/dev/null 2>&1; then
    echo "==> cargo not found; installing Rust user-level via rustup"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # shellcheck disable=SC1091
    . "${HOME}/.cargo/env"
fi
echo "==> using $(cargo --version) ($(rustc --version))"

# --- 2. Clone ---------------------------------------------------------------
# Always clone the pinned tag straight from the verified upstream URL. We do NOT
# seed from a pre-existing /tmp clone: an attacker-controlled or stale path there
# could inject code we'd then build (the directory is world-writable on shared
# hosts), and it would defeat the point of pinning a known-good revision.
mkdir -p "${REPO_ROOT}/tools"
if [ -d "${CODDOG_DIR}/.git" ]; then
    echo "==> tools/coddog already cloned; leaving as-is"
    echo "    (delete tools/coddog and re-run to fetch a fresh pinned clone)"
else
    echo "==> cloning ${CODDOG_REPO}@${CODDOG_REF} -> tools/coddog"
    git clone --depth 1 --branch "${CODDOG_REF}" "${CODDOG_REPO}" "${CODDOG_DIR}"
fi

# --- 3a. Patch: teach the CLI's config-string parser about the extra platforms
# Upstream's `Platform::from_name` (used by the CLI to resolve `platform:` from
# the decomp.yaml) only lists n64/psx/ps2/gc_wii/psp and returns None for "gba",
# so the CLI panics ("Invalid platform: gba") even though GBA/Thumb support fully
# exists in coddog-core (objdiff + unarm V4T; cf. `from_decompme_name` and the
# simple_gba tests). We add the same arms already present in `from_decompme_name`
# (gba + the other non-decompme-only platforms: nds/nds_arm9, n3ds, irix) so the
# yaml `platform:` string resolves. Only "gba" matters for us. Idempotent.
# Reported upstream.
LIB="${CODDOG_DIR}/crates/core/src/lib.rs"
if [ -f "${LIB}" ] && ! grep -q '"gba" => Some(Platform::Gba),' "${LIB}"; then
    echo "==> patching coddog-core: add gba/nds/n3ds/irix to Platform::from_name"
    python3 - "${LIB}" <<'PY'
import sys
p = sys.argv[1]
s = open(p).read()
needle = '''    pub fn from_name(name: &str) -> Option<Self> {
        match name.to_lowercase().as_str() {
            "n64" => Some(Platform::N64),
            "psx" => Some(Platform::Psx),
            "ps2" => Some(Platform::Ps2),
            "gc_wii" => Some(Platform::GcWii),
            "psp" => Some(Platform::Psp),
            //"switch" => Some(Platform::Switch),
            _ => None,
        }
    }'''
repl = '''    pub fn from_name(name: &str) -> Option<Self> {
        match name.to_lowercase().as_str() {
            "n64" => Some(Platform::N64),
            "psx" => Some(Platform::Psx),
            "ps2" => Some(Platform::Ps2),
            "gc_wii" => Some(Platform::GcWii),
            "psp" => Some(Platform::Psp),
            "gba" => Some(Platform::Gba),
            "nds" | "nds_arm9" => Some(Platform::Nds),
            "n3ds" => Some(Platform::N3ds),
            "irix" => Some(Platform::Irix),
            //"switch" => Some(Platform::Switch),
            _ => None,
        }
    }'''
if needle not in s:
    sys.exit("ERROR: from_name pattern not found; upstream changed — review the patch in setup.sh")
open(p, "w").write(s.replace(needle, repl, 1))
PY
fi

# --- 3b. Build the CLI crate ------------------------------------------------
# coddog is a cargo workspace (crates/{core,cli,db,api}); the `coddog` binary
# lives in the coddog-cli crate. Build only that crate so we don't pull in the
# db/api server crates (sqlx/axum) we don't need for local matching.
echo "==> building coddog-cli (release) — this compiles objdiff/rabbitizer, give it a few minutes"
cargo build --release --manifest-path "${CODDOG_DIR}/Cargo.toml" -p coddog-cli

BIN="${CODDOG_DIR}/target/release/coddog"
if [ ! -x "${BIN}" ]; then
    echo "ERROR: expected binary not found at ${BIN}" >&2
    exit 1
fi

# --- 4. Report --------------------------------------------------------------
cat <<EOF

==> coddog ready.
    Binary : ${BIN}
    Version: $("${BIN}" --version 2>/dev/null || echo "(--version unavailable)")

Quick start (cross-version FE8J <-> FE8U triage; build both ELFs first):
    # coddog resolves yaml paths against each yaml's OWN parent dir, and the
    # config paths are repo-root-relative, so copy the configs to the repo root
    # before running (delete the copies when done):
    cd "${REPO_ROOT}"
    cp scripts/tools/coddog/fe8.coddog.yaml  decomp.yaml       # for match/cluster/submatch
    cp scripts/tools/coddog/fe8u.coddog.yaml fe8u.coddog.yaml  # for compare2

    # Whole-binary cross-version compare (THE triage command):
    "${BIN}" compare2 decomp.yaml jp fe8u.coddog.yaml us --sort-by similarity

    # Single-function neighbours in one binary:  "${BIN}" match <SymbolName> -t 0.9
    # Duplicate clusters:                         "${BIN}" cluster -m 10
    # Partial / shared code chunks:               "${BIN}" submatch <SymbolName> 20

See docs/tools/coddog.md for the full workflow.
EOF
