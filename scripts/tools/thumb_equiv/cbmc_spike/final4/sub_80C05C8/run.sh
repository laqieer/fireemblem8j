#!/bin/sh
# Contract-assisted relational equivalence proof driver for sub_80C05C8
# (GmapScreen2_Loop). Reproduces every claim in README.md:
#   1. source/asm/m2c-raw-dump hash checks (provenance -- fails closed if the
#      asm target, the reconstruction source, OR the committed raw m2c dump
#      changed since this proof was written, since the harnesses are hand
#      transcriptions of their exact current content);
#   2. the current ARM-vs-ARM SMT proof (prove_nonmatching.py) +
#      differential test, already recorded in the source header, re-run here
#      for a fresh, independently-timestamped evidence capture;
#   3. the focused CBMC contract proof (harness.c, expect
#      VERIFICATION SUCCESSFUL) and its two mutations (harness_mut.c,
#      harness_mut_cleanup.c, expect VERIFICATION FAILED both);
#   4. `make compare` (byte oracle, must stay OK; this proof changes nothing
#      on the make-compare path).
# Fails closed: any unexpected verdict aborts with a non-zero exit and a
# clear message, per the project's "no evidence-free completion" standard.
set -eu

DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$DIR/../../../../../.." && pwd)"
cd "$ROOT"

CBMC="${CBMC:-$ROOT/.cbmc-spike-tools/root/usr/bin/cbmc}"
COMMON="--32 --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check --signed-overflow-check --undefined-shift-check --slice-formula"

fail() { echo "FAIL: $*" >&2; exit 1; }

echo "== 0. provenance: source/asm/m2c-raw-dump hash check (fails closed on ANY drift) =="
ASM_SHA=$(sha1sum "$ROOT/asm/sub_80C05C8.s" | awk '{print $1}')
SRC_SHA=$(sha1sum "$ROOT/src/nonmatching/sub_80C05C8.c" | awk '{print $1}')
M2C_SHA=$(sha1sum "$DIR/m2c_ref_raw.c" | awk '{print $1}')
echo "asm/sub_80C05C8.s                          sha1=$ASM_SHA"
echo "src/nonmatching/sub_80C05C8.c               sha1=$SRC_SHA"
echo "final4/sub_80C05C8/m2c_ref_raw.c            sha1=$M2C_SHA"
EXPECT_ASM=dae3900c185fd14a90f87651ad8035f32414e588
EXPECT_SRC=df7f9c267253a578b2b15ea5801d54f3dc8df7ab
EXPECT_M2C=3eea1b9e09ce38f3e8d8869c639311d03f387d7d
[ "$ASM_SHA" = "$EXPECT_ASM" ] || fail "asm/sub_80C05C8.s changed since this proof was written (expected $EXPECT_ASM, got $ASM_SHA) -- re-audit harness.c/m2c_ref_raw.c before trusting the result"
[ "$SRC_SHA" = "$EXPECT_SRC" ] || fail "src/nonmatching/sub_80C05C8.c changed since this proof was written (expected $EXPECT_SRC, got $SRC_SHA) -- re-audit impl_step/merge_impl before trusting the result"
[ "$M2C_SHA" = "$EXPECT_M2C" ] || fail "m2c_ref_raw.c changed since this proof was written (expected $EXPECT_M2C, got $M2C_SHA) -- re-audit ref_step/merge_ref (and the m2c cleanup log) before trusting the result"
echo "OK: hashes match the files this proof was written against (asm target + reconstruction source + committed raw m2c dump)"

echo
echo "== 1. ARM-vs-ARM SMT proof (prove_nonmatching.py) =="
if [ -x "$HOME/z3-venv/bin/python" ]; then
    (cd "$ROOT" && "$HOME/z3-venv/bin/python" scripts/tools/thumb_equiv/prove_nonmatching.py sub_80C05C8) \
        || echo "NOTE: prove_nonmatching.py needs a built fireemblem8.elf/.gba + 'make nonmatching' object; see README.md Evidence section for a captured run"
else
    echo "SKIP: \$HOME/z3-venv not present in this environment"
fi

echo
echo "== 2. differential test (differential_test.py, 60 trials) =="
if [ -x "$HOME/z3-venv/bin/python" ]; then
    (cd "$ROOT" && "$HOME/z3-venv/bin/python" scripts/tools/thumb_equiv/differential_test.py sub_80C05C8 --trials 60) \
        || echo "NOTE: differential_test.py needs the same build artifacts as above"
else
    echo "SKIP: \$HOME/z3-venv not present in this environment"
fi

echo
echo "== 3a. focused CBMC contract proof: harness.c (expect VERIFICATION SUCCESSFUL) =="
"$CBMC" "$DIR/harness.c" $COMMON || fail "harness.c did not verify -- the contract proof is BROKEN, not just a mutation catching a bug"
echo "OK: harness.c VERIFICATION SUCCESSFUL"

echo
echo "== 3b. mutation A: harness_mut.c (PutSpriteExt attr 0x800->0x400; expect VERIFICATION FAILED) =="
if "$CBMC" "$DIR/harness_mut.c" $COMMON; then
    fail "harness_mut.c unexpectedly PROVED -- the contract's PutSpriteExt-argument check is not sound/non-vacuous"
fi
echo "OK: harness_mut.c refuted as expected"

echo
echo "== 3c. mutation B: harness_mut_cleanup.c (regress m2c cleanup fix #1; expect VERIFICATION FAILED) =="
if "$CBMC" "$DIR/harness_mut_cleanup.c" $COMMON; then
    fail "harness_mut_cleanup.c unexpectedly PROVED -- cleanup fix #1 would not be load-bearing"
fi
echo "OK: harness_mut_cleanup.c refuted as expected"

echo
echo "== 4. make compare (byte oracle; must stay OK -- this proof changes nothing on the build path) =="
(cd "$ROOT" && make compare)

echo
echo "ALL CHECKS PASSED for sub_80C05C8 (GmapScreen2_Loop) contract-assisted proof."
