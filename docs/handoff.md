# FE8J handoff — next-session entry point

**Read this first, then [`docs/frontier.md`](frontier.md) (the SSoT for what remains) and
[`docs/maintenance.md`](maintenance.md).** Updated mid-session 2026-06-24.

## State (HEAD ~`80384a30f`+, clean, `make compare` → OK, self-contained YES)
- BUILD SELF-CONTAINMENT **100%** · **MATCHING-C 96.73% (8249/8528, ~279 left)** · EXTRACTED-DATA 100% (of measured set) · NAMED 85.35% (structurally capped ~96%).
- This session banked **+30 matching-C** (8219→8249) via the engine below, kept docs current, pruned 51+ stale branches, and stood up a **reusable Discord learning loop**. A background worker (Title_SetupSpecialEffectGraphics + EndingCredits_UpdateStaffReel) may still be in flight — check `git branch -r` for an unmerged `feat/*` and integrate it before new work (verify, don't declare dead).

## THE ENGINE (proven this session — ~90%+ land rate on well-specified recipes)
**researcher → worker(worktree) → serial-integrate.** In ONE message dispatch:
1. N `carve-researcher` (read-only) — each returns a build-ready recipe: verbatim fe8u C body, JP address (verified via `grep -rln '\.global <Name>$' asm/sub_*.s`), exact binds (callee/data addrs from the asm pool literals), the JP delta, `-mjp-promote` likelihood, classification (CLEAN-PORT reliable / FIELD-WRITER oracle-only / RECONSTRUCT / NEEDS-IDA-PIN).
2. M `carve-worker` (`isolation: worktree`) — each claims targets, writes `src/<n>.c` + layout fragments, drives the FULL `make compare` to OK *in its worktree*, commits one-fn-per-commit, pushes a `feat/*` branch. Only pushes what byte-matches; reports NEARs honestly.
3. **You (sole integrator, D99):** `git merge --no-ff origin/feat/<b>` → full `make compare` (300s timeout) → `check_selfcontained.py` → push → delete branch → bump scorecard. ONE branch at a time. Resolve trivial Makefile `-mjp-promote`-append conflicts by keeping all lines.
Dispatch workers only AFTER the prior integration push (so they branch off latest). Stacked branches: merge the tip (it contains the stack).

## Toolchain (current — D276c)
**Single agbcc + `-mjp-promote` flag**, applied PER-TU via Makefile `src/<Fn>.o: CC1FLAGS += -mjp-promote` (like m4a's old_agbcc). Default-off = byte-identical to stock. Gates `PROMOTE_MODE` (sub-word signedness hold) + `PROMOTE_FUNCTION_ARGS` (decl-order arg ext). Patch: `scripts/agbcc_jp_promote.patch`, applied by `scripts/build_jp_agbcc.sh` before build (CI-green). **No separate jp_agbcc binary** — the old per-TU CC1_JP mechanism is gone (stale `feat/*-via-jp_agbcc` branches were superseded). decomp-permuter: after `permute.sh import`, **`sed -i 's#agbcc -mthumb-interwork#agbcc -mthumb-interwork -mjp-promote#' nonmatchings/<Fn>/compile.sh`** then `permute.sh bg <dir> -j4 --stop-on-zero`. base≤35 cracks fast; ≥130 stalls.

## Frontier status (the easy veins are mined — see frontier.md "Vein status")
- **Battle-anim efx fingerprints EXHAUSTED** (BG-scroll shake + frame-LUT BG-loop). **`StartSubSpell_efx*` spawner class EXHAUSTED** (171/172 carved). Both verified by full asm sweeps — do NOT re-dispatch teams there.
- **Worldmap Gm* / opanim / savedraw / SIO vein** heavily mined this session (~12 carved). The **0x080C0000–0x080CFFFF band has 8 still-asm subs left, ALL recipied** (see BACKLOG).
- **Name-entry/kana has NO fe8u twin** (JP-specific, reconstruct-only — defer).
- Remaining ~279 are increasingly field-writers / reconstructs / reg-alloc NEARs.

## BACKLOG — the 0x080C band 8-recipe set (researcher-specified, build-ready)
Full recipes (verbatim bodies, every bind addr, JP deltas) are in the 2026-06-24 researcher outputs in the session transcript; re-derive with a fresh `carve-researcher` if lost. Ranked:
1. **Title_SetupSpecialEffectGraphics** @0x080CA69C — RECONSTRUCT case 4 (Decompress gGfx_Titlescreen_4=0x08B4B200→0x06015800; ApplyPalette gPal_Titlescreen_4=0x08B4BB80,0x18). ~15 title data aliases (all addrs in recipe). *[may be landing via the in-flight bg worker]*
2. **EndingCredits_UpdateStaffReel** @0x080C8FF0 — FIELD-WRITER. JP **gPlaySt base=0x0202BCEC** (US 0x0202BCF0!). gEndingCredits_0=0x081F6AE8. *[in-flight bg worker]*
3. **GmTmConfront_StartAnim** @0x080C54CC — ✅ CARVED this session.
4. **GmapScreen2_Loop** @0x080C05C8 — FIELD-WRITER, port verbatim INCL. the US `asm("":::"memory")` barrier + redundant `state&2?OAM1_X:OAM1_X`. gWMNodeData=0x081F5D7C, gWMNodeIconData=0x081F5C6C.
5. **OpAnimFaceMontageBegin** @0x080CDCCC — NEAR (blocked by a shared opanim `.text` +8-byte region shift — `OpAnimEphraimExit.o`/`OpAnimDarken*` land 8 high; needs a SERIAL fix of the shared opanim region, not parallel-safe). JP delta: case-1 is a live BG-load block (US empty). Also cfbind_opanim-main.tsv has garbage Face rows.
6. **GmapEffect_0** @0x080C5F68 — NEAR (clean reg permutation: JP i=r6/ptr=r4, agbcc picks r7/r5; permuter plateaued 1315/1650). Needs a manual reg-pin pass or fresh permuter seed. gWorldmapEffect_0 data bind + baseline alias drop.
7. **Nop_Titlescreen_0** @0x080CAEF4 — RECONSTRUCT from scratch (US is a no-op stub; JP is a real nibble-blend). Pairs with #8 (#8 bl's it). Hard; likely permuter.
8. **Title_Loop_LightExplosionFx** @0x080CB114 — RECONSTRUCT (JP adds a timer-gated banner ladder absent from US). Hard.

## Other deferred NEARs (need permuter / serial work)
- **GMapScreen_UpdateScroll** @0x080BF73C — reg-alloc tiebreak (r9/r5/r7 vs sl/r7/r5 + one `str [sp,#8]` reorder); permuter plateaued 245/41k iters. Source at `/tmp/worldmap_screen_080BF73C.c.keep` (─ /tmp wiped between sessions; re-derive). Not source-fixable; try fresh seed / manual pin.

## Cross-cutting VERIFIED facts (reuse across recipes)
- **JP shared callee addrs** (bind thumb if not in baseline_syms): Decompress=0x08013008, ApplyPalette=0x08000D68, Proc_Break=0x08002DE4, Interpolate=0x08012E84, Proc_Start=0x08002BCC, EfxCreateFrontAnim=0x080564F0, CpuFastSet=0x080D636C, CpuSet=0x080D6370, DivArm=0x080D6378.
- **JP gPlaySt base = 0x0202BCEC** (US 0x0202BCF0).
- **Stale-alias detection** (HIGH-VALUE, hit twice): a jp_syms/baseline `.set NAME,0x20xxxxxx` (EWRAM) whose function pool literal is `.4byte 0x08xxxxxx` (ROM) AND us_jp_funcmap says ROM-exact = STALE alias; fix the SOURCE fragment before carving any data-reader. Fixed `gUnk_12` (0xF7FF9A04→0x0201B100, in cfbind_worldmap_path.tsv) and `gSioMain2_1` (0x20013144→0x080DED3D, in cfbind_sio_teamlist.tsv) this session.
- **layout_frag.py `write` CLI BUG:** writing one task to one manifest DELETES that task's fragments in the OTHER manifests (write() iterates all MANIFESTS, drops rowless). When a carve needs BOTH carved_rom AND baseline fragments, do them in ONE `layout_frag.write()` python call, not two CLI calls (2nd wipes 1st → 16MB-overflow build).
- **Data-gap split:** function-local `u32* tbl[N]` AnimScr arrays in JP spawners land their rodata in carved data-gap TUs (e.g. `frontier_df4_misc_lo`) — split the INCBIN to free the exact bytes (see the carved StartSubSpell_efxMaohFlashEye*/Naglfar/Ivaldi for the pattern).

## Discord learning loop (REUSABLE — set up this session, user-authorized)
`scripts/discord_fetch.sh` (committed) — incremental, per-channel watermark, fetches NEW messages only. Token at `~/.config/fe8j-decomp/discord.env` (chmod 600, OUTSIDE repo, `DISCORD_TOKEN=`, DCE auto-reads env). DCE binary at `~/tools/dce/`. Raw logs `docs/refs/discord/` gitignored (piracy boundary — distill into `docs/discord_findings.md` only). As of 2026-06-23 the 7 channels were quiet since the 6/22 base. New tool found: **Transmuter** (github.com/macabeus/transmuter — agbcc+Thumb+Claude-Code permuter rewrite; EVALUATE for the NEAR backlog). See `docs/discord_learning.md`.

## PROCESS (hard-won — do NOT relearn)
1. **Frontier = ground truth (`asm/sub_*.s` stubs), NEVER `layout/nofuncmap_*.tsv`** (10× stale, US-offset addresses).
2. **Full COLD `make compare` sha1 OK is the ONLY gate** (range byte-diff / sadiff are pre-screens; a failed .o prints a STALE "OK" — grep the build log for `error:`/`multiple definition` first). Then `check_selfcontained.py`.
3. **Carve INDIVIDUALLY, verify `git cat-file -e HEAD:src/<n>.c` after each commit** (git-add-abort + staged-deletion + cfbind-garbage traps broke HEAD before — see memory `fe8j-carve-regression-traps`). Never `pkill -f <pat>` matching your own command.
4. **Commit cadence:** one verified carve = one commit = one push. Bump `docs/frontier.md` + README scorecard whenever an axis moves.
5. **P10 posture:** delegate to background/worktree agents; keep the integrator (you) free — serial integration is the only non-delegable work.

## KNOWLEDGE (committed)
`docs/frontier.md` (SSoT + playbook + vein status), `docs/decisions.md` (D276/D276b/D276c flag), `docs/decomp-completion-standard.md` (4-axis honest framing + Code<Functions byte-weighting), `docs/agbcc_codegen_levers.md`, `docs/discord_findings.md`, `docs/fe8u_mining_findings.md` (data roadmap), `docs/tools/*`. Byte-level corpora: `../fireemblem8u` (primary), `../fireemblem6j` (efx reconstruction source — mind `s16/8`→`ldrh+lsrs`), `../FireEmblem7J`.

## Integration tooling
`scripts/calcprogress.py` (4-axis), `scripts/check_selfcontained.py` (cold gate), `scripts/autocarve.py`, `scripts/carve_recipe.py`, `scripts/permuter/permute.sh`. `make compare` is the oracle. `/tmp` is wiped between sessions — durable recipe state lives in worktrees + the transcript + `docs/refs/session_artifacts/`.
