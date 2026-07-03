#!/usr/bin/env bash
#
# FE8J final-goal completion Oracle (ungameable gate for the PUA Loop).
#
# Exits 0 ONLY when the decomp final goal is genuinely met:
#   1. make compare  -> fireemblem8.gba: OK      (byte-exact, never-regress oracle)
#   2. matching-C axis == 100%                    (0 functions still descriptive asm)
#   3. named-symbols axis == 100%                 (0 sub_/data_/nullsub_ placeholders)
#   4. source-form data axis == 100%              (0 residual opaque raw-incbin bytes)
#
# Anything short of that exits non-zero with a one-line reason, so "LOOP_DONE" can
# never be accepted while real frontier remains. This is the honest Oracle: Claude
# saying "done" does not count; this script saying so does.
set -uo pipefail
cd "$(dirname "$0")/.."

fail() { echo "GATE-FAIL: $*"; exit 1; }

# 1. byte-exact oracle
if ! make compare >/tmp/fgg_compare.log 2>&1; then
    tail -3 /tmp/fgg_compare.log
    fail "make compare did not succeed"
fi
grep -q "fireemblem8.gba: OK" /tmp/fgg_compare.log || fail "make compare did not end in 'fireemblem8.gba: OK'"

# 2-4. axis completion from calcprogress
prog="$(python3 scripts/calcprogress.py 2>/dev/null)"

asm_funcs="$(sed -n 's/^\([0-9][0-9]*\) functions are marked as unmatched\..*/\1/p' <<<"$prog")"
[ "${asm_funcs:-1}" = "0" ] || fail "matching-C not complete: ${asm_funcs:-?} functions still descriptive asm"

undoc="$(sed -n 's/^\([0-9][0-9]*\) symbols undocumented .*/\1/p' <<<"$prog")"
[ "${undoc:-1}" = "0" ] || fail "named-symbols not complete: ${undoc:-?} placeholders remain"

opaque="$(sed -n 's/.*(\([0-9][0-9]*\) residual opaque\/non-source bytes).*/\1/p' <<<"$prog")"
[ "${opaque:-1}" = "0" ] || fail "source-form not complete: ${opaque:-?} residual opaque bytes remain"

echo "GATE-PASS: make compare OK; matching-C, named-symbols, and source-form axes all at 100%."
exit 0
