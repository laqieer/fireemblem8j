#!/bin/sh
set -eu
ROOT=$(cd ../../../../../../.. && pwd)
CBMC=${CBMC:-$ROOT/.cbmc-spike-tools/root/usr/bin/cbmc}
HARNESS=scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8057F80/harness.c
COMMON="-I . -I include -I tools/agbcc/include --32 --unwind 2 --unwinding-assertions --bounds-check --pointer-check --signed-overflow-check --slice-formula --stop-on-fail"
cd "$ROOT"
echo "== sub_8057F80 stop-loss probe: expected UNKNOWN / memory-model failure =="
timeout 1200 "$CBMC" $HARNESS $COMMON
