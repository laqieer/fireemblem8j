#!/bin/bash
# ============================================================================
# FE8J FINAL-GOAL ORACLE  (PUA Loop verify_command — Phase-2 gate)
# ----------------------------------------------------------------------------
# Exit 0 ONLY when the FULL decomp standard is met. This is deliberately the
# STRICTEST honest bar (anti-gaming: it makes "done" harder, never easier):
#
#   (A) ungameable byte check : `make compare` => `fireemblem8.gba: OK`
#       (the ROM sha1 cannot be faked — see CLAUDE.md)
#   (B) all 4 honest axes == 100.00% per scripts/calcprogress.py
#       self-containment + matching-C + extracted-data + named-symbols
#
# Claude cannot bypass this: the loop hook runs THIS command independently on
# every <promise>LOOP_DONE</promise>. A naked claim of completion is futile.
# ============================================================================
set -uo pipefail
REPO="/home/laqieer/fireemblem8j"
cd "$REPO" || { echo "ORACLE-ERR: cannot cd $REPO"; exit 2; }

echo "== FINAL-GOAL ORACLE =="

# ---- (A) ungameable byte-perfect build ----
if ! make compare 2>&1 | grep -q 'fireemblem8.gba: OK'; then
  echo "ORACLE-FAIL (A): make compare is NOT OK (build not byte-perfect)"
  exit 1
fi
echo "  (A) make compare: OK"

# ---- (B) all four axes at 100.00% ----
prog="$(python3 scripts/calcprogress.py 2>/dev/null)" || { echo "ORACLE-ERR: calcprogress failed"; exit 2; }
fail=0
while IFS= read -r axis; do
  line="$(printf '%s\n' "$prog" | grep -F "$axis" | head -1)"
  pct="$(printf '%s\n' "$line" | grep -oE '[0-9]+\.[0-9]+%' | head -1)"
  printf '  (B) %-22s -> %s\n' "$axis" "${pct:-<none>}"
  [ "$pct" = "100.00%" ] || fail=1
done <<'AXES'
BUILD SELF-CONTAINMENT
MATCHING-C FUNCTIONS
EXTRACTED DATA
NAMED SYMBOLS
AXES

if [ "$fail" -eq 0 ]; then
  echo "ORACLE-PASS: byte-perfect + all 4 axes 100%. FINAL GOAL COMPLETE."
  exit 0
fi
echo "ORACLE-FAIL (B): not all axes at 100% — keep grinding."
exit 1
