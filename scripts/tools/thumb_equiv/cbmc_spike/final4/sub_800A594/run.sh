#!/bin/sh
# Contract-assisted relational-equivalence verification for sub_800A594
# (SplineSampleAtTime). Fail-closed: this script refuses to report a proof
# result if the current asm/src bytes have drifted from the hashes this
# package's harnesses/README were written against (Discussion #149 contract
# method: "fail-closed UNKNOWN" is a first-class outcome, not an afterthought).
set -eu

SELF_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
# Repo root is 6 levels above scripts/tools/thumb_equiv/cbmc_spike/final4/sub_800A594
ROOT=$(CDPATH= cd -- "$SELF_DIR/../../../../../.." && pwd)
cd "$ROOT"

ASM_FILE=asm/sub_800A594.s
SRC_FILE=src/nonmatching/sub_800A594.c
EXPECT_ASM_SHA256=8704987d2e22242f218f0823b02245e44c3d8dcf736cf0133264f8352e9f5d35
EXPECT_SRC_SHA256=803977e01dc87393b2a7d2888af943a9c6e3bc9b36bb80024101d5e93daac10d

fail_closed() {
    echo "FAIL-CLOSED: $1" >&2
    echo "UNKNOWN (verdict withheld -- provenance mismatch, not re-derived from stale snapshot)" >&2
    exit 2
}

echo "== provenance: hash-pinning $ASM_FILE / $SRC_FILE =="
[ -f "$ASM_FILE" ] || fail_closed "$ASM_FILE missing"
[ -f "$SRC_FILE" ] || fail_closed "$SRC_FILE missing"
ACTUAL_ASM_SHA256=$(sha256sum "$ASM_FILE" | cut -d' ' -f1)
ACTUAL_SRC_SHA256=$(sha256sum "$SRC_FILE" | cut -d' ' -f1)
if [ "$ACTUAL_ASM_SHA256" != "$EXPECT_ASM_SHA256" ]; then
    fail_closed "$ASM_FILE sha256 $ACTUAL_ASM_SHA256 != pinned $EXPECT_ASM_SHA256 (byte source moved; this package's ref_fn provenance claim is stale, re-derive before trusting the verdict below)"
fi
if [ "$ACTUAL_SRC_SHA256" != "$EXPECT_SRC_SHA256" ]; then
    fail_closed "$SRC_FILE sha256 $ACTUAL_SRC_SHA256 != pinned $EXPECT_SRC_SHA256 (candidate source moved; this package's impl_fn transcription is stale, re-derive before trusting the verdict below)"
fi
echo "OK: asm/src bytes match the hashes this package's harnesses were derived from"

echo
echo "== current ARM-vs-ARM proof (prove_nonmatching.py) =="
PY=${PY:-"$HOME/z3-venv/bin/python"}
[ -x "$PY" ] || fail_closed "z3-venv python not found at $PY"
"$PY" scripts/tools/thumb_equiv/prove_nonmatching.py sub_800A594

echo
echo "== current differential test (100 trials) =="
"$PY" scripts/tools/thumb_equiv/differential_test.py sub_800A594 --trials 100

DIR="$ROOT/scripts/tools/thumb_equiv/cbmc_spike/final4/sub_800A594"
CBMC=${CBMC:-"$ROOT/.cbmc-spike-tools/root/usr/bin/cbmc"}
[ -x "$CBMC" ] || fail_closed "cbmc binary not found at $CBMC (set CBMC=... to override)"
COMMON="--32 --unwind 10 --unwinding-assertions --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check --signed-overflow-check --undefined-shift-check --slice-formula --stop-on-fail"

run_cbmc() {
    # Run CBMC, keep the full trace in a log file (evidence), but print only
    # the compact tail (verdict + any violated property) to stdout.
    label=$1; shift
    logfile="$DIR/.run_${label}.log"
    set +e
    "$CBMC" "$@" >"$logfile" 2>&1
    rc=$?
    set -e
    grep -E "Violated property|VERIFICATION (SUCCESSFUL|FAILED)|of [0-9]+ failed" "$logfile" || true
    return $rc
}

echo
echo "== focused CBMC proof: harness.c (expect VERIFICATION SUCCESSFUL) =="
if ! run_cbmc anchor "$DIR/harness.c" $COMMON; then
    fail_closed "harness.c did not verify -- relational-equivalence claim is UNKNOWN, not proven (full trace: $DIR/.run_anchor.log)"
fi

echo
echo "== mutation A: harness_mut.c output-copy swap (expect VERIFICATION FAILED) =="
if run_cbmc mutA "$DIR/harness_mut.c" $COMMON; then
    echo "ERROR: output-copy mutation unexpectedly proved (harness is not sensitive -- do not trust the anchor result)" >&2
    exit 1
fi
echo "OK: output-copy mutation refuted as expected"

echo
echo "== mutation B: harness_mut_arg.c sub_800A34C count-argument corruption (expect VERIFICATION FAILED) =="
if run_cbmc mutB "$DIR/harness_mut_arg.c" $COMMON; then
    echo "ERROR: callee-argument mutation unexpectedly proved (anti-masking check is not load-bearing -- do not trust the anchor result)" >&2
    exit 1
fi
echo "OK: callee-argument mutation refuted as expected (at the oracle's own anti-masking assert)"

echo
echo "===== VERDICT: sub_800A594 PROVEN-BOUNDED (ARM-vs-ARM, unwind=1) + PROVEN-BOUNDED-CBMC-CVC (C-vs-C, count in [4,5], unwind=10) ====="
echo "Not a byte-match claim. make compare remains the project oracle and is unaffected (nonmatching source untouched by this package)."
