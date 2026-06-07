#!/bin/bash
# Autonomous self-drive for the FE8J decomp — the cross-session "never stop" loop.
# Installed in cron (see the tail of this file). Each run:
#   1. fast parallel harvester (cheap, no agent) for any newly-unblocked carves
#   2. ONE bounded headless agent session (agency cc) to crack a region-different
#      blocker (Phase 2/3) — the part that needs reasoning, not just the harvester
# Lock-guarded so runs never overlap; aborts on a red build; logs to /tmp.
# Tune/disable: `crontab -e`. Watch: tail -f /tmp/fe8j_autodrive.log
set -u
cd /home/laqieer/fireemblem8j || exit 1
LOG=/tmp/fe8j_autodrive.log
LOCK=/tmp/fe8j_autodrive.lock
exec 9>"$LOCK"
flock -n 9 || { echo "$(date -u +%FT%TZ) auto_drive: already running, skip" >> "$LOG"; exit 0; }

{
  echo "===== $(date -u +%FT%TZ) auto_drive start ====="
  # Don't fight an active interactive session: only run from a clean, committed tree.
  if [ -n "$(git status --porcelain 2>/dev/null | grep -v 'scheduled_tasks.lock')" ]; then
    echo "working tree dirty — someone is working; skip"; exit 0
  fi
  git pull -q 2>/dev/null || true
  if ! make compare 2>&1 | tail -1 | grep -q "fireemblem8.gba: OK"; then
    echo "build is RED — aborting (a human/agent must fix before auto-drive resumes)"; exit 1
  fi

  # 1) Fast automated carving (no agent). Converged for now, but a new symbol from
  #    a prior Phase-2/3 carve can unblock more, so always try.
  before=$(grep -c '	src/' layout/carved_rom.tsv)
  timeout 1800 python3 scripts/harvest_parallel.py -j 16 2>&1 | tail -1
  after=$(grep -c '	src/' layout/carved_rom.tsv)
  [ "$after" -gt "$before" ] && git push -q 2>/dev/null || true

  # 2) Region-different frontier: ONE bounded agent session (the real Phase 2/3 work).
  cands=$(python3 - <<'PY'
import re, os
carved = set(re.findall(r'src/([\w-]+)\.o', open('layout/carved_rom.tsv').read()))
sz = {}
for ln in open('/home/laqieer/fireemblem8u/fireemblem8.map'):
    m = re.match(r'^\s*\.text\s+0x[0-9a-f]+\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o', ln)
    if m: sz[m.group(2)] = int(m.group(1), 16)
print(len([f for f in sz if f not in carved
           and os.path.exists(f'/home/laqieer/fireemblem8u/src/{f}.c') and 0x40 <= sz[f] <= 0x8000]))
PY
)
  echo "candidates remaining: $cands"
  if [ "${cands:-0}" -gt 0 ] && command -v agency >/dev/null 2>&1; then
    timeout 5400 agency cc --dangerously-skip-permissions -p \
"You own the FE8J byte-perfect decomp and drive toward the final goal. Read docs/handoff.md \
and docs/decisions.md for state. Do ONE concrete increment: (1) run \
'python3 scripts/harvest_parallel.py -j16' for any newly-unblocked automated carves, then \
(2) crack ONE region-different blocker — Phase 2 (resolve a data global's JP address from \
the JP literal pool and add to layout/baseline_syms.tsv; or place a region-different EWRAM/.bss \
symbol individually at its JP address) or Phase 3 (hand-decompile a 'no verified runs' function \
in the ida/ghidra MCP, write matching src/ C, byte-match with scripts/permuter, carve). \
Commit + push EVERY byte-verified carve; 'make compare' must stay 'fireemblem8.gba: OK' — never \
regress it, never commit a non-matching carve. Update docs/handoff.md (verified state) and the \
TaskList before finishing. If you cannot make progress, write the blocker into docs/handoff.md \
so the next run continues." 2>&1 | tail -8
  fi
  echo "===== $(date -u +%FT%TZ) auto_drive done ====="
} >> "$LOG" 2>&1
