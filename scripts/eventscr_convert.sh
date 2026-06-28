#!/bin/bash
# eventscr_convert.sh -- convert one or more EventScr _ref scripts to macro form,
# verifying each one's .o COMPILES individually (defeats the stale-OK trap) before
# installing.  Run from the worktree root.  Args: script base names (e.g. EventScr_Ch2_8).
set -u
WT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$WT" || exit 1
ok=0; fail=0
for s in "$@"; do
  dir="src/data/${s}_ref"
  f="${dir}/dat_${s}_ref.c"
  [ -f "$f" ] || { echo "MISSING $f"; fail=$((fail+1)); continue; }
  # decode from the ORIGINAL committed asm/u32 form
  git show "HEAD:$f" > /tmp/orig_${s}.c 2>/dev/null || cp "$f" /tmp/orig_${s}.c
  python3 "$WT/scripts/eventscr_disasm.py" decode /tmp/orig_${s}.c > /tmp/conv_${s}.c
  if [ ! -s /tmp/conv_${s}.c ]; then echo "DECODE-EMPTY $s"; fail=$((fail+1)); continue; fi
  # install, force-clean its object + intermediate, recompile JUST this object
  cp /tmp/conv_${s}.c "$f"
  rm -f "${dir}"/*.o "${dir}"/*.s
  log=$(make "${dir}/dat_${s}_ref.o" 2>&1); rc=$?
  if [ $rc -ne 0 ] || [ ! -f "${dir}/dat_${s}_ref.o" ]; then
    echo "COMPILE-FAIL $s (rc=$rc):"
    echo "$log" | grep -iE "stdin|error:|undefined|conflict|not constant|syntax" | grep -v "Werror" | head -4
    git checkout HEAD -- "$f"; rm -f "${dir}"/*.o "${dir}"/*.s
    fail=$((fail+1)); continue
  fi
  echo "OK-COMPILE $s"; ok=$((ok+1))
done
echo "=== compiled OK: $ok  failed: $fail ==="
