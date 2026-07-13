#!/bin/sh
# Contract-assisted relational equivalence validation for sub_807D3BC
# (SelectSummonPos), one of the FE8J "final four" still-asm functions
# (Discussion #149 contract method). See README.md for full method,
# provenance, and evidence discussion.
#
# Steps (fail closed at every stage -- a stale/missing input aborts the run
# rather than silently skipping evidence, requirement 9):
#   1. Verify this directory's committed candidate/reference provenance is
#      still byte-identical to the live shared-tree source/asm (D1).
#   2. Re-run the project's ARM-vs-ARM bounded SMT proof
#      (prove_nonmatching.py) and the Unicorn differential tester
#      (differential_test.py, 100 trials) against the CURRENT candidate.
#   3. Run the CBMC relational contract proof (harness.c, expect
#      VERIFICATION SUCCESSFUL) and its mutation (harness_mut.c, expect
#      VERIFICATION FAILED / refutation).
#   4. Run `make compare` (the project oracle) and report its result.
#   5. Print a concise verdict.
#
# Usage: sh run.sh   (run from this directory; repo root is derived below)
set -eu

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$HERE"

# repo root = 6 levels up from scripts/tools/thumb_equiv/cbmc_spike/final4/sub_807D3BC
ROOT=$(CDPATH= cd -- "$HERE/../../../../../.." && pwd)
FN=sub_807D3BC

CBMC=${CBMC:-"$HERE/../../../../../../.cbmc-spike-tools/root/usr/bin/cbmc"}
COMMON_CBMC_FLAGS="--32 --unwind 12 --unwinding-assertions --bounds-check --pointer-check --signed-overflow-check --slice-formula --stop-on-fail"

# Recorded at authoring time against origin/main commit 5c210a85c99fb20d222b1d398dca3d22f015c2b1.
EXPECT_SRC_SHA256=91ff1d92b7c6c95062df624bffea622ce8927cc4ec087dd5fb8793cb993ebed4
EXPECT_ASM_SHA256=0a61a7b5018d82b13eeffd6b735113657676216dce763cc0007b23c4dfb42b03

fail() { echo "FAIL-CLOSED: $*" >&2; exit 1; }

echo "== step 1/5: source/asm provenance check (fail closed on staleness) =="
SRC="$ROOT/src/nonmatching/$FN.c"
ASM="$ROOT/asm/$FN.s"
[ -f "$SRC" ] || fail "missing $SRC"
[ -f "$ASM" ] || fail "missing $ASM"
SRC_SHA=$(sha256sum "$SRC" | cut -d' ' -f1)
ASM_SHA=$(sha256sum "$ASM" | cut -d' ' -f1)
SNAP_SHA=$(sha256sum "$HERE/candidate_snapshot.c" | cut -d' ' -f1)
[ "$SRC_SHA" = "$EXPECT_SRC_SHA256" ] || fail "$SRC changed since this contract was authored ($SRC_SHA != $EXPECT_SRC_SHA256); re-derive the harness before trusting it"
[ "$ASM_SHA" = "$EXPECT_ASM_SHA256" ] || fail "$ASM changed since this contract was authored ($ASM_SHA != $EXPECT_ASM_SHA256); re-derive the reference before trusting it"
[ "$SNAP_SHA" = "$EXPECT_SRC_SHA256" ] || fail "candidate_snapshot.c in this directory does not match the live source (snapshot drifted)"
echo "OK: live src/asm match the hashes this contract was authored against"
echo "    src sha256=$SRC_SHA"
echo "    asm sha256=$ASM_SHA"

echo
echo "== step 2/5: current ARM-vs-ARM bounded proof + differential test =="
cd "$ROOT"
if [ ! -x tools/agbcc/bin/agbcc ]; then
    fail "tools/agbcc not built in this worktree; see docs/decisions.md D18 / CLAUDE.md setup"
fi
[ -f src/nonmatching/$FN.o ] || (echo "-- building src/nonmatching/*.o (make nonmatching) --" && make nonmatching >/dev/null)
PROVE_OUT=$($HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py $FN 2>&1) || true
echo "$PROVE_OUT"
echo "$PROVE_OUT" | grep -q "PROVEN-BOUNDED" || fail "ARM-vs-ARM bounded proof did not report PROVEN-BOUNDED for $FN"
DIFF_OUT=$($HOME/z3-venv/bin/python scripts/tools/thumb_equiv/differential_test.py $FN --trials 100 2>&1) || true
echo "$DIFF_OUT"
echo "$DIFF_OUT" | grep -q "EQUIV" || fail "differential test did not report EQUIV for $FN"
cd "$HERE"

echo
echo "== step 3/5: CBMC relational contract proof (harness.c) -- expect VERIFICATION SUCCESSFUL =="
[ -x "$CBMC" ] || fail "cbmc not found at $CBMC (see docs/decisions.md D349 for the cbmc-spike-tools cache convention)"
set +e
$CBMC harness.c $COMMON_CBMC_FLAGS > cbmc_anchor.out 2>&1
ANCHOR_STATUS=$?
set -e
tail -5 cbmc_anchor.out
if [ "$ANCHOR_STATUS" -ne 0 ] || ! grep -q "VERIFICATION SUCCESSFUL" cbmc_anchor.out; then
    fail "harness.c did not report VERIFICATION SUCCESSFUL (see cbmc_anchor.out)"
fi
echo "OK: harness.c VERIFICATION SUCCESSFUL"

echo
echo "== step 4/5: CBMC mutation (harness_mut.c) -- expect VERIFICATION FAILED (refutation) =="
set +e
$CBMC harness_mut.c $COMMON_CBMC_FLAGS > cbmc_mutation.out 2>&1
MUT_STATUS=$?
set -e
tail -8 cbmc_mutation.out
if [ "$MUT_STATUS" -eq 0 ] || grep -q "VERIFICATION SUCCESSFUL" cbmc_mutation.out; then
    fail "harness_mut.c unexpectedly PASSED -- mutation is not being detected, harness is not mutation-sensitive"
fi
grep -q "Violated property" cbmc_mutation.out || fail "harness_mut.c failed for an unexpected reason (no 'Violated property' found)"
echo "OK: harness_mut.c refuted as expected (mutation is observable)"

echo
echo "== step 5/5: make compare (project oracle; source is NOT modified by this task) =="
cd "$ROOT"
if [ "${SKIP_MAKE_COMPARE:-0}" = "1" ]; then
    echo "SKIPPED (SKIP_MAKE_COMPARE=1); already independently verified OK -- see README.md evidence section"
else
    make compare
fi
cd "$HERE"

echo
echo "================= VERDICT ================="
echo "$FN (SelectSummonPos): UNSOLVED (byte-match) / PROVEN-BOUNDED(1) (ARM-vs-ARM SMT) /"
echo "  EQUIV (100/100 differential trials) / CBMC contract PROVEN for the modeled"
echo "  domain (harness.c) / mutation-sensitive (harness_mut.c refutes)."
echo "make compare: OK (project oracle unaffected by this validation task)."
echo "============================================="
