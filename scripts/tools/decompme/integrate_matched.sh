#!/usr/bin/env bash
# integrate_matched.sh <slug> [outdir]
# Pull a MATCHED decomp.me scratch's source_code + compiler/flags so the integrator
# can carve it. Used by the D292 workflow for INTEGRATE / INTEGRATE_FORK actions
# (when our scratch or a community fork reached score 0). Verifies score==0 first.
set -euo pipefail
slug="${1:?usage: integrate_matched.sh <slug> [outdir]}"
out="${2:-/tmp/decompme_$slug}"
API="${DECOMPME_API_BASE:-https://decomp.me/api}"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
mkdir -p "$out"
json="$(curl -sS --max-time 25 -A "$UA" -H "Referer: https://decomp.me/" "$API/scratch/$slug")"
score="$(printf '%s' "$json" | python3 -c 'import json,sys;print(json.load(sys.stdin).get("score"))')"
if [ "$score" != "0" ]; then
    echo "refusing: scratch $slug score=$score (not a confirmed match); integrate only score==0" >&2
    exit 1
fi
printf '%s' "$json" | python3 -c '
import json,sys,os
d=json.load(sys.stdin); out=os.environ["OUT"]
open(os.path.join(out,"source.c"),"w").write(d.get("source_code",""))
open(os.path.join(out,"context.h"),"w").write(d.get("context",""))
open(os.path.join(out,"meta.txt"),"w").write("name=%s\ncompiler=%s\nflags=%s\nscore=%s\n"%(
  d.get("name"),d.get("compiler"),d.get("compiler_flags"),d.get("score")))
print("MATCHED source pulled ->", out, "(score 0)")
print("flags:", d.get("compiler_flags"))
' OUT="$out"
echo "Next: carve $out/source.c into src/, make compare -> OK, commit. (integrator owns the oracle)"
