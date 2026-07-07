#!/bin/sh
set -eu
CBMC=${CBMC:-.cbmc-spike-tools/root/usr/bin/cbmc}
DIR=scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_800FAD0
COMMON="--32 --unwind 24 --unwinding-assertions --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check --signed-overflow-check --undefined-shift-check --slice-formula"

printf '%s\n' '== anchor: harness.c (expect VERIFICATION SUCCESSFUL) =='
$CBMC "$DIR/harness.c" $COMMON
printf '%s\n' '== mutation A: harness_mut.c return flip (expect VERIFICATION FAILED) =='
if $CBMC "$DIR/harness_mut.c" $COMMON; then
    echo 'ERROR: return mutation unexpectedly proved'
    exit 1
else
    echo 'OK: return mutation refuted as expected'
fi
printf '%s\n' '== mutation B: harness_mut_shuffle.c selected-flag logic (expect VERIFICATION FAILED) =='
if $CBMC "$DIR/harness_mut_shuffle.c" $COMMON; then
    echo 'ERROR: shuffle mutation unexpectedly proved'
    exit 1
else
    echo 'OK: shuffle mutation refuted as expected'
fi
