#!/bin/bash
# Autonomous harvest: port real unported translation units in batches, committing
# and pushing each batch of successes. Safe by construction — port_run verifies
# every carve against the JP ROM and reverts anything that doesn't match, so the
# build is always byte-perfect. Tracks attempted files in .harvest_tried so it
# never re-processes a reverter. Runs until no candidates remain.
set -u
cd /home/laqieer/fireemblem8j
TRIED=.harvest_tried
touch "$TRIED"

while :; do
  CANDS=$(python3 - "$TRIED" <<'PY'
import os, re, sys
carved = set(re.findall(r'src/([\w-]+)\.o', open('layout/carved_rom.tsv').read()))
tried = set(open(sys.argv[1]).read().split())
sz = {}
for ln in open('/home/laqieer/fireemblem8u/fireemblem8.map'):
    m = re.match(r'^\s*\.text\s+0x[0-9a-f]+\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o', ln)
    if m: sz[m.group(2)] = int(m.group(1), 16)
skip = ('banim', 'efx', 'anim', 'sound', 'song', 'mid', 'gfx', 'sprite', 'face', 'portrait')
out = []
for f in sorted(sz):
    if f in carved or f in tried: continue
    if any(s in f for s in skip): continue
    if not os.path.exists(f'/home/laqieer/fireemblem8u/src/{f}.c'): continue
    if 0x40 <= sz[f] <= 0x1000: out.append(f)
print(" ".join(out[:10]))
PY
)
  [ -z "$CANDS" ] && { echo "harvest: no candidates left"; break; }

  before=$(grep -c '	src/' layout/carved_rom.tsv)
  python3 scripts/port_run.py $CANDS
  printf '%s\n' $CANDS >> "$TRIED"
  after=$(grep -c '	src/' layout/carved_rom.tsv)

  n=$((after - before))
  if [ "$n" -gt 0 ]; then
    if make compare 2>&1 | tail -1 | grep -q OK; then
      git add -A
      git commit -q -m "Harvest batch: $n run(s) ported

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
      git push -q 2>/dev/null
      echo "harvest: committed $n run(s); total objs $(grep -c '	src/' layout/carved_rom.tsv)"
    fi
  fi
done
