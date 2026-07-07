#!/bin/sh
set -eu
CBMC=${CBMC:-.cbmc-spike-tools/root/usr/bin/cbmc}
DIR=scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_800FAD0
COMMON="--32 --unwind 24 --unwinding-assertions --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check --signed-overflow-check --undefined-shift-check"

printf '%s\n' '== anchor: harness.c (expect VERIFICATION SUCCESSFUL) =='
$CBMC "$DIR/harness.c" $COMMON
printf '%s\n' '== mutation: harness_mut.c (expect VERIFICATION FAILED) =='
if $CBMC "$DIR/harness_mut.c" $COMMON; then
    echo 'ERROR: mutation unexpectedly proved'
    exit 1
else
    echo 'OK: mutation refuted as expected'
fi
