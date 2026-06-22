# Handoff — current decomp campaign state

matching-C ~95.4%. Run as P10 CTO (main thread) → P9 tech-lead teams. See memory
[[p10-p9-campaign-state]] + [[decomp-learning-sources]] and D271 in docs/decisions.md.

## Read-first foundation
- `docs/decomp_agent_playbook.md` (method, 66 verified idioms, source-router, from-scratch, naming)
- `docs/agbcc_internals.md` (agbcc deterministic decision rules — arg-order/prologue/cross-jump etc.)
- Byte-level corpora: ../fireemblem8u (US), ../fireemblem6j + ../FireEmblem7J (JP) — all output-equivalence-verified.
- Local refs (gitignored, NOT for redistribution): docs/refs/decompme_fe/ (167 solved FE fns),
  docs/refs/discord/ (chat logs — PIRACY, never commit).

## Live background work streams (integrate on completion)
- **P9-DiscordMining** → `/tmp/discord_findings.md`: merge vetted items into playbook §5/§7 + agbcc_internals.md
  + new docs/decomp_tooling.md. (Discord export to docs/refs/discord/ may still be running.)
- **P9-Verification** → `/tmp/verify_results.json` (targets `/tmp/verify_candidates.json`, 80 near-misses):
  for each status=MATCHED (sadiff diff=0), CARVE on main thread (src + handdecomp + binds + drop), full cold
  `make compare` OK, commit+push ONE at a time (collision-safe). The match rate = proof the walls dissolved.

## How to integrate a recipe (the proven main-thread loop)
Use the `/tmp/apply_v2.py`-style pattern: write src/<name>.c; git rm asm/sub_<H>.s + gbadisasm tsv; write
handdecomp_<name>.tsv (start\tend\tsrc/<name>.o(.text)); if name in baseline → baseline_syms_drop; if a US
name carved → cfbind sub_<H> alias; `rm -f src/<name>.o fireemblem8.gba; make compare` → must print
`fireemblem8.gba: OK` AND total-ROM-diff 0; check_selfcontained==0; commit+push. NEVER overwrite a committed
file (git ls-files check). Stale-OK trap: rm the .o and rebuild before trusting OK.

## Staged next
6 reconstruction P9 teams by subsystem (Battle/efx, Sio/link-arena[pilot], Worldmap, Menus/prep, Event/AI,
MapAnim/MU/UI). decomp.me cookie expires — re-harvest needs a fresh cf_clearance from the user.
