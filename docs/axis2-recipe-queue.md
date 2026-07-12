# Axis #2 (matching-C) — 5 still-asm functions, ranked recipe queue

> **[UPDATE 2026-07-13 — axis-2 is now 5 still-asm (matching-C 99.94%, 8687/8692).]**
> `DecodeLinkArenaRecordHeader` (`sub_80A6D34`) landed after the serialized
> `DecodeAndVerifyArenaRecord` (`sub_80A6F1C`) promotion. The header decoder
> matched through FE6J/FE7J/FE7U cross-version block alignment plus P14
> two-address accumulator steering; owned scratch `9myLi` reports raw score 0
> with no match override and its registry row is retired.
>
> **[PRIOR UPDATE 2026-07-12 — axis-2 was 6 still-asm.]**
> `DecodeAndVerifyArenaRecord` (`sub_80A6F1C`) landed through D370 from the
> preserved `feat/axis2-compute-80a6f1c-copilot` history using paired halfword stack homes,
> phase-local r6/r9/r8/r4 aliases, and the fenced r1-to-r2 mask copy. h2W8F
> reports raw score 0 and its registry row is retired.
>
> **Prior five-function harvest:**
> The five harvest-first candidates are integrated on
> `release/axis2-harvest-five`: `sub_800E1FC/uVVvN`,
> `sub_807C8DC/gdTId`, `sub_80A3300/Br4VJ`,
> `sub_80A3528/vdXu7`, and `sub_80A6E4C/XOT5k`.
> ENay1/nlJVc/taZrH/MaiDT/g7FXU and those five community forks all expose raw
> score 0 upstream, and the exact registry rows are retired. The release also
> carries the `.rom`-section guard for shiftcheck debug relocations. See D369.
>
> **Current ranked queue (authoritative `src/nonmatching/*.c` set):**
> 1. `sub_80C05C8` — clean JP-vs-US coloring divergence; re-poll R7AaX before
>    trying exact pins (the prior blind r7/r6 pin attempt regressed).
> 2. `sub_800FAD0` — clean `-mjp-promote` register permutation; re-poll eZzgG,
>    then try scoped arg materialization/barriers learned from uVVvN/gdTId.
> 3. `sub_807D3BC` — spill/frame decision; test only exact ROM-derived pins or
>    basic-block boundaries, not broad pin swarms.
> 4. `sub_800A34C` — large whole-function coloring wall; try address-role reuse
>    and explicit phase boundaries before more permuter compute.
> 5. `sub_800A594` — sibling spline spill wall; lowest runtime ROI (dead root).
>
> Full linked `make compare` remains the gate. Re-poll every active registry
> family before local experimentation.

> **[HISTORICAL UPDATE 2026-07-11 — axis-2 was 12 still-asm.]**
> `DivinationRankSpriteUpdate (sub_80A2E64)` matched from score-0 `l4bts` via
> P13 pointer-role readback and was banked on current main.

> **[HISTORICAL UPDATE 2026-07-10 — axis-2 was 13 still-asm (matching-C 99.85%, 8679/8692).]**
> `AddAttr2dBitMap (sub_8001570)` and `Augury_InitResultScreen (sub_80A390C)`
> MATCHED byte-exact locally and are release candidates (D366). The former uses a
> zero-instruction `do { } while (0);` BB separator; the latter uses destination-field
> readback + equivalent branch polarity. Owned decomp.me families `ABitG` / `xYHce`
> expose effective score 0 via supported `match_override`, and their registry rows were
> removed only after upstream verification.
>
> **[HISTORICAL UPDATE 2026-07-07 — axis-2 was 15 still-asm (matching-C 99.83%, 8677/8692).]**
> `PrepareBattleGraphicsMaybe (sub_8057F80)` MATCHED byte-exact via community decomp.me fork
> **rtMN6** (TsilaAllaoui) and banked — see `docs/agbcc_codegen_levers.md` fork table (row 9) +
> the "pull & integrate / symbol-mapping gotcha" section in `docs/agbcc-matching-playbook.md §7`.
>
> **Community-harvest status (2026-07-07):** `scripts/tools/decompme/decomp_status.py` was run
> across all still-asm functions. **0 of the 15 have a score-0 decomp.me fork to harvest** — all
> are `DECOMP_THEN_UPDATE` (posted, unmatched). rtMN6 was the only free win available. Best
> remaining fork scores (lower = closer): **sub_80A6E4C 300** (fork XOT5k — a `_call_via_rN`
> veneer-register wall per its `src/nonmatching` header), sub_80C05C8 1410, sub_80A2E64 1945,
> sub_80A6F1C 2665, sub_80A6D34 3290, sub_80A3528 4070, sub_800E1FC 5281, sub_807C8DC 5841,
> sub_800A594 7613, sub_807D3BC 8821, sub_80A3300 10700, sub_800FAD0 11920,
> sub_800A34C 12152. Next free win = re-poll this queue (a new community fork
> appearing at score 0 is a zero-effort integrate); creating a new match is the compute/permuter
> path (`register asm("rN")` pins + §5a widen recipe), low-ROI per `docs/unmatched_functions_report.md`.
>
> **Applied-lever attempts (post-sub_8057F80, 2026-07-07):** tried the sub_8057F80 register-pin
> lever on **sub_80C05C8** (GmapScreen2_Loop — the cleanest "structure byte-exact, JP-vs-US
> coloring divergence" candidate): pinned the two node-coord temps to the ROM's r7/r6 via named
> `register s16` locals. Result: **WORSE** (252 insns vs 258 baseline vs 268 target) — the r6=node
> live-range conflict shatters the allocation, confirming the header's "blind/mismatched pins make
> it worse" and that this is a genuine agbcc JP-vs-US divergence (community fork SaCCn reached
> PROVEN-BOUNDED(2), not 0). Lever does NOT transfer; sub_80C05C8 stays permuter/community-bound.
> Lesson for step 4: the pin lever only crosses a **clean permutation** (same insn count, pure
> register renumber); it cannot add the redundant materialize-then-copy the JP build emitted here.

> **[SUPERSEDED 2026-07-03 — axis-2 is now 16 still-asm (matching-C 99.82%, 8676/8692); see [`frontier.md`](frontier.md).]**
> Six queue entries below have since **MATCHED byte-exact in-repo (banked, removed from
> `src/nonmatching/`)**: Event2F_MoveUnit (sub_800FF08), Event1B_TEXTSHOW (sub_800E5CC),
> ClassStatsDisplay_Loop (sub_80B8B28), LoadClassNameInClassReelFont (sub_80D1844),
> sub_80A73D4 (ArenaScoreboard_DrawRecord), sub_80A730C (DrawArenaRosterNames) — each marked
> `[SUPERSEDED]` inline / in the block at the bottom. The remaining **16** are the team-proven
> agbcc reg-coloring/spill walls (`src/nonmatching/*.c`), permuter-bound.

## Historical D307/W3 triage

Retained for provenance; the five-entry queue above is the current work list.

## HIGH-CONFIDENCE RECONSTRUCTS (clear asm body, do first)
- **#3 sub_80D17C8** (124B, classchg-sel): JP reads precomputed `gClassReelNameTable @0x089CF318`
  directly (no GetClassData). Full C in W3 report. +`-mjp-promote`, add `gClassReelNameTable`
  data alias. JP precomputed-class-name-table pattern (shared w/ sub_80D1844).
- **#8/#30 sub_80A73D4** (256B, divination): sequential PutNumber/PutNumberOrBlank, NO control
  flow — reconstruct directly from asm. EASIEST augury fn. — [SUPERSEDED 2026-07-03: MATCHED byte-exact in-repo, banked.]
- **#26 sub_800FAD0** (464B): fe8u eventscr.c NONMATCHING GetUnitDefinitionFormEventScr body +
  JP arg-sign (arg2 u8/lsrs, arg3/4 s8/asrs) + -mjp-promote.
  WIRING: sub_800FAD0 already HAS the `GetUnitDefinitionFormEventScr` baseline alias
  (0800FAD0, layout/baseline_syms.d/Event2C_LoadUnits-0e52685b.tsv) — carving must DROP that
  baseline alias (else multiple-def), not add a new one. (Consistent with src/nonmatching/sub_800FAD0.c line ~44.)
- **#9 sub_80BB240** (232B): ending_details defeat-text builder, msgids US-0x88, JP callees.
- **#10 sub_80BCD74** (244B): worldmap path-follow proc, 0x100/0x200 floor-quantize.
- **#11 sub_800FF08** (384B): Event2F_MoveUnit analog + -mjp-promote (watch subcmd dir order). — [SUPERSEDED 2026-07-03: MATCHED byte-exact in-repo, banked.]

## PERMUTER NEARs (stochastic; import nonmatching + glabel asm, patch -mjp-promote, run bg)
- #1 Event1B_TEXTSHOW (9B), #2 Event0F_CounterOps (r4r5 ~10B), #6 EfxAdvanceFrameLut (87/132
  branch-polarity), #7 sub_8084CE4 (8B spill-split lever), #5 LoadClassNameInClassReelFont (35B),
  #4 ClassStatsDisplay_Loop (slot-rotation, extract best-5 mutation from wt).
  — [SUPERSEDED 2026-07-03: #1 Event1B_TEXTSHOW, #5 LoadClassNameInClassReelFont, #4 ClassStatsDisplay_Loop
  MATCHED byte-exact in-repo (banked, removed from `src/nonmatching/`); #2/#6/#7 still open.]

## DEFERRED (plateaued reg-alloc walls / large reconstructs, lowest priority)
- RegisterTsaWithOffset, GmapScreen2_Loop, PutFaceOnBackGround,
  sub_800A34C (spline 534/584) and sub_800A594.
  — [`Event18_ColorFade`, `AdjustNewUnitPosition`, `sub_80A3300`,
  `sub_80A3528`, `sub_80A6E4C`, `AddAttr2dBitMap`,
  `PrepareBattleGraphicsMaybe`, `sub_80A2E64`, `sub_80A390C`, `sub_80A6F1C`,
  `sub_80A6D34`,
  and `sub_80A730C`
  have matched and are no longer queue entries.]

WIRING: carved fns drop their baseline alias from layout/baseline_syms.d/ (else multiple-def);
add NEEDS_ALIAS data entries (gClassReelNameTable etc.); fix cfbind garbage StartGmapAutoMu_Type1
(07E72DA4 -> 080C818C) before any EventA8 carve. make compare is the ONLY oracle.

## PERMUTER WALL RECORDS (D307/W17 adversarial-verifier, D308)
GENUINE agbcc-2.95 codegen walls, kept as descriptive asm (fe8u-NONMATCHING-equivalent):
- **sub_8084CE4** (120B): ~1.1M iters, best 795, **8-byte residual** = agbcc hoists the 0xff
  mask into a 3rd hi-reg (extra push/pop) vs JP inline `movs;ands` per iter. Structural wall.
- **sub_80BB240** (80B), **sub_80BCD74** (no-analog): W14-verified walls (fe8u-NONMATCHING-equiv).
Axis #2 literal-100% still needs a transmuter/compiler breakthrough for these (D277 proved
transmuter infeasible for pure reg-coloring).

### SUPERSEDED — recorded here as "irreducible" but since MATCHED byte-exact (banked to main):
- **Event1B_TEXTSHOW** (sub_800E5CC): the "best 35 / 6-byte residual / NOT source-fixable" call is
  RETRACTED — `int evArgument` (not `short`) makes stock agbcc reproduce the JP `ldrsh`, residual→0.
  Banked commit c74089494; decomp.me OqAJ4 SOLVED@0.
- **sub_80A73D4**: the "7290→4070 deep reg-coloring wall" call is RETRACTED — reconstructed directly
  (no control flow; the "EASIEST augury fn" of #8/#30). Banked byte-exact; decomp.me 6rBHq SOLVED@0.
- **sub_800FF08** (Event2F_MoveUnit): NOT a wall — matched byte-exact in-repo with `-mjp-promote`.
  decomp.me jeBp5 can't reach 0 only because decomp.me stock agbcc lacks `-mjp-promote` (documented
  there, non-SOLVED). Banked byte-exact.
- **ClassStatsDisplay_Loop** (sub_80B8B28): the "#4 slot-rotation / permuter base 3885→1450 NEAR"
  call is RETRACTED — MATCHED byte-exact in-repo 2026-07-03 (banked), removed from `src/nonmatching/`.
- **LoadClassNameInClassReelFont** (sub_80D1844): the "#5 best clean 25/140 / moving-pointer wall"
  call is RETRACTED — MATCHED byte-exact in-repo 2026-07-03 (banked), removed from `src/nonmatching/`.
- **sub_80A730C** (DrawArenaRosterNames): the augury-cluster "permuter NEAR (best 360)" call is
  RETRACTED — MATCHED byte-exact in-repo 2026-07-03 (banked), removed from `src/nonmatching/`.

## D312 — Event0F_CounterOps (sub_800DE3C): asr-fix → 1-swap NEAR (permuter candidate)
fe8u eventscr.c:476 body + the real JP divergence FIXED: COUNTER_SET uses an ARITHMETIC shift
(`asrs r3,r0,#0x18`) not the US logical shift — port as `newValue = (s16)argument >> 8`. With
that, the body byte-matches the JP target (size 0xB4, exact `mov ip,r2` prologue) EXCEPT a single
clean **r4↔r5** swap (JP: subcode-copy in r5 / shift in r4; agbcc colors inverted). `-mjp-promote`
on. register-pin `register u32 shift asm("r4")` moved shift to r4 but broke the prologue (worse).
The tightest NEAR in the #2 set → strong 1-shot permuter target with the asr-fixed body.
