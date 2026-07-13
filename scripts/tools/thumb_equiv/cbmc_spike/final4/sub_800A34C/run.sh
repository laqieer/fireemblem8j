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

echo "== provenance: candidate source and JP asm hashes =="
if [ ! -f "$SRC" ]; then
    echo "FAIL-CLOSED: UNKNOWN -- $SRC missing (candidate source moved/renamed)"
    exit 1
fi
if [ ! -f "$ASM" ]; then
    echo "FAIL-CLOSED: UNKNOWN -- $ASM missing (JP byte source moved/renamed)"
    exit 1
fi
sha256sum "$SRC" "$ASM"
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
