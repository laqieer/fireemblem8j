# FE8J handoff — next-session entry point

**Read [`docs/frontier.md`](frontier.md) first: it is the sole current-state
source.** This file is a historical matching-campaign handoff; its dated SHAs,
denominators, and per-promotion metrics are retained as evidence, not live
progress. See also [`docs/maintenance.md`](maintenance.md).

> **[HISTORICAL FINAL REFRESH 2026-07-13 — matching campaign stopped.]**
> The campaign snapshot's `origin/main` was
> `5b35c7635a847b70cca70f4bff77418801a209b6`.
> This session byte-matched **11 functions**; the final A594 and C05C8 changes
> are proven nonmatching seed improvements, not promotions. Ground truth remains
> matching-C **99.95% (8688/8692, 4 still-asm)**, source-form code
> **899,408/901,428 bytes (99.78%)**, self-containment/data **100%**, and named
> symbols **100% (12688/12688)**.
>
> Final seed commits and publication evidence:
> - `sub_800A594`: `42a562774ce82b52ee20bcf19235c0543f4ef2e8`;
>   local 369/500 bytes and 208/250 halfwords, `PROVEN-BOUNDED(1)`,
>   `EQUIV 60/60`; exact-source/provenance `Sp10a` hosted score 8906 under stock
>   flags. CI/Pages run 29236425303 and secret scan 29236425357 are green.
> - `sub_80C05C8`: `5b35c7635a847b70cca70f4bff77418801a209b6`;
>   hosted R7AaX 480/local 230, exact 544-byte size, phase-1 spill removed and
>   phase/AP anchors exact, `PROVEN-BOUNDED(2)`; exact source/provenance active.
>   CI/Pages run 29237437754 and secret scan 29237437894 are green.
>
> The four remaining functions are:
> 1. `sub_800A34C` — score 60; real five-argument ABI/proof; active ABtKz;
>    sole costly-arg precompute/load-order residual; 46,080 targeted trees found
>    no lower candidate.
> 2. `sub_800A594` — local 369, hosted 8906; early `pts` allocator/scheduling
>    wall. Do not conflate the two toolchain metrics.
> 3. `sub_807D3BC` — local 550, residual 61/392, frame 0x90/size 392; active
>    J1ka1 hosted 10499 because stock decomp.me lacks `-mjp-promote`; compaction
>    matches, reject/register order remains.
> 4. `sub_80C05C8` — hosted 480/local 230; remaining allocator/scheduling
>    residual outside the solved spill/phase/AP anchors.
>
> **No matching/research work is in flight. Keep issue #165 open as the record of
> these four unmatched functions; do not redispatch without a new user order.**

> **[REFRESH 2026-07-13 — `sub_800FAD0` serial promotion.]**
> The repaired release history after the already-landed score-85 seed promotes
> `GetUnitDefinitionFormEventScr` from descriptive asm to matching C. P23 keeps
> arg2 direct, widens the fifth ABI argument to `int`, delays its `(s8)` local
> re-narrow, preserves the `[sp,#0x40]/[sp,#0x44]` stack homes, and steers the
> tail build-flag readback through r5. Linked range, normal/cold `make compare`,
> shiftcheck, check-nonmatching, CBMC (0/374), and 200-trial differential gates
> pass. Owned `eZzgG` exposes effective score 0 via `match_override`, and its
> registry row is retired. Ground truth becomes matching-C **99.95%
> (8688/8692, 4 still-asm)** and source-form code **899,408/901,428 bytes
> (99.78%)**, source-form data **100%**, and named symbols **100%
> (12688/12688)**.
>
> The remaining four are `sub_800A34C`, `sub_800A594`, `sub_807D3BC`, and
> `sub_80C05C8`. Do not redispatch `sub_800FAD0`, `sub_80A6D34`, or
> `sub_80A6F1C`.

> **[PRIOR REFRESH 2026-07-13 — DecodeLinkArenaRecordHeader serial promotion.]**
> The score-zero follow-up from `feat/axis2-compute-80a6d34-copilot`
> (`00b86b22d57e210ad59e9ac08f3052b57344c4a1` →
> `58fd4cf528a57b53f9889143fdfd6708b4cd96e7`) was transplanted onto the
> serialized mainline without duplicating the already-landed score-495 seed.
> Ground truth from `python3 scripts/calcprogress.py` is matching-C
> **99.94% (8687/8692, 5 still-asm)**, source-form code
> **898,944/901,428 bytes (99.72%)**, source-form data **100%**, and named
> symbols **100% (12689/12689)**.
>
> `DecodeLinkArenaRecordHeader` now matches through FE6J `func_fe6_08083180`,
> FE7J `sub_809E4D0`, and FE7U `sub_809DAB8` block alignment plus P14
> two-address r0/r2 accumulators, r1 delta/mask roles, and an r1 struct alias.
> The source retains the real calls and contains only empty lifetime
> constraints—no raw opcode or fake-call workaround. Owned scratch `9myLi`
> compiles at raw score 0 with no match override; its canonical function-payload
> SHA-256 matches the project source and its registry row is absent.
>
> The remaining five are `sub_800A34C`, `sub_800A594`, `sub_800FAD0`,
> `sub_807D3BC`, and `sub_80C05C8`. Do not redispatch `sub_80A6D34` or
> `sub_80A6F1C`.

> **[PRIOR REFRESH 2026-07-12 — DecodeAndVerify serial landing (D370).]**
> The complete linear history from `feat/axis2-compute-80a6f1c-copilot`
> (`6aa5f35faddd8b05df9d376ed91e93cf7956bd99` →
> `132c175371c1646c9ef9e8b9c3f6c339fcfbd90d`) was accepted on top of the green
> seed-v2 mainline without rewriting either commit. Ground truth from
> `python3 scripts/calcprogress.py` is matching-C
> **99.93% (8686/8692, 6 still-asm)**, source-form code
> **898,664/901,428 bytes (99.69%)**, source-form data **100%**, and named
> symbols **100% (12690/12690)**.
>
> `DecodeAndVerifyArenaRecord` now reproduces the JP frame-8 stack layout and
> compiler-selected `_call_via_r9` while retaining the real caller callback.
> The reusable source lever is paired `u16 tags[2]` halfword homes plus
> phase-local r6/r9/r8/r4 aliases, `int` helpers with only the first checksum
> narrowed, and a fenced r1-to-r2 copy for `0x3FF`. Full `make compare` and
> `make shiftcheck` (0 HIGH) passed. ARM SMT reports `PROVEN-BOUNDED(3)`,
> differential testing is EQUIV for 60/60 trials, and bounded shared-oracle
> CBMC reports 0/409 failures with both adversarial mutations refuted. Owned
> h2W8F reports raw score 0 and its registry row is absent.
>
> The remaining six are `sub_800A34C`, `sub_800A594`, `sub_800FAD0`,
> `sub_807D3BC`, `sub_80A6D34`, and `sub_80C05C8`. Do not redispatch
> `sub_80A6F1C`; D370 owns its exact-SHA main publication and CI closure.

> **[PRIOR REFRESH 2026-07-11 — combined five-function axis-2 candidate; not main.]**
> Branch `release/axis2-harvest-five` starts at current `origin/main` (which already
> includes `DivinationRankSpriteUpdate`) and preserves the six transplanted commits:
> five score-0 matches plus the section-aware shiftcheck fix from `feat/sub_800E1FC`.
> Ground truth is matching-C **99.92% (8685/8692, 7 still-asm)**, source-form code
> **898,452/901,428 bytes (99.67%)**, source-form data **100%**, and named symbols
> **100% (12691/12691)**.
>
> The harvested functions are `PutDivinationRankSprite`, `Event18_ColorFade`,
> `AdjustNewUnitPosition`, `DrawAuguryResultPanel`, and `EncodeLinkArenaRecord`.
> Owned ENay1/nlJVc/taZrH/MaiDT/g7FXU and community
> Br4VJ/uVVvN/gdTId/vdXu7/XOT5k all report raw score 0 upstream; the exact five
> registry rows are absent. Main's `gUnk_08A95478` alias is the only linked
> definition. `EncodeLinkArenaRecord` retains the caller callback and compiles to
> `_call_via_r3`; it contains no raw opcode asm. Shiftcheck now accepts ABS32
> records only from the linked `.rom` relocation section, excluding path-dependent
> `.debug_*` offsets without weakening genuine talk-table checks. The remaining
> seven are `sub_800A34C`, `sub_800A594`, `sub_800FAD0`, `sub_807D3BC`,
> `sub_80A6D34`, `sub_80A6F1C`, and `sub_80C05C8`. The candidate also includes
> issue #166 final-docs commit `2946f61e492b26ec047c4d272aebe047b0d063eb`
> with its full `+0x40000` evidence. See D369 for the combined release.

> **[REFRESH 2026-07-11 — issue #166 implementation complete on `origin/main`;
> final docs included in this release candidate.]**
> Integrated commit `2a49c9b8dcfefd8bec51cb66f425ebdee564fce5` passed a fresh
> `+0x40000` ROM-shift A/B: all four known OAM/AnimScr hybrids (**172
> frame-pointer words**) plus the empirical **27-section / 85-word** rescope
> moved exactly once, for **257 tagged words total** and **zero stale targets**.
> All **28/28** battle-animation consumer checks passed; the 14 intentionally
> unchanged non-pointer checks and unrelated floors are unchanged. The normal
> `make compare`, `make shiftcheck`, and true-debt audit gates are green.
> The banim/AnimScr residual is closed in the frontier (D368); do not redispatch
> it. Issue #166 remains open only until this documentation candidate lands and
> exact-SHA main CI passes.

> **[SUPERSEDED STATUS — `DivinationRankSpriteUpdate` is now on current main.]**
> Branch `feat/sub_80A2E64` harvests score-0 community fork `l4bts` from owned
> family `qksQG`. Ground truth from `python3 scripts/calcprogress.py` is
> matching-C **99.86% (8680/8692, 12 still-asm)**, source-form data **100%**,
> and named symbols **100% (12692/12692)**. The reusable lever is **pointer-role
> readback/lifetime preservation**: reuse one `data` pointer for the sine-table
> reads, commit the next IV before the branch split, pin the affine results to
> r6/r5/r4, and use two zero-instruction `+r` fences after `Div` so agbcc keeps
> the JP live ranges under `-fno-gcse`. The real project source contains no
> decomp.me `.set` scaffolding or raw opcode asm. `qksQG` and `l4bts` both expose
> raw score 0; only then was the exact registry row retired. Its candidate gates
> passed and the work is now banked on current main. See D367.

> **[SUPERSEDED STATUS — 2026-07-10 13-function snapshot; later banked.]**
> Ground truth from `python3 scripts/calcprogress.py`: self-containment **100%**,
> matching-C **99.85% (8679/8692, 13 still-asm)**, source-form data **100%**
> (strict C/PNG subset 79.91%), named **100% (12721/12721)**.
> `AddAttr2dBitMap` (`sub_8001570`) and `Augury_InitResultScreen` (`sub_80A390C`)
> are byte-exact candidates. Their reusable levers are respectively (1) a
> zero-instruction `do { } while (0);` BB separator that flips callee-save copy
> order, and (2) destination-field readback plus equivalent branch polarity.
> This **retracts the prior AddAttr “permanent/irreducible save-order ceiling”**
> wording. decomp.me families `ABitG` / `xYHce` were closed upstream with the
> supported matched-elsewhere override (effective score 0) before registry-row
> deletion. Integrator/main CI remains the final publication gate; see D366.

> **[REFRESH 2026-07-04 — live roadmap now tracked as GitHub issues; SSoT for numbers = `calcprogress.py`.]**
> **HEAD `474a72c6f`, main GREEN** (`make compare` OK + `make shiftcheck` 0 HIGH). This session's work is
> banked; the remaining frontier is now tracked as durable GitHub issues (read these first next session):
>
> - **#143 [epic] True shiftability (the autopilot objective).** A +0x40000 shifted ROM boots → title →
>   **main menu byte-identical to vanilla**; just banked the `ProcScr_Mu*` / MU state-func cluster
>   (`474a72c6f`, hex→relocatable typed data in `frontier_df4_banim_b.c`). **False-floor insight (D345):**
>   `make shiftcheck` reports "floor" but CANNOT see function/data pointers buried in opaque
>   `.bin`/`.incbin`/hex — a shifted ROM crashes on the first un-relocated one. The precise proc-script
>   **menu** blocker list (config/guide/support/chapter-intro) is **D346's 11** (re-verify each via the
>   gba-kit harness, residual→0). Critical path: carve those 11 + other non-family residual `ProcScr_*`,
>   then re-run boot/play smoke. Reusable shift harness: `/home/laqieer/fe8j-wt-143/`
>   (`build_shifted_rom.sh`, `boot_smoke.sh`, `play_smoke.sh`) + `build/issue143-proof/gbakit-harness/`.
>   **Current correction (D368/#166):** that historical estimate is not the live
>   banim/AnimScr work list. The empirically rescoped banim residual is now
>   complete (257/257 tagged words shifted, zero stale); only
>   [`docs/frontier.md`](frontier.md) defines remaining work.
> - **#145 [epic] fe8u→fe8j asset-form alignment (the meta-lever).** Reframe: **A (playable shifted ROM) ⊆
>   B1 (ALL pointer-bearing degraded assets)** — the proc-script family is only ONE slice of B1. B1 =
>   shiftability-critical (bin/incbin/hex holding un-relocatable jump/callback/anim/OAM/event/menu/AI
>   pointers) → carve to relocatable typed C; B2 = non-pointer degraded (pixels/values) = editability-only.
>   Diff fe8u FORMS by symbol name via `layout/us_jp_funcmap.tsv` + `layout/addr_map.tsv` (JP≠US addrs).
> - **#144 [infra] CI/Pages/metrics perf.** Consolidate Pages INTO `ci.yml` (one build, main-only, skip
>   PRs, delete `pages.yml`); speed up `gen_pages.py` (`nm -l` 27min → `objdump --dwarf=decodedline`+`nm -n`
>   JOIN) and `calcprogress.py` (batch nm, `progress.txt` byte-identical). **REVERT the bad cron in
>   `ae660367d`** — the deploy-race fix is execution-time optimization, NOT `cron`/`cancel-in-progress`.
> - **#146 [code] Name symbols toward 100%** via fe8u correspondence (byte-neutral; `banim_*` already
>   carry fe8u's canonical names — do not rename; never invent JP-unique names).
>
> See **D345/D346** (false-floor + the 11-blocker family) and **D347** (this session's roadmap + CI decision).

> **[SUPERSEDED 2026-07-03 axis snapshot; SSoT = [`frontier.md`](frontier.md).]** Then-current
> ground-truth (calcprogress): self-containment **100%**, matching-C **99.82% (8676/8692, 16 still-asm)**,
> source-form data **99.31%** (strict C/PNG subset 79.91%), named **95.53%**. Since this 2026-06-24
> handoff, **6 of the NEAR/wall fns named below MATCHED byte-exact in-repo (banked, removed from
> `src/nonmatching/`)**: Event2F_MoveUnit, Event1B_TEXTSHOW, ClassStatsDisplay_Loop,
> LoadClassNameInClassReelFont, sub_80A73D4, sub_80A730C. The `## State`/in-flight blocks below are the
> 2026-06-24 mid-session snapshot (append-only history).

## State (HEAD clean, `make compare` → OK, self-contained YES)
- **HEAD `8dbb4a64b`** (run `git rev-parse --short HEAD`). **main GREEN, self-contained 100%.**
- BUILD SELF-CONTAINMENT **100%** · **MATCHING-C 98.15% (8370/8528, ~158 left)** 🎉 crossed 98% · EXTRACTED-DATA 100% · NAMED 85.36% (capped ~96%).
- This session banked **+33 net matching-C** (8337→8370) — full per-carve list in `docs/frontier.md` (the SSoT). Highlights: the agbcc-ceiling closure (knobs/levers/transmuter all empirically 0), 4 productive reconstruct veins (SJIS text / proc-name-self-ID efx / msgid-shift link-arena-sio / JP-only leaf clusters), and **+8 recovered from stranded worktree branches**.
- 🚨 **INTEGRATOR LOOP (critical, cost +8 nearly-missed): re-scan ALL `worktree-*` branches for committed-but-unpushed carves, not just `origin/feat/*`.** Workers commit incrementally to their own branch. Loop: `git worktree list` → `git log origin/main..<br>` → filter REAL (the branch's dropped asm/sub_*.s is STILL on main) vs DUP (already deleted = already carved) → merge real + forced-clean gate + push. Run it every few minutes as the fleet carves.
- 🏁 **HISTORICAL MILESTONE (superseded in part):** the 2026-06-24 batch/lever set was exhausted, but its “ONLY path / likely permanent asymptote” conclusion was too strong. `AddAttr2dBitMap` later matched through a zero-instruction BB separator and `Augury_InitResultScreen` through destination readback + branch polarity (D366). Preserve measured negative results, but do not promote them to proof that no materially new source-shape lever exists.
- ⚙️ **NOW (ultracode): a 14-agent triage Workflow (`fe8j-remaining-triage`) is classifying all 207 still-asm fns into carveable-vs-residual + recipes** → feeds the warm-worktree fleet to carve every carveable one to exhaustion.
- 🔑 **TWO PRODUCTIVE RECONSTRUCT VEINS opened this session:** (1) **SJIS/text** — JP copies 2-byte Shift-JIS chars where fe8u copies 1 byte; the natural `*dst++=*src++` idiom matches JP reg-alloc (StrInsertTact; recon-worker mining more). (2) **proc-name-string self-ID** — JP-only ProcScr procs identified by their embedded name string in ROM (efxLuce/efxDrsmmoya proved it; archaeologist scouting link-arena/name-entry/augury).
- 🟧 **SPILL-SLOT/REG-ROTATION NEAR backlog** (structurally-correct reconstructs blocked by an agbcc frame-layout tiebreak the DEFAULT permuter plateaus on): ClassStatsDisplay_Loop (/home/laqieer/fe8j-wt-class), AdjustNewUnitPosition (/home/laqieer/fe8j-wt-anup), Event18_ColorFade. **UNLOCK = the transmuter** (reg-alloc-aware permuter, task #15, queued) — deploy as a BATCH when N accumulate; do NOT keep throwing 15k default runs. — [SUPERSEDED 2026-07-03: ClassStatsDisplay_Loop MATCHED byte-exact in-repo (banked); AdjustNewUnitPosition/Event18_ColorFade still open.]

## IN-FLIGHT (background fleet, dispatched this session)
- **seb-worker** → efxLuceBGCOL pair (sub_8067040 + sub_8067160, JP-only efx) · **sio-worker** → HandleTurnRecordText (sub_80BC2A4, msgid subs) · **colorfade-worker** → ColorFadeSetup×4 (one permuter → +4) · **recon-worker** → SJIS/text vein hunt · **anup-worker** → sub_8046924 (link-arena reconstruct) · **archaeologist** → proc-name string-scan (final analysis pass).
- Integrate each pushed `feat/` branch serially: forced-clean gate for new TUs, full `make clean && make compare` + CI watch for old_agbcc/cfbind/shared-type/m4a/layout changes.

## DETACHED PERMUTERS still running (may have cracked a NEAR late)
Check `nonmatchings/<Fn>/output-0-*` for a zero-score solution before deferring these:
**Tactician_InitScreen** (1-instr, base 320→125), **SelectSummonPos**, **ClassIntro_Init**, **AdjustNewUnitPosition**. If `output-0-*` exists, extract the mutation (diff `source.c` vs the near-match), apply to a clean `#include` version, carve.

## THE FRONTIER — clean-recipe vein EXHAUSTED, ~193 remain — 3 BUCKETS
Even the 'self-cert leaves' (EfxAdvanceFrameLut + AddAttr2dBitMap) matched the fe8u ELF but not JP
under the then-tested shapes (compiler-config PROMOTE/CSE/reg-pressure divergence).
**[SUPERSEDED for AddAttr2dBitMap 2026-07-10: now byte-exact via a zero-instruction BB separator.]**
The historical remaining ~193 fell into 3 buckets:

### (a) agbcc config-ceiling NEARs — HIGHEST-LEVERAGE UNLOCK (do this first)
Functions that match the **fe8u ELF but not the JP ROM** via **register-save-ORDER** / **cross-jump-MERGE** /
**register-PRESSURE-r7**.
- 🟥 **cross-jump: shipped as a config knob but ZERO FE8J yield — DO NOT USE.** Shipped `-mjp-nocrossjump`
  (commit 3eda1d23d, bit 0x40000, gates jump_optimize cross_jump OFF at toplev.c:3143; default-OFF
  byte-identical; full make compare + CI green). **Empirical compile-and-diff over all 16 nonmatchings/ +
  5 asm scans: the knob NEVER reduces the diff (5 WORSE, 11 no-change, 0 improved); it makes EfxAdvanceFrameLut
  WORSE (128→138).** JP is ALREADY the merged/cross-jumped form, so the knob (which separates tails) can only
  diverge. **Never add `-mjp-nocrossjump` to any TU's CC1FLAGS.** Kept as harmless default-OFF dormant infra
  (revert deferred to cleanup — see D277). `-mjp-regorder` is ALSO empirically zero (worsens its own exemplar
  AddAttr2dBitMap 10→12). **EfxAdvanceFrameLut (sub_8056890) = CONFIRMED CEILING, do NOT retry:** the JP-shape
  reconstruct (single signed `int` frame, return it directly) reaches 136B vs JP 132B but 2 residual diffs
  (load-order reg-alloc tiebreak 0B + cross-jump tail-merge +4B) are unreachable by any lever. Leave as the
  stub (best reconstruct saved /tmp/efxadvance_best_reconstruct.c).
- 🟥 **register-PRESSURE-r7 (SioBat_SetupLoop +48B; AddAttr2dBitMap was 2 halfwords):** the allocator
  diagnosis described the symptom, but AddAttr's “algorithmic/permanent” conclusion is **SUPERSEDED** —
  a zero-code BB separator changed the save order and matched it. SioBat status is unchanged.
**Do NOT keep throwing multi-hour permuter runs at this class** (one run burned ~7h for 0).
**REFUTED:** the "extend the patch → unlocks a WHOLE class" thesis held for PROMOTE (s8/s16-hold + arg-order)
but NOT for cross-jump (one-off) or reg-pressure (algorithmic). The genuine-ceiling tail is **SMALL and
dominated by int-widen-fixable + reconstruct**, not config-knob-forceable (see memory `jp-agbcc-config-ceiling`
D2026-06-25). **HIGHEST-LEVERAGE NOW: the int-widen vein** (retriage-researcher sizing it) + reconstructs.

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
    scratch + zeroFlag re-materialize); KEEP the case-3 inline-asm trick. WIP in `_permwork/*.wip`. — [SUPERSEDED 2026-07-03: MATCHED byte-exact in-repo (`int evArgument`), banked.]
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
  reg perm) — see their entries above. [— SUPERSEDED 2026-07-03: Event1B_TEXTSHOW since MATCHED byte-exact in-repo, banked; Event0E_STAL/AdjustNewUnitPosition still open.] The worktree permuter is parallel-safe (3 workers -j4, no OOM)
  with the documented import.py-direct + compile.sh `-mjp-promote` two-step plumbing.
- **HandleTurnRecordText** @sub_80BC2A4 — permuter/codegen-NEAR (44B short): y/textIndex r4/r8-vs-r6/r9
  reg perm + tilemap-col factoring. Codegen-shape NEAR (not a const fix). Permuter campaign target.
- **ClassStatsDisplay_Loop** @sub_80B8B28 — permuter/codegen-NEAR (one of the 0x80B OpInfo cluster, local-
  struct pattern, NO opinfo.h edit): JP REVERSES the gauge-pip loop + spills i+1/&unk_34/&unk_35 each outer
  iter, ~121 opcodes diff, permuter base 3885->1450. Needs a loop-direction/spill lever or stronger profile. — [SUPERSEDED 2026-07-03: MATCHED byte-exact in-repo (banked), removed from `src/nonmatching/`.]
- **OpInfo cluster — 2/5 DONE (2026-06-24).** **ClassIntro_LoopOut** is DONE (carved via a LOCAL
  OpInfoEnterProcJ workaround struct — JP opinfo procs use local structs, **NEVER edit shared
  `include/opinfo.h`**: iconProc@0x5C/parentProc@0x60/classReelEnt@0x64, letterProcs[10] inline@0x34,
  mod/div const 6, bound classReelEnt->unk_0C). **ClassInfoDisplay_Init** is DONE (opinfo LOCAL
  ClassReelEntJ struct + `gOpinfo_0` extern-bind @0x081F5900; several committed syms sit +4 past the
  asm literal because the gfx skip a 4-byte LZ77 header — bind distinct aliases at the TRUE asm addrs;
  `gUnk_4`@0x0200A2D8). STILL REMAINING in the cluster (same local-struct pattern, no opinfo.h edit):
  **ClassStatsDisplay_Loop** (permuter NEAR — see above; [SUPERSEDED 2026-07-03: MATCHED byte-exact in-repo, banked]), **ClassIntro_Init** (sub_80B77A4, ~11
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
