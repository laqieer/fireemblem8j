#!/bin/bash
# Continuous harvester: sweep all real unported TUs, then idle until a pipeline
# script changes (a new reference-class fix), then re-sweep to catch what it now
# unblocks. Commits only during sweeps (never while idle), so it doesn't collide
# with pipeline-improvement commits made during the idle window. Always
# byte-perfect-safe (port_run verifies + reverts). Stop with: pkill -f harvest_loop
set -u
cd /home/laqieer/fireemblem8j
PIPELINE="scripts/port_run.py scripts/extract_run.py scripts/find_runs.py scripts/msg_align.py scripts/gen_msg_h.py"

while :; do
  git pull -q 2>/dev/null || true
  rm -f .harvest_tried
  bash scripts/harvest.sh >> /tmp/harvest_loop.log 2>&1
  sig=$(md5sum $PIPELINE 2>/dev/null | md5sum)
  echo "$(date -u +%FT%TZ): sweep done; idle until a pipeline script changes" >> /tmp/harvest_loop.log
  # idle (no git ops) up to ~2h; wake when a pipeline script content changes
  for _ in $(seq 1 240); do
    sleep 30
    [ "$(md5sum $PIPELINE 2>/dev/null | md5sum)" != "$sig" ] && break
  done
done
