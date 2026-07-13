#!/bin/sh
# Fail-closed runner for the sub_800A34C (SplineEvalCatmullRom) contract-assisted
# relational equivalence package. Every stage must produce the labelled verdict
# or the script aborts non-zero; nothing here is allowed to silently degrade to
# a weaker claim than what is printed.
set -eu
cd "$(dirname "$0")"

ROOT=$(cd ../../../../../.. && pwd)
FN=sub_800A34C
SRC="$ROOT/src/nonmatching/$FN.c"
ASM="$ROOT/asm/$FN.s"
CBMC=${CBMC:-"$ROOT/.cbmc-spike-tools/root/usr/bin/cbmc"}
COMMON="--32 --unwind 17 --unwinding-assertions --bounds-check --pointer-check --signed-overflow-check --slice-formula --stop-on-fail"

# Recorded at authoring time against origin/main commit 5c210a85c99fb20d222b1d398dca3d22f015c2b1
# (see README.md "Provenance"). This package's ref_fn/impl_fn are a hand-audit
# of THESE EXACT bytes -- if either file has drifted, the transcription is
# stale and the verdict below must be withheld, not silently re-printed.
EXPECT_SRC_SHA256=6812f3ae518024464e7356a1f09fdd13dc6bbc51ee5602af2ee2c10c8c520dfd
EXPECT_ASM_SHA256=e295cbb70533729bf5083c769b6c62b68bea92259314c13a2cd0f3de36953ca6

fail_closed() {
    echo "FAIL-CLOSED: $1" >&2
    echo "UNKNOWN (verdict withheld -- provenance mismatch, not re-derived from stale snapshot)" >&2
    exit 2
}

echo "== provenance: hash-pinning candidate source and JP asm =="
if [ ! -f "$SRC" ]; then
    fail_closed "$SRC missing (candidate source moved/renamed)"
fi
if [ ! -f "$ASM" ]; then
    fail_closed "$ASM missing (JP byte source moved/renamed)"
fi
ACTUAL_SRC_SHA256=$(sha256sum "$SRC" | cut -d' ' -f1)
ACTUAL_ASM_SHA256=$(sha256sum "$ASM" | cut -d' ' -f1)
echo "$ACTUAL_SRC_SHA256  $SRC"
echo "$ACTUAL_ASM_SHA256  $ASM"
if [ "$ACTUAL_SRC_SHA256" != "$EXPECT_SRC_SHA256" ]; then
    fail_closed "$SRC sha256 $ACTUAL_SRC_SHA256 != pinned $EXPECT_SRC_SHA256 (candidate source moved; this package's impl_fn transcription is stale, re-derive before trusting the verdict below)"
fi
if [ "$ACTUAL_ASM_SHA256" != "$EXPECT_ASM_SHA256" ]; then
    fail_closed "$ASM sha256 $ACTUAL_ASM_SHA256 != pinned $EXPECT_ASM_SHA256 (byte source moved; this package's ref_fn provenance claim is stale, re-derive before trusting the verdict below)"
fi
echo "OK: asm/src bytes match the hashes this package's harnesses were derived from"
git -C "$ROOT" log -1 --format='base repo HEAD: %H %ci' -- . 2>/dev/null || true

echo
echo "== stage 1: real ARM-vs-ARM machine-code proof (project oracle-adjacent) =="
if [ ! -x "$ROOT/tools/agbcc/bin/agbcc" ]; then
    echo "FAIL-CLOSED: UNKNOWN -- tools/agbcc not installed; cannot build src/nonmatching/$FN.o"
    exit 1
fi
if [ ! -f "$ROOT/fireemblem8.elf" ]; then
    echo "FAIL-CLOSED: UNKNOWN -- fireemblem8.elf not built; run 'make compare' first"
    exit 1
fi
(cd "$ROOT" && make -s nonmatching) || { echo "FAIL-CLOSED: UNKNOWN -- nonmatching build failed"; exit 1; }
ARM_PROVE_OUT=$("$HOME/z3-venv/bin/python" "$ROOT/scripts/tools/thumb_equiv/prove_nonmatching.py" "$FN")
echo "$ARM_PROVE_OUT"
ARM_RESULT=$(printf '%s\n' "$ARM_PROVE_OUT" | awk -v fn="$FN" '$1==fn{print $2; exit}')
case "$ARM_RESULT" in
    PROVEN*) ;;
    *) echo "FAIL-CLOSED: ARM-vs-ARM result for $FN is not PROVEN* ($ARM_RESULT) -- stopping, not narrowing"; exit 1 ;;
esac

echo
echo "== stage 2: CBMC relational proof (harness.c) -- expected VERIFICATION SUCCESSFUL =="
if ! "$CBMC" harness.c $COMMON > harness_out.txt 2>&1; then
    echo "FAIL-CLOSED: UNKNOWN -- harness.c did not verify; see harness_out.txt"
    tail -40 harness_out.txt
    exit 1
fi
grep -E "VERIFICATION SUCCESSFUL|of [0-9]+ failed" harness_out.txt

echo
echo "== stage 3: CBMC mutation (harness_mut.c) -- expected VERIFICATION FAILED on out[1] =="
set +e
"$CBMC" harness_mut.c $COMMON > harness_mut_out.txt 2>&1
status=$?
set -e
if [ "$status" -eq 0 ]; then
    echo "FAIL-CLOSED: mutation unexpectedly PROVED (non-vacuity check failed)"
    exit 1
fi
if ! grep -q "out\[1\] equal" harness_mut_out.txt; then
    echo "FAIL-CLOSED: mutation refuted on an unexpected property (not out[1] equal); see harness_mut_out.txt"
    tail -40 harness_mut_out.txt
    exit 1
fi
grep -E "VERIFICATION FAILED|out\[1\] equal" harness_mut_out.txt

echo
echo "===== VERDICT: PROVEN-BOUNDED-CBMC-CVC (relational, contract-assisted) ====="
echo "ARM-vs-ARM: $ARM_RESULT"
echo "CBMC anchor: VERIFICATION SUCCESSFUL (see harness_out.txt)"
echo "CBMC mutation: VERIFICATION FAILED on out[1] equal (non-vacuous, see harness_mut_out.txt)"
