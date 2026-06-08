#!/usr/bin/env bash
#
# setup.sh — vendor + build macabeus/mizuchi for the FE8J decomp.
#
# Mizuchi (https://github.com/macabeus/mizuchi) is a TS/Rust matching-decomp
# pipeline orchestrator: generate C with Claude -> compile with the project's
# toolchain (agbcc for us) -> diff with objdiff-wasm, plus a "Decomp Atlas" UI
# for browsing functions and building prompts. This script clones it into the
# (gitignored) tools/mizuchi/, installs deps, builds the CLI + UIs, and runs
# mizuchi's optional m2c / decomp-permuter setup scripts when present.
#
# Idempotent: re-running skips the clone if tools/mizuchi already exists and
# just re-installs + rebuilds.
#
# Requirements:
#   - node >= 22 and npm (node v26 / npm 11 verified). NO yarn.
#   - python3 (for mizuchi's m2c / decomp-permuter venvs and embeddings).
#   - ANTHROPIC_API_KEY in the environment for the actual `run` pipeline
#     (NOT needed for setup, indexing, or the Atlas UI). Do NOT hardcode it.
#
# Usage:
#   bash scripts/tools/mizuchi/setup.sh
#
set -euo pipefail

# --- locate the FE8J project root (this script lives at scripts/tools/mizuchi/) ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
MIZUCHI_DIR="$PROJECT_ROOT/tools/mizuchi"
MIZUCHI_REPO="https://github.com/macabeus/mizuchi.git"

echo "==> FE8J project root: $PROJECT_ROOT"
echo "==> Mizuchi vendor dir: $MIZUCHI_DIR"

# --- preflight: node + npm ---
if ! command -v node >/dev/null 2>&1; then
  echo "ERROR: node not found. Need node >= 22 (v26 verified)." >&2
  exit 1
fi
if ! command -v npm >/dev/null 2>&1; then
  echo "ERROR: npm not found. (This project uses npm, NOT yarn.)" >&2
  exit 1
fi
echo "==> node $(node --version), npm $(npm --version)"

# --- clone (idempotent) ---
# NOTE: mizuchi's .gitmodules pins SSH URLs (git@github.com:...) for vendor/m2c
# and vendor/decomp-permuter. Those fail in keyless/CI environments, so we clone
# the main repo WITHOUT recursing, then rewrite the submodule URLs to HTTPS and
# fetch them best-effort. The m2c / decomp-permuter submodules are OPTIONAL
# (only the m2c and decomp-permuter programmatic phases need them); the CLI,
# Atlas, indexer, Claude Runner, and objdiff all build and run without them.
if [ -d "$MIZUCHI_DIR/.git" ]; then
  echo "==> tools/mizuchi already cloned; skipping clone."
else
  echo "==> Cloning macabeus/mizuchi (main repo, submodules fetched separately)..."
  mkdir -p "$(dirname "$MIZUCHI_DIR")"
  git clone "$MIZUCHI_REPO" "$MIZUCHI_DIR"
fi

# Rewrite SSH submodule URLs -> HTTPS so keyless fetch works, then sync.
echo "==> Fetching optional submodules (m2c, decomp-permuter) over HTTPS..."
if [ -f "$MIZUCHI_DIR/.gitmodules" ]; then
  # `--get-regexp` exits non-zero when nothing matches (e.g. upstream already on
  # HTTPS). Capture it tolerantly so `set -euo pipefail` doesn't abort the whole
  # setup before npm install.
  submodule_urls="$(git -C "$MIZUCHI_DIR" config --file .gitmodules \
    --get-regexp '^submodule\..*\.url$' 2>/dev/null || true)"
  while read -r key url; do
    [ -n "$key" ] || continue
    https_url="${url/git@github.com:/https://github.com/}"
    if [ "$https_url" != "$url" ]; then
      git -C "$MIZUCHI_DIR" config --file .gitmodules "$key" "$https_url"
    fi
  done <<< "$submodule_urls"
  git -C "$MIZUCHI_DIR" submodule sync --recursive >/dev/null 2>&1 || true
  git -C "$MIZUCHI_DIR" submodule update --init --recursive || \
    echo "WARN: submodule fetch failed (m2c/decomp-permuter optional); continuing without them." >&2
fi

# --- install deps ---
echo "==> npm install (this can take a few minutes)..."
( cd "$MIZUCHI_DIR" && npm install )

# --- build the CLI ---
echo "==> npm run build (CLI -> dist/cli.js)..."
( cd "$MIZUCHI_DIR" && npm run build )

# --- build the UIs if the script exists (run-report + decomp-atlas) ---
if npm --prefix "$MIZUCHI_DIR" run 2>/dev/null | grep -q '^  build:ui'; then
  echo "==> npm run build:ui (run-report + decomp-atlas)..."
  ( cd "$MIZUCHI_DIR" && npm run build:ui ) || \
    echo "WARN: build:ui failed; the CLI still works, only the web UIs are affected." >&2
else
  echo "==> no build:ui script; skipping UI build."
fi

# --- optional: m2c + decomp-permuter programmatic phases ---
# These need a Python venv. mizuchi's own scripts/setup-*.sh use `python3 -m venv`,
# which fails on Debian/Ubuntu when python3-venv (ensurepip) is missing. This
# project already standardizes on `uv` for venvs (see scripts/permuter/setup.sh),
# so we PREFER uv to create the venv + install deps directly (the same packages
# mizuchi's scripts install), and only fall back to mizuchi's script when uv is
# absent. The submodule must be present (cloned above) for either path.
setup_vendor_venv() {
  local name="$1"; shift
  local vendor_dir="$MIZUCHI_DIR/vendor/$name"
  local fallback_script="$1"; shift
  # remaining args = pip packages to install

  if [ ! -d "$vendor_dir" ] || [ -z "$(ls -A "$vendor_dir" 2>/dev/null)" ]; then
    echo "==> vendor/$name not present (submodule not fetched); skipping $name setup."
    return 0
  fi

  if command -v uv >/dev/null 2>&1; then
    echo "==> setting up vendor/$name venv with uv ..."
    # --clear self-heals a stale/broken .venv left by a prior `python3 -m venv`
    # (e.g. when python3-venv/ensurepip is missing on the host).
    if uv venv --clear --python "$(command -v python3)" "$vendor_dir/.venv" >/dev/null 2>&1 \
       && uv pip install --python "$vendor_dir/.venv/bin/python" --quiet "$@"; then
      echo "    vendor/$name OK (uv)"
      return 0
    fi
    echo "WARN: uv setup for vendor/$name failed; trying mizuchi's script." >&2
  fi

  echo "==> running mizuchi $fallback_script ..."
  if ( cd "$MIZUCHI_DIR" && bash "$fallback_script" ); then
    echo "    $fallback_script OK"
  else
    echo "WARN: $name setup failed (optional phase). On Debian/Ubuntu, either" >&2
    echo "      install python3-venv, or ensure 'uv' is on PATH, then re-run." >&2
  fi
}
# Package pins mirror mizuchi's scripts/setup-m2c.sh and setup-decomp-permuter.sh.
setup_vendor_venv "m2c" "scripts/setup-m2c.sh" "graphviz~=0.20.1"
setup_vendor_venv "decomp-permuter" "scripts/setup-decomp-permuter.sh" "pycparser<3" "toml" "Levenshtein"

# --- entrypoint + usage hint ---
CLI="$MIZUCHI_DIR/dist/cli.js"
echo ""
echo "============================================================"
echo " Mizuchi is set up."
echo ""
if [ -f "$CLI" ]; then
  echo " CLI entrypoint : node $CLI"
  echo " (package bin)  : mizuchi  ->  dist/cli.js"
else
  echo " WARNING: $CLI not found — build may have failed. Check output above." >&2
fi
echo ""
echo " FE8J config    : scripts/tools/mizuchi/mizuchi.yaml"
echo "                  Mizuchi treats the config's DIRECTORY as the project root,"
echo "                  so copy/symlink it to the repo root first (its paths —"
echo "                  fireemblem8.map, asm/ — are written for the repo root):"
echo "                      ln -sf scripts/tools/mizuchi/mizuchi.yaml ./mizuchi.yaml"
echo ""
echo " Typical usage (run from $PROJECT_ROOT, after the symlink above):"
echo "   node tools/mizuchi/dist/cli.js index-codebase --config mizuchi.yaml"
echo "   node tools/mizuchi/dist/cli.js atlas         --config mizuchi.yaml   # http://localhost:3000"
echo "   ANTHROPIC_API_KEY=... node tools/mizuchi/dist/cli.js run --config mizuchi.yaml"
echo ""
echo " Help:"
echo "   node tools/mizuchi/dist/cli.js --help"
echo "   node tools/mizuchi/dist/cli.js index-codebase --help"
echo "============================================================"
