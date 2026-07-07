#!/usr/bin/env bash
# Reproduce the UNBOUNDED (cut-point) equivalence proof for sub_80A6F1C's de-obf loop.
# Pipeline: goto-cc -> goto-instrument --apply-loop-contracts -> cbmc (--unwind 1 = no unrolling).
set -euo pipefail
BIN="${CBMC_BIN:-$(git rev-parse --show-toplevel)/.cbmc-spike-tools/root/usr/bin}"
GC="$BIN/goto-cc"; GI="$BIN/goto-instrument"; CBMC="$BIN/cbmc"
here="$(cd "$(dirname "$0")" && pwd)"; tmp="$(mktemp -d)"

run() { # <src> <label>
  "$GC" -o "$tmp/a.goto" "$here/$1"
  "$GI" --apply-loop-contracts "$tmp/a.goto" "$tmp/a.inst.goto" >/dev/null 2>&1
  echo "=== $2 ($1) ==="
  "$CBMC" --arrays-uf-always --unwind 1 "$tmp/a.inst.goto" 2>&1 \
    | grep -E "VERIFICATION|loop invariant|preserved|decreases|UNBOUNDED|return value|failed \(" || true
  echo
}

run harness_unbounded.c     "TRUE  (expect VERIFICATION SUCCESSFUL, 0 failed)"
run harness_unbounded_mut.c "MUTATION '-'->'+' (expect VERIFICATION FAILED)"
rm -rf "$tmp"
