# FE8J handoff — next-session entry point

**Read this first, then [`docs/frontier.md`](frontier.md) (the SSoT for what remains) and
[`docs/maintenance.md`](maintenance.md).** Updated mid-session 2026-06-24.

## State (HEAD clean, `make compare` → OK, self-contained YES)
- **HEAD `b7cb6f120`** (run `git rev-parse --short HEAD` — newer if you integrated the in-flight worker below). **main GREEN + CI GREEN, self-contained 100%.**
- BUILD SELF-CONTAINMENT **100%** · **MATCHING-C 97.74% (8335/8528, ~193 left)** · EXTRACTED-DATA 100% (of measured set) · NAMED 85.36% (13175/15435, structurally capped ~96%).
- This session banked **+112 net matching-C** (8219→8335; from the 8150 baseline that is **+185**) via the engine below, kept docs current, and fixed 3 corrupt cfbind addrs (see bucket (c)). The clean-recipe vein is now **EXHAUSTED** — the tail is the 3-bucket frontier below.

## ⚠️ IN-FLIGHT WORKER — INTEGRATE FIRST (verify-don't-declare-dead)
A `carve-worker` was carving three targets when this handoff was written. **Before any new work, check what it landed and integrate it.** Do NOT declare it dead from an absent file or a mid-snapshot transcript (memory `verify-dont-declare-dead`); confirm via `git branch -r` / the worker's completion notification, then merge.
- `git branch -r | grep feat/` — already pushed when this was written: **`origin/feat/ekrBattleInRoundIdle`** (tip `9689ce8ba`, ekrBattleInRoundIdle = JP `sub_80511E0`) and **`origin/feat/SaveMenuExtrasMenuLoop`** (tip `665faf37e`, SaveMenuExtrasMenuLoop = JP `sub_80A3B70` reconstruct). Also expected: **ekrGaugeMain** (`sub_8051FB8`, corrupt-cfbind gBanimMaxHP decode) on its own `feat/*` branch.
- **Integrate serially, ONE branch at a time, full `make compare` gate.** ⚠️ **ekrGaugeMain touches cfbind → gate with `make clean && make compare`** (NOT the warm `rm rom/elf` form) + `gh run list` per the CI lesson below.

## DETACHED PERMUTERS still running (may have cracked a NEAR late)
Check `nonmatchings/<Fn>/output-0-*` for a zero-score solution before deferring these:
**Tactician_InitScreen** (1-instr, base 320→125), **SelectSummonPos**, **ClassIntro_Init**, **AdjustNewUnitPosition**. If `output-0-*` exists, extract the mutation (diff `source.c` vs the near-match), apply to a clean `#include` version, carve.

## THE FRONTIER — clean-recipe vein EXHAUSTED, ~193 remain — 3 BUCKETS
Even the 'self-cert leaves' (EfxAdvanceFrameLut + AddAttr2dBitMap) match the fe8u ELF but NOT JP
(compiler-config PROMOTE/CSE/reg-pressure divergence). The remaining ~193 fall into 3 buckets:

### (a) agbcc config-ceiling NEARs — HIGHEST-LEVERAGE UNLOCK (do this first)
Functions that match the **fe8u ELF but not the JP ROM** via **register-save-ORDER** / **cross-jump-MERGE** /
**register-PRESSURE-r7**. **`-mjp-promote` AND the decomp-permuter CANNOT crack these** — proven:
- **AddAttr2dBitMap** — 2-halfword diff, permuter stuck **104k iters**, no zero.
- **EfxAdvanceFrameLut** — cross-jump / tail-merge.
- **SioBat_SetupLoop** — **+48B**, an extra callee-saved r7 (register pressure).
**Do NOT keep throwing multi-hour permuter runs at this class** (one run burned ~7h for 0).
**PATH (likely unlocks a whole class):** extend the jp_agbcc patch — **`scripts/build_jp_agbcc.sh` +
`scripts/agbcc_jp_promote.patch`** — with NEW `thumb.h` config knobs for **save-order / cross-jump /
reg-pressure** (analogous to how PROMOTE_MODE + PROMOTE_FUNCTION_ARGS dissolved the s8/s16-hold and
arg-order subclasses — see memory `jp-agbcc-config-ceiling` and `docs/agbcc_codegen_levers.md`). This is a
TOOLCHAIN investigation, not a per-function grind.

### (b) Reconstructs (carveable — rebuild from gbadisasm behavior, not a fe8u port)
The fe8u port is a structural mismatch; rebuild from the gbadisasm behavior (often a first-compile match).
- **Menu_OnIdle** — ✅ DONE this session (JP INLINED ClearMenuBgs).
- **LoadUnit** (`sub_801786C`)
- **BattleAIS_ExecCommands** (`sub_80599F8`) — truncated-stub union 0x80599F8–0x805A488; split the range at the true boundary first (truncated-stub-split technique).
- **PrepareBattleGraphicsMaybe** (`sub_8057F80`)
- **SaveMenuExtrasMenuLoop** (`sub_80A3B70`) — in-flight worker (integrate from `origin/feat/SaveMenuExtrasMenuLoop`).

### (c) Corrupt-cfbind field-writers (carveable)
**Pattern:** decode the real EWRAM addr from the function's asm `.4byte` pool literal, then fix it with an
**additive last-wins** `zfix_<Fn>.tsv` fragment in `baseline_syms.d` — **do NOT edit the shared cfbind row**
(that breaks other readers). These are data/cfbind commits → gate with `make clean && make compare` + `gh run list`.
- **NewEfxHitQuake** — ✅ DONE this session (gEfxTerrainPalette→0x02016828).
- **ekrGaugeMain** — in-flight worker (gBanimMaxHP decode).
- Fixed this session (reuse as reference): **gEfxTerrainPalette→0x02016828**, **gBanimForceUnitChgDebug→0x0203E1A0**, **gBanimPositionIsEnemy→0x0203E104**.

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
- **Worldmap Gm* / opanim / savedraw / SIO vein** heavily mined this session (~12 carved). The **0x080C band remaining is split**: 2 reconstruct recipes (Title titlescreen FX) + the reg-alloc NEAR backlog (GmapScreen2_Loop, OpAnimFaceMontageBegin, GmapEffect_0, GMapScreen_UpdateScroll — see "Other deferred NEARs").
- **Name-entry/kana has NO fe8u twin** (JP-specific, reconstruct-only — defer).
- Remaining ~277 are increasingly field-writers / reconstructs / reg-alloc NEARs.

## NEXT TARGETS — Group C decoded-delta (clean) + reconstruct group (2026-06-24)
Researcher-specified, build-ready; these are the next clean/reconstruct fuel after the Group A/B batch.
- **Group C — decoded-delta CLEAN recipes** (const/layout deltas already decoded; fast carves):
  **NameEntrySpriteDraw_Loop**, **Tactician_InitScreen**, **GoalDisplay_Init**, **DisplayPage0** /
  **DisplayPage1**.
- **RECONSTRUCT group** (fe8u port is a structural mismatch — rebuild from gbadisasm behavior):
  **NewPopup2_PlanD**, **SaveMenuExtrasMenuLoop**, **LoadUnit**, **ClassIntro_Init**,
  **BattleAIS_ExecCommands**.

### Researcher techniques discovered (2026-06-24 — reuse across recipes)
1. **PlaySoundEffect-macro** — JP calls go through the PlaySoundEffect macro (not a direct fn) — match the macro expansion, not a bl to a named fn.
2. **save-format-from-pool** — derive the JP save-record format/sizes from the literal pool constants, not from the fe8u struct (JP save layout diverges).
3. **same-name≠same-function** — a JP `sub_` sharing a fe8u name can be a DIFFERENT function; confirm by callee-fingerprint, never by name alone.
4. **per-TU-struct-shape** — JP TUs use LOCAL workaround structs (e.g. opinfo procs); never edit the shared header — define a local struct in the carve TU.
5. **truncated-stub-split** — a gbadisasm stub can be a TRUNCATION of a larger function; split the range at the true boundary before carving.
6. **per-cluster-msgid-bands** — JP message-ids shift in per-cluster bands (decode the band offset once per cluster, apply to all members).

## BACKLOG — the 0x080C band recipe set (researcher-specified, build-ready)
Full recipes (verbatim bodies, every bind addr, JP deltas) are in the 2026-06-24 researcher outputs in the session transcript; re-derive with a fresh `carve-researcher` if lost. The reg-alloc NEARs (GmapScreen2_Loop, OpAnimFaceMontageBegin, GmapEffect_0, GMapScreen_UpdateScroll) moved to "Other deferred NEARs" below. Ranked:
1. **Title_SetupSpecialEffectGraphics** @0x080CA69C — RECONSTRUCT case 4 (Decompress gGfx_Titlescreen_4=0x08B4B200→0x06015800; ApplyPalette gPal_Titlescreen_4=0x08B4BB80,0x18). ~15 title data aliases (all addrs in recipe). *[may be landing via the in-flight bg worker]*
2. **EndingCredits_UpdateStaffReel** @0x080C8FF0 — FIELD-WRITER. JP **gPlaySt base=0x0202BCEC** (US 0x0202BCF0!). gEndingCredits_0=0x081F6AE8. *[in-flight bg worker]*
3. **GmTmConfront_StartAnim** @0x080C54CC — ✅ CARVED this session.
4. **Nop_Titlescreen_0** @0x080CAEF4 — RECONSTRUCT from scratch (US is a no-op stub; JP is a real nibble-blend). Pairs with #5 (#5 bl's it). Hard; likely permuter.
5. **Title_Loop_LightExplosionFx** @0x080CB114 — RECONSTRUCT (JP adds a timer-gated banner ladder absent from US). Hard.

## Other deferred NEARs (need a lever find or fresh permuter seed — NOT clean-recipe targets)
A faithful fe8u port + `-mjp-promote` lands a small NEAR that current levers don't close; do NOT spend
a clean-port worker on these. They need a reg-alloc lever discovery or a fresh permuter seed.
- **NEW permuter-resistant NEARs (2026-06-24, Group A/B batch — body reg-swaps, register-pins make them WORSE):**
  - **SioBat_SetupLoop** — **+48B**, r5-base-cache vs an extra callee-saved r7. Body reg structure.
  - **WriteNewGameSave** — **+44B**, agbcc won't OVERLAY GameSavePackedUnit + Dungeon[2] onto one stack
    slot (frame 0x54 vs JP 0x38). A stack-overlay ceiling, not a register pin.
  - **StrInsertTact** — r4↔r5 src/dst swap; permuter 375→125 (no zero).
  - **AiAttemptStealActionWithinMovement** — r4↔r5 gBmMapSize.y index reg.
  - **Menu_OnIdle** — NOT a NEAR: **region-diff RECONSTRUCT** (JP INLINED ClearMenuBgs). Rebuild from
    gbadisasm, do not port the fe8u out-of-line-call version.
- **GmapScreen2_Loop** @0x080C05C8 — CONFIRMED NEAR (was BACKLOG recipe #4). JP allocator spills `chr`
  to a 0x14 stack frame + keeps `proc` in r9; agbcc uses a 0x10 frame + registers. permuter
  (jp-promote, ~46k iters) plateaued at 1745 (best 536/544 bytes). Needs a lever forcing the `chr`
  stack-spill. (gWMNodeData=0x081F5D7C, gWMNodeIconData=0x081F5C6C if/when solved.)
- **GMapScreen_UpdateScroll** @0x080BF73C — 3-way reg permutation (r9/r5/r7 vs sl/r7/r5) + one
  `str [sp,#8]` reorder; permuter plateaued 245. Not source-fixable; try fresh seed / manual pin.
- **eventscr Event-dispatch reg-alloc NEARs** (clean fe8u port compiles+links, leaves a small reg-alloc/
  scheduling NEAR — permuter-campaign targets, NOT clean-port dispatch; best-first by byte-distance.
  STILL-PLATEAUED after round 1 — register-pins make body-reg-swaps WORSE):
  - **Event1B_TEXTSHOW** @0x0800E5CC (sub_800E5CC) — **6-byte** evArgument widen-scratch (zero-extend-via-
    scratch + zeroFlag re-materialize); KEEP the case-3 inline-asm trick. WIP in `_permwork/*.wip`.
  - **Event0E_STAL** @0x0800DD9C (sub_800DD9C) — ~**10-byte** proc/subcode r3↔r4 swap (a BODY callee-saved
    reg-swap — `register int asm("rN")` pins make it WORSE). WIP in `_permwork/*.wip`.
  - **Event18_ColorFade** @0x0800E1FC (sub_800E1FC) — spill-pattern / frame-size diff.
  - **EventA8_WmUnitMoveFree** @0x0800C994 (sub_800C994) — sl/r8-vs-ip/r7 cascade; OWNS the poisoned-alias
    fix (StartGmapAutoMu_Type1, cfbind_eventscr_gmap.tsv line 21 0x07E72DA4→0x080C818C).
- **Event0F_CounterOps** @0x0800DE3C — clean fe8u port compiles+links, but a pervasive r4↔r5 (+ r0↔r3
  in INC/DEC) reg-alloc tiebreak (~25 insn diffs); `-mjp-promote` fixed the s8-DEC clamp but not the
  swap. Needs decomp-permuter with project include-path plumbing (bare `cpp -nostdinc` import lacks it),
  or a manual reg-pin find. (gEventSlots/gEventSlotCounter are NAMED — no binds.)
- **OpAnimFaceMontageBegin** @0x080CDCCC — blocked by a shared opanim `.text` +8-byte region shift
  (`OpAnimEphraimExit.o`/`OpAnimDarken*` land 8 high); needs a SERIAL fix of the shared opanim region
  + `cfbind_opanim-main.tsv` garbage Face rows, not a parallel carve. JP delta: case-1 is a live
  BG-load block (US empty).
- **AdjustNewUnitPosition** @0x0807C8DC (sub_807C8DC) — STILL-PLATEAUED after round 1 (permuter base
  810→185, a 4-way reg perm). Body VERIFIED correct (prior "structural fail" flag DEBUNKED; JP allocates
  iy→r2/ix→r4/yCur→r5 vs agbcc r5/r3/r4); reaches correct 308B length under `-mjp-promote` + explicit
  s8 x/y locals. A BODY reg-perm — `register int asm("rN")` pins make it WORSE. Needs a stronger profile
  next session. WIP in `_permwork/*.wip`.
- **Permuter campaign round 1 (2026-06-24): +8 cracked**, dropping the prior "+4 NEW NEARs" backlog and
  several others. CRACKED (now carved, no longer NEARs): EkrLvup_InitStatusText (135),
  EkrDragonBodyAnimeMain (35 — the 'pool-flush' premise was a DCE'd dead-copy), Event26_CameraControl
  (manual `register int asm("r0/r1/r2")` arg-order pin — permuter alone plateaued 105),
  EkrDragonQuakeMain (r6↔r7 via do-while removal), Event35_UnitClassChanging (2000→0), ChapterStatus_Init
  (permuter-as-diagnostic exposed a REGION-DIFF: JP calls CallARM_FillTileRect directly, skips the
  Decompress staging), SallyCir_Loop + GmapEffect_0 (deterministic `-mjp-promote`, NOT actually permuter).
  LEVER TRIAGE: arg-MOVE-order residual → manual `register int asm("rN")` pins (permuter can't); BODY
  callee-saved reg-SWAP → pins make it WORSE; always retry `-mjp-promote` before importing (cracks
  sign-domain NEARs deterministically). The 3 STILL-PLATEAUED genuine reg-alloc ceilings (need a stronger
  profile next session, WIPs in `_permwork/*.wip`): **Event0E_STAL** (10B proc/subcode r3↔r4),
  **Event1B_TEXTSHOW** (6B evArgument widen-scratch), **AdjustNewUnitPosition** (base 810→185, 4-way
  reg perm) — see their entries above. The worktree permuter is parallel-safe (3 workers -j4, no OOM)
  with the documented import.py-direct + compile.sh `-mjp-promote` two-step plumbing.
- **HandleTurnRecordText** @sub_80BC2A4 — permuter/codegen-NEAR (44B short): y/textIndex r4/r8-vs-r6/r9
  reg perm + tilemap-col factoring. Codegen-shape NEAR (not a const fix). Permuter campaign target.
- **ClassStatsDisplay_Loop** @sub_80B8B28 — permuter/codegen-NEAR (one of the 0x80B OpInfo cluster, local-
  struct pattern, NO opinfo.h edit): JP REVERSES the gauge-pip loop + spills i+1/&unk_34/&unk_35 each outer
  iter, ~121 opcodes diff, permuter base 3885->1450. Needs a loop-direction/spill lever or stronger profile.
- **OpInfo cluster — 2/5 DONE (2026-06-24).** **ClassIntro_LoopOut** is DONE (carved via a LOCAL
  OpInfoEnterProcJ workaround struct — JP opinfo procs use local structs, **NEVER edit shared
  `include/opinfo.h`**: iconProc@0x5C/parentProc@0x60/classReelEnt@0x64, letterProcs[10] inline@0x34,
  mod/div const 6, bound classReelEnt->unk_0C). **ClassInfoDisplay_Init** is DONE (opinfo LOCAL
  ClassReelEntJ struct + `gOpinfo_0` extern-bind @0x081F5900; several committed syms sit +4 past the
  asm literal because the gfx skip a 4-byte LZ77 header — bind distinct aliases at the TRUE asm addrs;
  `gUnk_4`@0x0200A2D8). STILL REMAINING in the cluster (same local-struct pattern, no opinfo.h edit):
  **ClassStatsDisplay_Loop** (permuter NEAR — see above), **ClassIntro_Init** (sub_80B77A4, ~11
  gUnkData data aliases — heavy).

## Serial-integrator tasks (1-step each, integrator-only — NOT parallel-safe)
- **StartEventBattle** (sub_8012038) — ONE instruction off: needs `include/functions.h:79` `isBallista`
  u8->s8 + `-mjp-promote`. The catch: that header change regresses the already-committed caller
  **Event3F_ScriptBattle**, which must be re-matched in the SAME commit (so the commit is atomic and
  `make compare` stays green). ZERO binds otherwise. Recipe was at `/tmp/StartEventBattle.c.recipe`
  (re-derive — `/tmp` is wiped between sessions).
- **PutUnitSpriteIconsOam** (sub_802758C) — C is correct + compiles + the .o has the right `rescuePalLut`
  .rodata, but those 6 bytes must land at 0x080DC940 which is inside the committed shared data residue TU
  `data_080DC8B0` (range 0DC8B0–0DC948). Splitting it shifts the .rom packing (+0x10 VMA). The integrator
  must split `data_080DC8B0` at 0DC940 and re-verify .rom packing in a single serial step — a worker
  worktree cannot land this without corrupting the shared residue.

## Cross-cutting VERIFIED facts (reuse across recipes)
- **JP shared callee addrs** (bind thumb if not in baseline_syms): Decompress=0x08013008, ApplyPalette=0x08000D68, Proc_Break=0x08002DE4, Interpolate=0x08012E84, Proc_Start=0x08002BCC, EfxCreateFrontAnim=0x080564F0, CpuFastSet=0x080D636C, CpuSet=0x080D6370, DivArm=0x080D6378.
- **JP gPlaySt base = 0x0202BCEC** (US 0x0202BCF0).
- **Stale-alias detection** (HIGH-VALUE, hit twice): a jp_syms/baseline `.set NAME,0x20xxxxxx` (EWRAM) whose function pool literal is `.4byte 0x08xxxxxx` (ROM) AND us_jp_funcmap says ROM-exact = STALE alias; fix the SOURCE fragment before carving any data-reader. Fixed `gUnk_12` (0xF7FF9A04→0x0201B100, in cfbind_worldmap_path.tsv) and `gSioMain2_1` (0x20013144→0x080DED3D, in cfbind_sio_teamlist.tsv) this session.
- **layout_frag.py `write` CLI BUG:** writing one task to one manifest DELETES that task's fragments in the OTHER manifests (write() iterates all MANIFESTS, drops rowless). When a carve needs BOTH carved_rom AND baseline fragments, do them in ONE `layout_frag.write()` python call, not two CLI calls (2nd wipes 1st → 16MB-overflow build).
- **Data-gap split:** function-local `u32* tbl[N]` AnimScr arrays in JP spawners land their rodata in carved data-gap TUs (e.g. `frontier_df4_misc_lo`) — split the INCBIN to free the exact bytes (see the carved StartSubSpell_efxMaohFlashEye*/Naglfar/Ivaldi for the pattern).

## Discord learning loop (REUSABLE — set up this session, user-authorized)
`scripts/discord_fetch.sh` (committed) — incremental, per-channel message-ID watermark, fetches NEW messages only (`--seed` for first run). Token at `~/.config/fe8j-decomp/discord.env` (chmod 600, OUTSIDE repo, `DISCORD_TOKEN=`, DCE auto-reads env). DCE binary at `~/tools/dce/`. Raw logs `docs/refs/discord/` gitignored (piracy boundary — distill into `docs/discord_findings.md` only).
- ⚠️ **The fetch loop is FIXED** (message-ID watermarks, `--seed`) **but the TOKEN IS INVALID** — the user's account is locked, password-reset pending. To resume mining, drop a fresh `DISCORD_TOKEN` into `~/.config/fe8j-decomp/discord.env`.
- The **6/23 message was about gba-kit** (macabeus's TypeScript GBA emulator) = **NOT applicable** to this decomp; already recorded in `docs/discord_findings.md`.
- Prior tool find: **Transmuter** (github.com/macabeus/transmuter — agbcc+Thumb+Claude-Code permuter rewrite; EVALUATE for the NEAR backlog). See `docs/discord_learning.md`.

## PROCESS (hard-won — do NOT relearn)
1. **Frontier = ground truth (`asm/sub_*.s` stubs), NEVER `layout/nofuncmap_*.tsv`** (10× stale, US-offset addresses).
2. **Full COLD `make compare` sha1 OK is the ONLY gate** (range byte-diff / sadiff are pre-screens; a failed .o prints a STALE "OK" — grep the build log for `error:`/`multiple definition` first). Then `check_selfcontained.py`.
3. **Carve INDIVIDUALLY, verify `git cat-file -e HEAD:src/<n>.c` after each commit** (git-add-abort + staged-deletion + cfbind-garbage traps broke HEAD before — see memory `fe8j-carve-regression-traps`). Never `pkill -f <pat>` matching your own command.
4. **Commit cadence:** one verified carve = one commit = one push. Bump `docs/frontier.md` + README scorecard whenever an axis moves.
5. **P10 posture:** delegate to background/worktree agents; keep the integrator (you) free — serial integration is the only non-delegable work.
6. **Integrator gate must be a FORCED-CLEAN rebuild** (`rm -f fireemblem8.gba fireemblem8.elf && make compare`) — a worker's incremental worktree OK can be a stale-OK artifact; and verify `nm src/<fn>.o` shows any static-inline'd helper as `U` not `T` (out-of-line-dup → 12.6M layout shift).
7. **CI INCIDENT LESSON (2026-06-24) — MANDATORY: any commit touching a SHARED header (functions.h/variables.h/struct header) OR cfbind/data-bind/data-residue MUST be gated with `make clean && make compare`** — **NOT** the warm `rm fireemblem8.gba fireemblem8.elf` form. WHY: the warm form keeps the warm `.o` cache and the Makefile has **no header-dependency tracking**, so a header change clean-build-BREAKS but the warm gate still passes → CI red. StartEventBattle's `include/functions.h` isBallista u8→s8 SHARED-HEADER edit did exactly this (12.7M-byte cascade, CI red twice → REVERTED). Always also run `gh run list` to watch the CI clean-build. **Re-land header-needing carves via a LOCAL prototype/struct in the carve TU (the opinfo `OpInfoEnterProcJ`/`ClassReelEntJ` pattern), NEVER a shared-header edit.** **StartEventBattle (sub_8012038) is currently REVERTED** and needs a local-prototype re-land (or first understand the u8→s8 0xA99-cascade), not another shared-header attempt.

## KNOWLEDGE (committed)
`docs/frontier.md` (SSoT + playbook + vein status), `docs/decisions.md` (D276/D276b/D276c flag), `docs/decomp-completion-standard.md` (4-axis honest framing + Code<Functions byte-weighting), `docs/agbcc_codegen_levers.md`, `docs/discord_findings.md`, `docs/fe8u_mining_findings.md` (data roadmap), `docs/tools/*`. Byte-level corpora: `../fireemblem8u` (primary), `../fireemblem6j` (efx reconstruction source — mind `s16/8`→`ldrh+lsrs`), `../FireEmblem7J`.

## Integration tooling
`scripts/calcprogress.py` (4-axis), `scripts/check_selfcontained.py` (cold gate), `scripts/autocarve.py`, `scripts/carve_recipe.py`, `scripts/permuter/permute.sh`. `make compare` is the oracle. `/tmp` is wiped between sessions — durable recipe state lives in worktrees + the transcript + `docs/refs/session_artifacts/`.
