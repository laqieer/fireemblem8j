#!/bin/sh
set -eu
CBMC=${CBMC:-../../../../../../../.cbmc-spike-tools/root/usr/bin/cbmc}
COMMON="--32 --unwind 17 --unwinding-assertions --bounds-check --pointer-check --signed-overflow-check --slice-formula --stop-on-fail"
echo "== anchor: expected VERIFICATION SUCCESSFUL =="
$CBMC harness.c $COMMON
echo "== mutation: expected VERIFICATION FAILED =="
set +e
$CBMC harness_mut.c $COMMON
status=$?
set -e
if [ "$status" -eq 0 ]; then
    echo "ERROR: mutation unexpectedly proved"
    exit 1
fi
echo "mutation refuted as expected"
