# FE8J decomp — session handoff / autonomous-loop state

**Read this first.** Living state for the autonomous drive toward the final goal
(every byte of `asm/baserom.s` incbin replaced by real source; `make compare` →
`fireemblem8.gba: OK` from real source). Keep it current; any continuing/driven session uses it. (The `auto_drive.sh`
cron was DISABLED 2026-06-08 — see decisions.md D8; the launched agent kept
getting SIGTERM-killed mid-task and the frontier is now region-different.)

## Verified state (update each working stretch)

- **SPRINT 2026-06-09 (P9 fan-out, interactive MCP session) — DATA FRONTIER COMPLETE (84.89%
  -> 100%, +1.71MB), functions 1323 -> 1329 (+6), pushed `02fc9e5`.** Ran as a rolling worktree-
  isolated P8 team. **The data front (94% of the ROM) is byte-perfect DONE** — df2/df3/df4 cleared every
  real data gap via `scripts/carve_frontier.py` (table/frame_arrays/blob/data_gaps modes); 0 data gaps
  remain. JP physically carries ~463KB MORE data than the US-decomp total (region-different glyphs/tables/
  layout), so the raw metric hit 103.49% — `calcprogress.py` now caps the data % at 100 (display-only;
  true carved bytes 13748514 still printed; `make compare` sha1 is the oracle).
  - **CODE FRONT — recon CORRECTED its nature (overturns "mechanical exhausted at 306"):** the 767KB / 279
    uncarved code gaps are NOT mostly region-different. Real split (funcmap ⊗ carved, offset-bug fixed):
    **A = ~1506 region-SAME functions / 87KB mechanically carveable** + **B = ~158KB / 11 TUs genuinely
    region-different (RE)**. The mechanical layer was HIDDEN by (i) a VRAM-vs-ROM-offset unit bug in the gap
    script and (ii) D2's run-only carving — `find_runs` only carves contiguous whole-block runs, so exact
    functions STRANDED between region-different neighbors get skipped (e.g. bmbattle.c: 36 mapped fns, only
    1 run carved). **No port_run failure class remains** (addend/EWRAM/multiple-def all fixed). Priority:
    **(1) A1-exact 727 fns / 28.6KB** — funcmap-`exact`, JP bytes uniquely match US (verified
    GetBattleUnitHitCount JP@0x2AFF0 = US all 18B), RE risk ~0; carve PER-FUNCTION (1-fn runs via port_run,
    bypassing D2's run limit — exact layer has no false-positive risk) for +function metric (1329 -> ~2056).
    In flight as `carve/exact-layer` (fragment-based). **(2) A1-masked 616 fns / 40.3KB** — pointer rebind.
    **(3) B-class 11 TUs** (RE): banim-efxmagic-aura/-gespenst/-refresh, banim-main, classdisplayfont,
    code_8086934(done), eventfx-stoneshatter(partial), events_script, main, msg + 9 unported code TUs/8.5KB.
    The 51 "unported US TUs" are mostly (42) 0-.text data files (data already 100% carved); only 9 have code.
  Earlier rolling-
  isolated P8 team, lead serial-integrated each delivery (see decisions.md D19). Landed on main:
  - **Recursive `carve_data_refs.py` (fixed) — +41.6KB / 457 region-different objects.**
    Two-pass deterministic sizing: PASS 1 accepts only 4-aligned real object starts
    (rejects Thumb-pointer/spurious literal matches), PASS 2 sizes by interior-pointer
    ABSORPTION (a later object strictly inside [O, O+us_size) is a sub-field alias, folded
    into O for its exact JP size) capped by the next real object — no more US-size-cap
    overlaps. Now **fragment-safe** (rows -> `layout/carved_rom.d/data_refs_recursive.tsv`;
    carved-set unions monolith + all OTHER task fragments via `layout_frag.read_all`),
    idempotent, `sh_addralign==1` (no ld pad). `--min` lowered 256->64 (yield is many small
    region-different structs: gFontgrp/voicegroup/UnitDef_*/EventScr_*/Ch*Events). **CEILING
    of this method: ~41.6KB** — the big ~2MB graphics are UNREACHABLE (leaf graphics are
    unnamed US symbols, so no code pointer names them; need a per-subsystem pointer-table
    carver — wave-2 in flight as `scripts/carve_graphics_subsys.py`).
  - **`code_8086934` hand-decompiled (+3 fns).** Region-different CODE is now carvable in an
    interactive MCP session. The 3 JP funcs @ 0x8086900/0x8086918/0x80869B0 are US
    `eventinfo.c`'s CheckFlag82/GetBattleQuoteEntry/GetDefeatTalkEntry (NOT the US filename
    `code_8086934.c`'s sepia fn — **derive US<->JP by call-graph, never by filename**).
    They are instruction-isomorphic to US, differing only in 4 pointer literals resolved by
    baseline_syms binding at JP addrs (gBattleTalkList 0x08A5E7E0, gDefeatTalkList 0x08A5EE70,
    GetEventTriggerState, BattleIsTriangleAttack). LESSON: a "region-different no-run" TU can
    still be pointer-only-different once correctly LOCATED + ATTRIBUTED — check before
    assuming logic-different.
  - **RE toolchain confirmed live + method:** IDA MCP (`idb_open` fe8j.i64, `decompile`/
    `disasm`/`func_query`/`xrefs_to` with project symbols resolved) + Ghidra MCP. Pin a
    region-different fn by **xref from a ported neighbor** (e.g. bindingblade's
    efxHurtmutOBJ_Loop = JP sub_805D038/186B, the unique caller of NewEfxArrowOBJ@0x805d0f4).
    Use the SHARED IDA MCP worker for concurrent RE agents; do NOT run headless
    `decompile_addr.py` concurrently (exclusive .i64 lock). Reaped 16 leaked idalib workers
    (1.4GB) that held the sidecar lock and blocked `idb_open` — **reap stale idalib_server
    workers at session start** (kill by PID, not `pkill -f idalib_server` which self-matches).
  - **data_bg graphics carved +644KB (data ->90.17%)** via new `scripts/carve_graphics_subsys.py`
    (SUBSYS registry: follow the JP index table `gConvoBackgroundData`@0x089CD958 + ROM-scan for a
    JP-only secondary table @0x089CDBE0 + gap-subtraction vs already-carved). REUSABLE for any
    table-indexed graphics subsystem.
  - **RE wins (all byte-perfect, durable):** code_8086934 (+3 — actually eventinfo.c's CheckFlag82/
    GetBattleQuoteEntry/GetDefeatTalkEntry by call-graph, pointer-only once correctly located);
    bindingblade (+2 — genuinely logic-different: JP drops NewEfxSpellCast, ballista hit-seq, SFX
    0xCC vs US 0x10D; 2-byte residual solved deterministically by splitting a nested `if` so agbcc
    coalesces `duration` into r4; TU = [0x805D000,0x805D0F4) = 2 fns not 5); stoneshatter
    StoneShatterEvent_OnEnd (+1). **StartStoneShatterAnim @0x08012DB4 is TRUE region-different
    codegen** — US's own agbcc can't reproduce JP's sign-ext scheduling (12+ variants, ~30k permuter
    iters @ score 755); PARKED with a reusable permuter scaffold in `nonmatchings/StartStoneShatterAnim`.
  - **BANIM MIRAGE CORRECTED (important):** the old "~2.5MB region-different graphics: banim OBJ
    sprites 0x085D9C5C 1.53MB" is a **US-ADDRESS MIRAGE**. In JP that address holds different
    (mostly-carved) content; the actual JP banim blob `0x08C02000-0x08E47180` (2.38MB) is **ALREADY
    carved** region-same (`data_banim`, indexed by `banim_data`@0x08C00008, 1005 ptrs all inside).
    **NEVER chase US addresses for JP boundaries** — derive from the JP ROM + a gap analysis.
  - **REAL DATA FRONTIER (global FF-aware gap analysis, the SOP to find it):** ~1.9MB uncarved
    non-padding data, **SCATTERED** across ~30+ medium regions — NOT one big block. Largest single is
    only 105KB @ 0x0877BBB8; then 0x0817B398 (83KB), 0x08B27970 (79KB), 0x0859D4FC (109KB/59KB-real),
    0x08A84BFC (54KB)... Carve per-region: identify via nearest `sym_jp.txt` symbol + IDA xref ->
    derive JP boundary -> named incbin (gap-subtraction). In flight (carve_graphics_subsys/carve_frontier).
    SOP probe: union carved_rom.tsv+carved_rom.d/* vs baserom, report gaps that are <97% 0xFF and >5%
    non-pad, sorted by real bytes -> the largest real uncarved region each session.
    **DONE so far:** data-frontier-2 carved the 7 biggest regions +547KB (data ->94.29%) via the new
    reusable `scripts/carve_frontier.py` (3 modes: `table` = follow JP ptr table gaplessly; `frame_arrays`
    = scan consecutive ptr arrays for frame bounds; `blob` = named blob when no in-window index). Located
    via JP tables (gChapterDataAssetTable@0x08907BC8, chap_title_data@0x08A732C0 [JP uses all 3 ptr fields
    vs US 1], ImgArray_AuraBg3@0x08601930) / named-symbol bounds — never US addrs. **~1.43MB long-tail
    remains** (~300 mid/small blocks; in flight as data-frontier-3). The 247K 0xFF run @0x08BB8E94 is REAL
    padding — gap analysis correctly excludes it; never carve it.
    **data-frontier-3 then blob-carved 12 subsystem windows / 164 blobs +456KB (data ->97.72%)** (fontgrp/se,
    voicegroup, banim art, unitdef, opening gfx, eventscr, btl_bg, ending, title screen, unit icons).
    **CRITICAL DISCIPLINE:** the remaining ~1MB raw frontier splits into ~467KB DATA (finishable, df4 in flight)
    + ~540KB region-different CODE (thumb-prologue heads between carved `.text` objects — RE P8's `src/`
    domain). **NEVER carve a code gap as a data blob** (inflates the metric + blocks RE). Classify each gap
    code-vs-data (thumb-prologue head byte / IDA function-at-addr / `.text` bracket) before carving.
- **DATA FRONTIER (2026-06-08) — data carved 0.05% -> 58.58%, symbols 3.8% -> 15.96%,
  478 objects, ROM ~47% carved (gen_layout), all durable.** Data is 94% of the ROM
  (13.3 MB). Three harvesters now capture region-same data mechanically:
  - `scripts/carve_data.py` — region-same-at-same-offset named objects (banim subsystem).
  - **`scripts/carve_data_shifted.py`** — the big one: data that is byte-identical to US
    but RELOCATED by a constant per-object shift (localized content earlier changed
    size). KEY: a block byte-identical at a shift is necessarily POINTER-FREE, so the
    full-block-match-at-shift gate self-selects exactly the opaque assets (sound,
    graphics, sprites) and never a pointer table. find_shift = majority vote over 24
    chunks; full-object match -> one carve; PARTIAL match -> carve the matching per-symbol
    runs, leave region-different islands in incbin. **Carved direct_sound_data (3.27 MB,
    439 M4A samples), data_portrait (637KB), banim-ekrdragonfx (410KB), mapanim_eventcall
    (191KB), + hundreds more.** GOTCHA: incbin sections sit at exact (often non-4-aligned)
    JP addresses — emit NO `.align` or ld pads -> ROM growth -> sha1 fail.
  - tier-2 region-different ASSETS with table-pinned boundaries (data_banim_pal).
  Remaining data is genuinely region-different (text/localized tables/pointer-bearing) —
  tier-3 (real C w/ JP values) — plus unidentified region-same blocks (incbin in US too).
- **PER-SYMBOL SHIFTED CARVER — `scripts/carve_data_persym.py` (2026-06-08):** some
  objects (banim OBJ sprites, opening gfx, chapter maps, ending CG, ...) hold sub-assets
  relocated in INDEPENDENT groups at different JP shifts, so the per-OBJECT shift misses
  most. Per-symbol: find each US data symbol's OWN JP location (unique 64B chunk in a
  +-3MB window + full-content verify), group consecutive same-shift matching symbols into
  runs, carve each run. Carved banim sprites (1.27 MB), data_opanim_gfx (334KB), ending_cg
  (216KB), const_data_chapter_maps (233KB), unit_icon_move (205KB), worldmap_gmapunit
  (180KB), data_btl_bg, + more. GOTCHAS: (1) emit asm in memory, write only at the end —
  the search can time out and mid-loop writes leave orphan .s files the Makefile wildcard
  then fails on; (2) window the search or it scans 16 MB/symbol and times out; (3) run it
  TARGETED on big contiguous data objects (scattered code-rodata objects have huge
  union-spans -> slow); (4) no `.align` (non-4-aligned addrs -> ld pads -> ROM growth).
- **PER-SUBSYSTEM RE WORKS — carved msg_data 395KB (2026-06-08).** The genuinely-region-
  different data IS carvable: find the JP code that references the data's table, read the
  table from the JP ROM, derive the boundary. For msg_data (JP message text, 3339 msgs vs
  US 3404): `GetStringFromIndex` (JP 0x08009FA8) loads `gMsgTable` from a literal → table
  JP 0x0814D08C; the JP table's entries end exactly where carved const_data_chapter_maps
  begins (0x081504B8); min table pointer = block start (0x080ED7F4). Carved
  [0x080ED7F4,0x081504B8) as named incbin. **This is the template for the remaining
  region-different DATA — repeat per subsystem (find table ref in code → derive boundary).**
- **PADDING (2026-06-08): 873KB of the "uncarved" is 0xFF `__end__`/inter-section padding**
  (incl. the 611KB @ 0x08E47180 and 241KB @ 0x08BC3A00 blocks I'd called "unidentified").
  It's NOT authored data, NOT in the US data denominator, and already byte-perfect via the
  incbin + objcopy --gap-fill=0xff. Do NOT "carve" it as data (would inflate the metric);
  leave it. Real remaining authored data is ~3.5 MB.
- **SYSTEMATIC region-different carver — `scripts/carve_data_refs.py` (2026-06-08).**
  Generalises msg_data: for each US->JP funcmap-mapped function the bodies are byte-identical
  except wildcarded POINTER literals, so a literal at offset k references the same object in
  both — US word names it, JP word gives its JP address. Scan every mapped function's
  literals; a pointer that DIFFERS US<->JP names a region-different object and reveals its JP
  address (size = US size capped by next discovered JP addr). Carved 70+ IDENTIFIED tables:
  **gCharacterData, gChapterDataTable, gItemData, gSupportTalkList, gSoundRoomTable,
  TextGlyphs_System/Talk, gUnitLookup, UnitDef_*, EventScr_*, gGfx_OpSubtitle_*** ... → data
  83.6%->84.37%, symbols ->28.32%. Identified data at code-read JP addresses (D10-legit).
  **NEXT LEVER (high value, WIP): make it RECURSIVE** — each carved table is itself a
  US<->JP aligned region whose pointers reach the graphics; re-scan carved regions to cascade
  (tables -> char/item/chapter graphics). Tried it (found +33 event-scripts/unit-defs) but the
  US-size-capped boundary caused section OVERLAPS -> link error; needs exact per-object JP
  sizing (use the NEXT object's jp_addr as the hard end, don't also cap by US size; resolve
  overlaps before emit). This is the path to most of the remaining ~3 MB graphics.
- **CEILING for region-same mechanical (2026-06-08): data 84.37%, ROM ~68% carved, 1369
  objects, all durable.** Region-same (same-offset + per-object/per-symbol shift) is
  exhausted; region-different DATA carved via per-subsystem RE (msg_data) + the systematic
  code-ref carver (above). Remaining ~32% of the ROM:
  - **Region-different graphics (~2.5 MB):** banim OBJ sprites (0x085D9C5C, 1.53 MB),
    data_bg (0x088D2700, 557 KB), etc. Verified NOT neighbor-pinned (they sit in
    shifted-layout regions, so the US boundary is not the JP boundary) and NOT shift-
    matchable (JP art genuinely differs, often LZ-compressed differently → different
    size). Carving needs the JP boundary derived per-subsystem (decompress / follow JP
    pointer tables), then JP-byte incbin under US names. Do NOT assume US boundaries.
  - **Region-different structured tables** (msg_data 481 KB text, etc.): real C with JP
    values.
  - **Region-different code (~743 KB):** headless RE per function (scripts/ida/
    decompile_addr.py) — slow craft, uncertain convergence.
  - Negligible: 1 neighbor-pinned 16 KB object (data_FE0000), unidentified region-same
    blocks (922 KB @ 0x08EF9454, 247 KB @ 0x08BC3A00 — incbin in US too, left as-is).
  These are honest multi-session frontiers; the easy mechanical carving is exhausted and
  100% cannot be reached by relabeling without crossing the D10 integrity line.
- (historical) The banim data subsystem carved first → data 18.67%:
  - region-same structured tables as real C: `banim_data[]`, `banim_pal_chara`
    (character_battle_animation_palette_table), `banim_terrain_data`
    (battle_terrain_table).
  - region-same asset blobs (US symbols as labels + incbin from baserom):
    `data_banim` (2.38 MB, 1475 syms), `data_banim_terrain` (74 KB).
  - **tier-2 PROVEN:** `data_banim_pal` — region-DIFFERENT char palettes carved as
    JP-byte incbin at boundaries pinned by the region-same `banim_pal_chara` table
    (108 syms). Legitimate per D10 (identified named assets, verified JP boundary).
  Tool: `scripts/carve_data.py [substr|--all]` (region-same harvester). Only 2 US data
  objects are fully region-same (both carved) — that sub-frontier is exhausted.
  **Next data tiers:** (2) region-different ASSET data at scale (graphics/sound/sprites)
  via JP-boundary-verified incbin — the `data_banim_pal` pattern generalized (needs each
  asset's JP boundary from a JP pointer table, NOT the assumed US boundary); (3)
  region-different structured tables → real C with JP values. See D10. The code metric
  (below) is now a small slice of the goal; DATA is the path to byte-complete.
- **Functions decompiled: 1323 / 8,528 = 15.51%** (`python3 scripts/calcprogress.py`).
- **Carved objects: 306.** `make compare` → OK, **and `make clean && make compare`
  → OK** (durability gate — see "durable bake-in" below). Build is always
  byte-perfect (`port_run` verifies every carve and reverts non-matches).
- **2026-06-08 — durable NOLOAD-romdata bake-in (16th fix) → +4 banim magic TUs
  (flux, fire, aircalibur, thunder).** Region-different ROM data (banim animation
  `.rodata`/`.data` with JP-shifted internal offsets) is placed NOLOAD at its JP
  base (stays incbin, byte-perfect); the `.text`/`.data` refs into it have their
  reloc addend rewritten to `jp[ref]-base`. Both edits are on the COMPILED object,
  which `make` regenerates from `src/*.c`, so they are **persisted to
  `layout/patches.tsv` and re-applied by `scripts/apply_patches.py` after every
  compile** (Makefile C rule). An earlier object-only patch passed `port_run`'s
  incremental verify but went RED on a clean rebuild — a verify-or-revert hole now
  closed by the manifest. (`thunder` additionally needed the 17th fix below.)
- **2026-06-08 — reloc-consistency NOLOAD decision (17th fix) → thunder.** The
  kept-vs-NOLOAD heuristic excused every byte at a reloc site, assuming the linker
  resolves it to the JP value. thunder's `ProcScr_efxThunder` `.data` references
  `Tsa_EfxThuderBg1/2` *twice each* at JP offsets that don't line up with US, so no
  single link reproduces it. Fix: a KEPT section is byte-perfect only if every
  referenced symbol needs ONE consistent address (`jp_word - addend` equal across
  all its relocs); otherwise NOLOAD it. **thunder was the LAST headless-mechanical
  TU.**
- **NEW PATH — `scripts/carve_mapped.py` (find_runs blind spot):** find_runs only
  proposes a run it can UNIQUELY locate by masked search, so it SKIPS small/
  pointer-heavy functions even though `match_us_jp.py` already located them in JP
  (funcmap). carve_mapped groups a TU's funcmap-mapped funcs into JP-consecutive
  runs and feeds them to `port_run.port(..., runs=...)` directly (verify-or-revert
  still guards). Carved +11 (scene, spinning_arrow, worldmap_text, chapterdata, bmarch, bmio, bmmap, bmsave-multiarena, classchg-event,
  cp_decide, unitlistscreen). **Re-run it each session; ~21 mapped funcs still
  uncarved (scene, spinning_arrow) fail because the
  ISOLATED subset compile doesn't reproduce the in-context JP bytes —  next lead.**
  - carve_mapped remainder: `chapterdata` RESOLVED — root cause was a MISSING
    `src/data/chapter_settings.h` (auto-gen region-specific gChapterDataTable, not
    yet ported); cpp failed silently → empty .text. port_run now DROPS missing
    `src/data/*.h` includes (accessors use externs from normal headers). `scene` — its include chain (agb_sram.h then bmsave.h) makes
/`spinning_arrow` are per-group/romdata cases. Each is 1-few carves of
    genuine long-tail per-TU work — not a single sweep.
  - **spinning_arrow RESOLVED via two fixes (2026-06-08):** (1) port_run's
    carved_rom .text end now = base+len(otext) (ACTUAL compiled .text size, not the
    run's nominal end) — a non-4-aligned single func gets a trailing align pad, so the
    .o .text is 2 bytes longer than the run; the old code left it overflowing the
    incbin gap -> 0xc04 catastrophic shift. (2) Makefile now does `.text` then
    `.align 2, 0` so the pad is zero-filled (was nop 0x46c0 — the appended `.ALIGN`
    aligned the trailing .debug_info section, not .text, under -g). JP pads inter-func
    with 0x0000, so this matches; full clean rebuild verified byte-perfect. Only
    `scene` remains in carve_mapped — **scene RESOLVED (mechanical, NOT region-different)**:
    its carved .data table holds a hardcoded IWRAM pointer (JP `0x03000040`) that the
    JP RAM layout moved vs US; port_run resolves .text literals & romdata SYMBOL relocs
    but doesn't remap hardcoded region-different addresses baked into compiled .data.
    FIXED: the .data ptr was an R_ARM_ABS32 reloc to the .bss SECTION; port_run's
    romdata loop only resolved undef NAMED syms, not section syms. Added .bss/ewram_data
    section resolution to the romdata loop (place the RAM section at its JP addr). carve_mapped
    now fully exhausted. NOTE: this was the 5th time 'region-different' turned out mechanical.
  (Earlier "no path remains / region-different exhausted" was WRONG — this class
  was the gap; keep mining funcmap-mapped functions before declaring exhaustion.)
- **.bss-overlap class RESOLVED** via `--no-check-sections` (Makefile): the overlaps
  were benign NOLOAD shared-RAM collisions; ld's default check made them fatal on any
  new carve. The flag keeps the green build byte-perfect (verified) and `make compare`
  stays the exact oracle. Unblocked +6 (bm, bmarena, bmmind, sio_core, uiutils,
  banim-ekrbattle). The COMMON-absolute / .bss-static-trim port_run fix (agb_sram)
  also stands.
- ~35 uncarved candidate TUs remain (`.text` 0x40..0x8000). THREE generalizing
  port_run fixes this round unblocked +41 (236→277): (1) addend subtraction for
  indexed externs; (2) EWRAM_OVERLAY trim; (3) multiple-definition dedup. Method
  that works: `scripts/diag_misses.py` classifies failures (run with PORTRUN_DEBUG
  it prints pre-remap content-diff + the make-err), byte-diff a representative of
  the biggest class → find the generalizing port_run bug → fix → harvest-sweep.

-  - **NOLOAD-romdata enhancement: IMPLEMENTED + VALIDATED (2026-06-08, +1):** port_run
  now compares each carved ROM-data section vs JP (reloc-masked); a region-different
  section is placed NOLOAD at its JP base (region=rom in carved_ram) so its JP bytes
  stay in the incbin and the symbol still resolves -> the TU's CODE carves. Carved
  **uichapterstatus** (region-diff VRAM ptrs). Plus objcopy --set-section-alignment so
  2-aligned bases place exactly. 15th 'region-different'->mechanical.
  - STILL BLOCKED flux/aircalibur/thunder: their .rodata is region-different
    INTERNALLY — .data ref (addend 0 -> base 0x080E20E8) and .text refs (frames.9 ->
    base 0x080E20FA) DISAGREE by 0x12 (frames.9 at JP offset 0x20 vs US 0xe). No single
    section base works; each ref needs its JP literal BAKED IN (patch the .text/.data
    word to jp[ref site] + remove the reloc). That's the next intricate fix for these 3.
    BAKE-IN — MECHANICS SOLVED, BUT NON-DURABLE (2026-06-08). Goal: rewrite each ref's
    in-section addend to jp[ref]-base so `base + addend = jp[ref]` for region-different
    internal offsets. Findings:
      1. objcopy --update-section STRIPS the section's relocs (2->0) -> the addend is
         never relocated -> wrong. (NOT an alignment/sequencing issue.)
      2. WORKS: patch the .o's section FILE BYTES directly (objdump -h gives the section
         file-offset; relocs live in a separate .rel section and survive a raw byte edit,
         so they still fire). This CARVED flux in port_run's check (1->0 bytes).
      3. *** NON-DURABLE — the showstopper ***: the patch is on the compiled OBJECT, which
         `make` REGENERATES from src/*.c on the next build, LOSING it -> a clean rebuild
         goes RED. port_run's INCREMENTAL make compare used the patched .o and passed —
         a VERIFY-OR-REVERT HOLE. (Lesson: port_run verify should `make clean` first.)
    With NOLOAD alone the residuals are tiny — flux 1, aircalibur 2, thunder 8/9, fire 2,
    3 bytes — so the per-ref bake-in WOULD carve all four IF durable.
    DURABLE FIX (next task): store patches in a manifest (layout/patches.tsv: TU, section,
    offset, value) and add a Makefile post-compile step / gen_layout hook that re-applies
    them to src/<TU>.o after every compile. Then these 4 carve durably + make compare
    survives a clean rebuild.

- **NESTED ROM-DATA FIX (2026-06-08, +4):** port_run's romdata loop is now a
  WORKLIST — a carved .data/.rodata section referencing ANOTHER ROM-data section
  (e.g. a .data ProcScr table holding a .rodata pointer) now places+carves that
  section too (was appended -> ROM growth AND the pointer left unresolved -> content
  diff). Carved banim-efxmagic-dancerings/-eclipse/-evileye, banim-efxflashbg (22 fns).
  This was the romdata near-miss 'region-different ProcScr pointer' class — MECHANICAL,
  6th time 'region-different' was wrong. Plus the romdata .bss-section fix (scene).


## SYSTEMATIC CONFIRMATION (updated 2026-06-08) — mechanical frontier exhausted at 306

The NOLOAD-romdata enhancement (designed earlier) + the reloc-consistency NOLOAD
decision were BOTH built and landed: the huge-diff banim magic TUs
(flux/aircalibur/fire/thunder) are now carved durably. **thunder was the last
mechanical TU.** Remaining candidates are ALL genuinely region-different CODE,
re-confirmed data-driven (their functions are **not in the 7740-entry funcmap** —
`match_us_jp.py`'s exact AND masked tiers both fail to locate them in JP):
  - **no-runs ×~11 (region-different CODE):** banim-efxmagic-aura/bindingblade/
    gespenst/refresh, banim-main, classdisplayfont, code_8086934,
    eventfx-stoneshatter, events_script, main, msg. find_runs verifies 0/N funcs;
    0 funcmap entries. → need per-function hand-decompilation.
  - **region-different DATA files:** banim_data, banim_pal_chara, banim_terrain_data,
    banim-efxsound-data (graphics/palette/terrain — differ JP-vs-US; carve as named
    incbin chunks, mechanical but doesn't move the function metric).
So further headless progress on CODE needs either (1) an INTERACTIVE IDA/Ghidra-MCP
session (decompile JP, write matching C), or (2) bootstrapping the **decomp-permuter
with funcmap-gap-derived boundaries** (the region-different funcs live between two
mapped JP neighbors; split by thumb `push {lr}` prologues) — a tooling build-out, the
documented next-phase lead. Session result: **236→306 objects (+70), 17 validated
generalizing fixes, all byte-perfect and durable.**

## What's built (the pipeline)

- **Carving:** `scripts/harvest_parallel.py -j16` = parallel `find_runs` discovery
  + serial fast carve. `port_run.py` carves the largest byte-verified run of a TU,
  falls back through smaller runs, no per-carve `make clean` (D7, ~44× faster).
  `make compare` is the only oracle.
- **RE tooling (region-different work) — NOW HEADLESS (2026-06-08):**
  `scripts/ida/decompile_addr.py` opens `tools/ida/fe8j.i64` (no re-analysis) and
  does both halves with NO interactive MCP:
  `~/ida-mcp-venv/bin/python scripts/ida/decompile_addr.py list <jp_lo> <jp_hi>`
  (IDA-discovered fn boundaries) and `… decomp <jp_addr>` (Hex-Rays pseudo-C).
  Proven on bindingblade. MCP servers `ida`/`ghidra` remain as a fallback
  (`make ida-db`/`make ghidra-db`). Byte-match with upstream **decomp-permuter**
  (`scripts/permuter/`). See `docs/reverse-engineering.md`, `docs/decisions.md` D6/D7/D9.
  - **CAUTION (verified 2026-06-08):** these TUs are *genuinely* logic-different, not
    pointer-only. e.g. US `efxHurtmutOBJ_Loop` is 52 bytes; the JP function in the
    same area is 186 bytes — different sizes/structure. So they CANNOT be carved by
    constructing a port_run run + bake-in (that only fixes pointer/offset deltas). Each
    needs real decompile → understand → rewrite in agbcc style → `make compare`
    (permuter to close the residual). Slow, ~per-function; `make compare` still the oracle.
  - **Per-function recipe (region-different phase):** (1) `derive` the TU's JP region
    from funcmap gaps — but gaps bracket *many* consecutive region-diff TUs (~50KB for
    the banim-efxmagic block), so use IDA `list` for real boundaries. (2) Identify each
    JP function's US counterpart by the decompiled call-graph (Hex-Rays resolves project
    symbols, e.g. `NewEfxArrowOBJ`/`StartBattleAnimHitEffectsDefault` → it's an efxHurtmut
    loop). (3) Adapt the US C / write fresh, compile agbcc -O2, place at the JP addr,
    `make compare`; permute to byte-match. (4) Commit only when byte-perfect + durable.

## Next actions (priority order)

1. **Automated re-sweep:** `python3 scripts/harvest_parallel.py -j16` — carves any
   TU newly unblocked by recently-added symbols. Cheap; run it first each session.
2. **Phase 2 — region-different DATA / port_run correctness:** TUs that masked-verify
   but fail `make compare`. THREE generalizing port_run bugs fixed this round (each
   found by byte-diffing a representative of the biggest failure class):
   - **(a) addend bug** — named-undef R_ARM_ABS32 didn't subtract the in-section
     addend, so an extern indexed at an offset (`&gOam[0x100]`, addend 0x400) landed
     0x400 bytes off. Fix: `enc(jp_literal - otext[off:off+4])`. (animedrv.)
   - **(b) EWRAM_OVERLAY trim** — `is_trim_sec` ignored `ewram_overlay_*`, so a file's
     unreferenced overlay tables (prep_unitselect's 0xB0 gPrepUnitTexts) were left in
     the object and APPENDED to the ROM, growing it and failing sha1 despite a
     byte-perfect `.text`. Fix: recognize `ewram_overlay*` in `is_trim_sec`. (+25 sweep.)
   - **(c) multiple-definition dedup** — a symbol the object defines (its own
     proc-scripts) or references-but-an-already-carved-object-defines was ALSO emitted
     in `jp_syms.s` from baseline_syms → double definition → link error (showed as
     "no diff parsed": build fails, stale-correct ROM, 0 content-diff). Fix: on a
     `multiple definition of \`X'` link error, drop X's baseline_syms row (the carved
     object is the real provider) and rebuild; verify-or-revert guards wrong addresses.
   - **Remaining frontier** (latest `diag_misses.py`, 277 objects; ~35 candidates):
     - **romdata near-miss (≤4 diff, +romdata) ×8** — `uichapterstatus`,
       `unitlistscreen`, `banim-efxflashbg/-efxmagic-dancerings/-eclipse/-evileye`,
       `bmio`, `scene`. Compound, not one-line: e.g. `banim-efxflashbg` has both an
       11-byte `.rodata` that's *referenced but not placed* → appended → ROM +11
       growth, AND a region-different ProcScr function pointer (`0x080dfbe4` @
       0x5e3ab0). Candidate fixes: (i) place referenced `.rodata`/`.data` sections via
       their NAMED syms (extend romdata placement beyond section-symbol refs); (ii)
       subtract the addend in the romdata internal-pointer loop too (mirror the .text
       addend fix). Verify per-TU before generalizing.
       **TRIED & RULED OUT (2026-06-08):** the romdata internal-pointer addend
       subtraction alone carves 0/8 of these — the diffs are region-different ProcScr
       *function pointers* (addend 0) plus referenced-but-unplaced `.rodata` growth,
       not indexed-table addends. Don't re-try the romdata-addend path; the real fix
       is (i) **place referenced `.rodata`/`.data` via named syms** at their JP address.
     - **`.bss`-overlap class — RESOLVED** (see Verified state). Fixed via
       `--no-check-sections` (benign NOLOAD shared-RAM overlaps) + the COMMON-absolute
       / .bss-static-trim port_run fix. Unblocked agb_sram, bm, bmarena, bmmind,
       sio_core, uiutils, banim-ekrbattle. No further work needed here.
     - **huge diff (~11.9M) ×3** — `banim-efxmagic-flux/-aircalibur/-thunder`,
       all first @ 0x373c: catastrophic misplacement. ROOT LEAD (2026-06-08):
       port_run computes romdata `.rodata` base = **0x080E20FA — MISALIGNED** (the
       `.data` base 0x085FFB88 is fine). A misaligned `.rodata` carved_rom entry
       cascades through gen_layout's sorted-gap/incbin computation → everything from
       0x373c shifts. The `.rodata` base = `jp[base+off] - ss[1]` is likely wrong
       because the referenced `.rodata` symbol is region-different (JP offset ≠ US
       `ss[1]`). BUT these are graphics-heavy region-different banim effects (many
       Img_*/Pal_*/AnimScr_* pointers) — a correct base likely still leaves
       region-different content diffs. Lower priority. PROBED: flux's .rodata holds local static frame arrays
       (frames.9 @0xe, frames.13 @0x40) referenced via section+addend; base computes
       to misaligned 0x080E20FA because the JP .rodata layout differs (region-different
       animation data) -> +4 size + 0x373c catastrophic shift. The nested ROM-data fix
       did NOT help (these .rodata are .text-referenced, not nested). REFINED: both .rodata refs AGREE on base 0x080E20FA (frames.9@0xe -> 0x80e2108,
       frames.13@0x40 -> 0x80e213a), so the US .rodata LAYOUT matches JP — but the base
       is 2-ALIGNED while the .rodata section is 4-aligned (2**2). The linker can't place
       a 4-aligned section at a 2-aligned addr -> it bumps placement -> +4 size / 0x373c
       shift. Candidate fix: objcopy --set-section-alignment .rodata=1 (or =2) on the
       carved .o so gen_layout's exact-address placement isn't overridden; verify the
       content then matches (the 2-aligned base may also mean a real 2-byte JP .rodata
       offset). PARTLY MECHANICAL: a section-alignment fix ELIMINATES the catastrophic shift —
       `arm-none-eabi-objcopy --set-section-alignment <sec>=<largest pow2 dividing the
       JP base> <obj>` after compile lets gen_layout's sequential rom_body place the
       section at the exact 2-aligned address (flux went from +4/11.9M-diff to +0 / a
       clean 13-byte diff). REVERTED (unvalidated — no carve yet) but RE-ADD it when
       tackling the residual: flux's .rodata has 13 bytes of REGION-DIFFERENT animation
       data (frames arrays). To carve: either RE the JP .rodata values, OR leave the
       region-different .rodata in the incbin baseline and reference it at its JP addr
       (carve only the .text/.data).  aircalibur/thunder are identical-shape.
       **DESIGNED next fix (substantial, ~2 files):** to carve flux's .text (real
       code) while its .rodata stays incbin: (a) port_run compares each carved romdata
       section's compiled bytes vs JP[base:base+size]; if they MATCH carve as now, if
       they DIFFER (region-different data) do NOT add it to carved_rom — leave the bytes
       in the incbin; (b) instead emit a NOLOAD symbol-only placement so the section
       symbol = its JP base (the .text reloc resolves to incbin+addend) but the US
       content isn't written. Needs a gen_layout NOLOAD-at-ROM-address path (it only has
       iwram/ewram NOLOAD today). Plus the objcopy --set-section-alignment fix above.
       This generalizes: any TU referencing region-different ROM data can then carve its
       CODE. Best done fresh, gated by make compare.
     - **no-runs ×15 — Phase 3 (hand-decompile) is now the ONLY remaining class with a path.** compile-fail class CLEARED (worldmap_path: forward-ref prototype; bmbattle: incremental-trim fallback). Every generalizing-fixable class is resolved; the rest (15 no-runs region-different code, ~9 compound romdata near-misses, 3 huge-diff banim) needs per-function hand-decompilation via ida/ghidra+permuter — sessions per carve, not turns.
3. **Phase 3 — region-different CODE** (`no verified runs`): hand-decompile the
   functions in `ida`/`ghidra` (decompile by JP address), write `src/` C matching
   the JP behaviour, byte-match with the permuter, then carve + `make compare`.
   - **CONFIRMED region-different (2026-06-08):** `match_us_jp.py` runs BOTH exact AND
     masked (pointer-word-wildcarded) matching → 7739/8528 mapped. The ~789 unmapped
     functions (the 15 no-run TUs) failed BOTH tiers — their non-pointer instruction
     bytes genuinely differ JP-vs-US. No generalizing fix remains; each needs real RE.
   - **REQUIRES an interactive, MCP-connected session.** The `ida`/`ghidra` MCP
     servers are configured (~/.claude.json) but are NOT reachable in a headless run
     (ToolSearch returns no RE tools) — so Phase-3 carves cannot be done headless/in
     the cron; they need a normal interactive session with the MCP servers live.
     `fireemblem8.elf` (JP, AArch32) + `../fireemblem8u/fireemblem8.elf` are on disk
     for `make ida-db` / `make ghidra-db`.
   - **Nature of the differences (probed 2026-06-08, MCP-free):** the no-run funcs
     differ by (a) different INSTRUCTIONS (0 masked hits in JP for the smallest one)
     and (b) hardcoded region-different IMMEDIATE constants baked into code, e.g.
     bmarch `GetBallistaItem` is `movs r0,#19` (a JP-different item ID — NOT a reloc,
     NOT an addr_map address). A lenient pointer-only mask gives FALSE 1-hit matches;
     find_runs' reloc-accurate mask correctly gives 0 bases. So no automated
     mask/remap path exists — each needs the JP value read from the disassembly (RE).

## Rules

- `make compare` must stay `OK` — never commit a carve that isn't byte-perfect.
- Decompiler/permuter output is a hypothesis, never committed as-is.
- Don't leave a broken build or stray `src/*.c` (the harvester cleans up on exit).
- Update this file + the TaskList before ending any session.
