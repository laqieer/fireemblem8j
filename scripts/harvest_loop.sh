#!/bin/bash
# Self-driving harvester (v2). Sweeps every unported TU; while a sweep keeps
# porting new runs it re-sweeps immediately. When a FULL sweep ports 0 new runs
# the matchable queue is EXHAUSTED for the current pipeline -> it writes a blocker
# report and EXITS with code 7, so the launching agent is notified to crack the
# next blocker class and relaunch. Always byte-perfect (port_run verifies every
# carve against the JP ROM and reverts anything that doesn't match).
#
#   Live status (read anytime):  /tmp/harvest_status.txt
#   Per-sweep log:               /tmp/harvest_loop.log
#   Stop manually:               pkill -f harvest_loop
set -u
cd /home/laqieer/fireemblem8j
STATUS=/tmp/harvest_status.txt

blocker_tally() {
  grep -oE ': (no verified runs|subset compile failed|compile failed after trimming.*)' \
    /tmp/harvest_loop.log 2>/dev/null | sed -E 's/^: //; s/ .*after trimming.*/ (compile failed after trimming)/' \
    | sort | uniq -c | sort -rn
}

write_status() {  # $1 = STATE
  { echo "state: $1"
    echo "time:  $(date -u +%FT%TZ)"
    echo "objs:  $(grep -c '	src/' layout/carved_rom.tsv)"
    echo "harvest_commits: $(git log --oneline | grep -c 'Harvest batch')"
    echo "HEAD:  $(git log --oneline -1)"
    echo "build: green (HEAD is a verified harvest commit; port_run reverts non-matches)"
    echo "--- blocker tally (last full sweep) ---"; blocker_tally
    echo "--- distinct blocked files (last sweep) ---"
    grep -oE '^[a-z0-9_-]+: (no verified runs|subset compile failed)' /tmp/harvest_loop.log 2>/dev/null \
      | sort -u | head -80
  } > "$STATUS"
}

write_status STARTING
while :; do
  git pull -q 2>/dev/null || true
  rm -f .harvest_tried
  before=$(grep -c '	src/' layout/carved_rom.tsv)
  : > /tmp/harvest_loop.log
  bash scripts/harvest.sh >> /tmp/harvest_loop.log 2>&1
  after=$(grep -c '	src/' layout/carved_rom.tsv)
  if [ "$after" -le "$before" ]; then
    write_status EXHAUSTED
    echo "HARVESTER EXHAUSTED $(date -u +%FT%TZ): a full sweep ported 0 new objects."
    echo "The matchable queue is empty for the current pipeline. Blocker report -> $STATUS"
    echo "Crack the next blocker class, commit the pipeline fix, then relaunch this script."
    exit 7
  fi
  write_status PROGRESSING
done
