# FE8J handoff — next-session entry point

**Read this first, then [`docs/frontier.md`](frontier.md) (the SSoT for what remains) and
[`docs/maintenance.md`](maintenance.md).** Updated end of session 2026-06-22.

## State (HEAD `dcec1f2ca`, clean, `make compare` → OK)
- BUILD SELF-CONTAINMENT 100% · **MATCHING-C 95.57% (8150/8528, ~378 left)** · EXTRACTED-DATA 100% (of measured set; data is ~94% of ROM) · NAMED 85.24% (structurally capped).
- Last session banked **+14 matching-C** + integrated all Discord/fe8u knowledge + de-staled the docs. 0 unpushed, no running agents/builds.

## The frontier (honest, ground-truthed)
The remaining ~378 are **scattered, mostly-unnamed, region-different `asm/sub_*.s` code stubs across all ROM regions** (0x080A:65, 0x0800:55, 0x080D:44 …). The JP "areas" (sio/link-arena, name-entry/kana, debug/augury, save/周回) are **already largely carved**. **fe8u-module subsystem sweeps are EXHAUSTED** (last session's 6-team sweep → ~0 net-new). What's left is **function-by-function reconstruction** (IDA/Ghidra → idiomatic C → byte-match, playbook §9) + **decomp-permuter-agbcc** for reg-alloc/instruction-order near-misses. The big parallel lever left is the **data frontier** (port fe8u `scripts/gfxtools/` — FE8J Makefile feimg/fetsa rules already wired; see `docs/fe8u_mining_findings.md`).

## NEXT-PHASE FORK (awaiting user steer)
1. **432→378 per-function stub reconstruction** (small bounded batches by specific `sub_<H>` addr).
2. **Data-extraction frontier** (port fe8u `scripts/gfxtools/` + `dump_*.py` + texttools; JP Huffman text tree differs from US). Roadmap: `docs/fe8u_mining_findings.md`.
3. **Both as parallel bounded tracks** (recommended).

## BACKLOG (deferred, specific — detail in gitignored `docs/refs/session_artifacts/recipes_*.json`)
- **StartSubSpell_efxNaglfarOBJ2** @0x0806A564 — real match, needs `AnimScr_efxNaglfarOBJ2_1` & `_3` data binds (still in baserom; _0/_2 resolve). c_source in worktree `agent-a55f9fb09623f2798`.
- **Event25_ChangeMap** @0x0800F390 — NEAR (reloc-mismatched BL, range diff=6) → permuter.
- **Event86_WmScrollCamera** (48B) + **Event87_WmScrollCameraOntoNode** (26B) — REGIONDIFF, r8/r9 reg-alloc → permuter.
- **Permuter queue** (decomp-permuter-agbcc): Text_DrawNumberOrSpace (diff=1 lsr/asr), Text_DrawNumber (diff=1), DisplayPage1 (148), GetCharTextLen, AiIsWithinRectDistance, efxLunaOBJ_Loop_{C,D}, efxLunaSCR_Loop, GmMu_SetBlendEnabled, GmMuPrim_GetMovementFacing.
- **~20 byte-neutral RENAMES** (naming axis): Worldmap 5 (WorldMap_WaitCursorJump, GmapUnitFade_Init, GmMu_0, GmMoveCursor_OnInit, GmScrollManage_OnInit), BattleAnim 8 (FaceBlink_CloseEyesInit, EkrLvupApfxInit, OpAnimBldAlphaInit, ManimLevelUpLabelColor_Init, MapLatonaShiningfx_Loop2, TryTickHSScreenExit …), UISys 7 (GameControl_0, MixPalette_Init, ParallelFiniteLoop_Init, VolumeGraphBuffer_Init, SoundRoom_DrawSprites_Init, GetLang, Text_SetParams).
- **Event open backlog**: 38 of 144 region-diff event funcs genuinely uncarved; smallest = Event8C_WmSetCursor (28B), EventA7_WmUnitSetPosition (52B), Event12_StartBGM (60B), GetEventTriggerId (68B).
- **DEADENDs** to drop from backlog (inlined, no JP body): SetOpAnimHsStatus0/1/2, SetLang, GetCharTextLenASCII.
- **Hygiene:** ~80 stale leftover worktrees (`.claude/worktrees/wf_*`, `agent-*`) to prune (stray src already harvested).

## PROCESS — the corrected playbook (hard-won; do NOT relearn the hard way)
1. **Frontier = ground truth (`asm/sub_*.s` stubs), NEVER `layout/nofuncmap_*.tsv`** (10× stale cache; its region-diff addresses are STALE US offsets). Recover the real JP addr by disasm / IDA / `scripts/carve_recipe.py`. Spot-check a sample is still-asm before dispatching.
2. **`sadiff` (`/tmp/sadiff.sh`) is RELOC-EXCLUDED — a PRE-SCREEN, not the oracle.** It masks unbound data refs AND reloc-mismatched BLs. The **full cold `make compare` sha1 OK is the only gate.** Integrate: write `src/<n>.c` + `git rm asm/sub_<H>.s` + repoint its `carved_rom.d` tsv (or git-rm it + add `handdecomp_<n>.tsv`, range from the gbadisasm tsv's first line) + add binds (`baseline_syms.d/<n>.tsv` for data/callees) + drop the baseline alias if the name is in **`baseline_syms.tsv` (master) OR `baseline_syms.d/`** (check BOTH). BATCH carves → ONE `make compare`; on fail, diff each fn's range in `fireemblem8.gba` vs `baserom.gba` to find the culprit, revert it, rebuild, commit the byte-perfect remainder.
3. **Bounded workers (D98):** ≤3 workers × ≤5 funcs × ≤3 iters, ~40-min watchdog — unbounded P9 worker trees stall ~5-6h. Mining/research P9 teams succeed bounded; the per-function MATCH task is more reliable as a deterministic **Workflow** with worktree-isolated bounded agents producing recipes the CTO integrates serially.
4. **P10 posture:** delegate detailed work to BACKGROUND agents; keep the CTO free to orchestrate + serially integrate (the only non-delegable CTO work, D99).
5. **Commit cadence:** one verified carve-batch = one commit = one push. Update `docs/frontier.md` + README scorecard whenever an axis moves (maintenance.md checklist).

## KNOWLEDGE (committed)
`docs/decomp_agent_playbook.md` (read-first), `docs/agbcc_internals.md` (+ Discord deltas), `docs/agbcc_codegen_levers.md`, `docs/discord_findings.md` (86 + 59 follow-up deltas), `docs/fe8u_decomp_history.md`, `docs/fe8u_mining_findings.md` (24 data-extraction deltas — the data roadmap), `docs/tools/*`. Verified byte-level corpora: `../fireemblem8u`, `../fireemblem6j`, `../FireEmblem7J`. Gitignored local refs (piracy boundary — distilled-only commits): `docs/refs/decompme_fe/` (167 FE solutions), `docs/refs/discord/` (raw exports), `docs/refs/discord_findings/`, `docs/refs/session_artifacts/` (recipe JSONs + carve notes). DCE at `~/tools/dce`; user's Discord token authenticates FEU + pret (re-supply via env if needed).

## Integration tooling
`/tmp/sadiff.sh <Fn> <0xaddr>` (pre-screen). `/tmp/apply_v2.py` (MATCHES env JSON → per-carve make compare; SLOW + only checks baseline_syms.d/). `scripts/autocarve.py`, `scripts/carve_recipe.py`, `scripts/calcprogress.py`, `scripts/classify_nofuncmap.py`. NOTE: **`/tmp` is wiped between sessions** — recipe `c_source` lives durably only in team worktrees + `docs/refs/session_artifacts/`.

## Memories (read for context)
[[fe8j-jp-area-frontier]] [[verify-dont-declare-dead]] [[p10-p9-campaign-state]] [[decomp-learning-sources]] [[agbcc-codegen-levers]] + the rest of the index.
