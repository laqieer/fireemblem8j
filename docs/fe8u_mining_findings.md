# fe8u Discord Mining — Reusable Knowledge Deltas (for FE8J)

Mined from FE Universe `#decomp` (416236460002377730, 19,232 msgs, 2018-02→2026-06)
and pret `fireemblem8` (442465614104231937, 7,413 msgs, 2018-08→2026-06) — BOTH new
vs the existing matching-focused `docs/discord_findings.md`. Distilled/paraphrased;
raw JSONs stay gitignored. Load-bearing claims VERIFIED against the live fe8u tree
are tagged [✓verified]; ROM addresses/counts are worker-reported [~rep] (re-derive JP).

Routing legend: → target doc. Confidence [HIGH/MED/LOW]. NEW vs CONFIRM vs CORRECTION.

================================================================================
## BUCKET D — DATA EXTRACTION methodology (TOP PRIORITY — FE8J's frontier)
================================================================================

### D-TSA (tilemaps) — the #1 actionable gap
- **D-TSA1 [HIGH][✓verified] NEW. Copy `scripts/gfxtools/` from fe8u — it is the
  TSA gap-filler FE8J lacks.** fe8u has `tsa_generator.py` (+`tsa2.py`,`lzss_*.py`,
  `rom_def.py`, previews). FE8J is MISSING the dir but its Makefile ALREADY has
  `%.feimg<N>.bin %.fetsa<N>.bin: %.png` rules + `FETSATOOL := scripts/gfxtools/
  tsa_generator.py` — so dropping in the dir + `pip install numpy pillow` unlocks
  btl_bg/worldmap/CG extraction immediately. → docs/tools/gbagfx.md + a new gfxtools note
- **D-TSA2 [HIGH] NEW. gbagfx CANNOT generate TSA** (tile-set arrangement / tilemap);
  this gated all backgrounds for years. Pipeline branches: simple sprites→gbagfx;
  TSA-bearing BGs→tsa_generator.py. (FEU 2018-02..2019; pret 2019-05) → gbagfx.md
- **D-TSA3 [HIGH][✓verified] NEW. `<N>` in feimg/fetsa = tile-dedup METHOD (1-4).**
  btl_bg uses method 3; method 1 is banim-style (row-scan). `.feimg<N>.bin` AND
  `.fetsa<N>.bin` are BOTH separately LZ-compressed. Invocation:
  `tsa_generator.py in.png out.feimg<N>.bin out.fetsa<N>.bin`. → gfxtools note
- **D-TSA4 [MED][~rep] NEW. TSA on-disk format** = 2-byte header `(width-1,height-1)`
  then 2-byte tilemap entries (index+palette+flip), GBA VRAM layout. BG triplet =
  `bg_N_tiles`(LZ 4bpp)+`bg_N_map`(TSA)+`bg_N_palette`(gbapal). → gfxtools note

### D-GFX (graphics/sprites)
- **D-GFX1 [HIGH] NEW. `.PRECIOUS: graphics/%.4bpp` is required** or make deletes
  the intermediate `.4bpp` after building `.4bpp.lz`, breaking incremental rebuilds.
  (pret fe8 2019) → gbagfx.md
- **D-GFX2 [HIGH] NEW. `-num_tiles X` needed for non-8x8-multiple sprites** (e.g.
  banim sheets dump one extra tile by default → byte diff). (pret fe8 2019) → gbagfx.md
- **D-GFX3 [HIGH] NEW. `.pal` files need Unix line endings** (gbagfx breaks on CRLF
  in WSL); sidestep by committing `.gbapal`/`.agbpal` raw binary instead. → gbagfx.md
- **D-GFX4 [HIGH][✓verified] NEW. Portrait subsystem = 5 assets each**: tileset
  (`.4bpp.fk`), chibi (`.4bpp.lz`), mouth (`.4bpp` raw), card (`.4bpp.lz`), palette
  (`.agbpal` raw). `dump_portrait.py` iterates the portrait table. (FE8J already
  carved portraits region-same per gbagfx.md batch-2 — this confirms the asset split.)
- **D-GFX5 [HIGH] NEW/CONFIRM. ASYMMETRY rule**: extract AND rebuild with the SAME
  gbagfx binary; never edit the source PNG in an external editor or round-trip
  fidelity is lost. → gbagfx.md

### D-PAL (palettes) — byte-exactness traps
- **D-PAL1 [HIGH] NEW. Palette bit-15 trap.** Valid GBA palette entries store
  `0x7FFF` (bit15 clear); some tools (PIL putpalette; round-trips) emit `0xFFFF`
  (bit15 set) → non-match. Mask/verify bit15 on every palette extract. fe8u has a
  `fix_color_white_in_palette.py` for the pure-white case. (FEU 2024-09) → gfxtools note
- **D-PAL2 [HIGH][✓verified] NEW. Two palette formats:** `.gbapal` (raw BGR555 from
  `gbagfx png→gbapal`) and `.agbpal` (raw, used for portrait palettes). Rule
  `%.gbapal: %.pal; $(PAL2GBAPAL) $< $@` with `PAL2GBAPAL := $(GBAGFX)`. → gbagfx.md
- **D-PAL3 [MED] CONFIRM. 8bpp (256-color) cannot auto-derive palette from PNG** —
  supply it explicitly; `TILE_SIZE_8BPP=0x40` vs 4bpp `0x20`. → gbagfx.md

### D-SND (sound/music)
- **D-SND1 [HIGH][~rep] NEW. m4a region layout (US addrs, re-derive JP):** voice
  groups (~0x207470) → keysplit tables [UNUSED, FE7 legacy] → programmable wave data
  (12 waves) → music-player table → song table (~0x224470). → data-target-map.md
- **D-SND2 [HIGH] NEW. FE8 has NO keysplit usage** (tables are dead weight inherited
  from FE7) — same in JP; don't try to model keysplit macros. (pret fe8 2019-05) → data-map
- **D-SND3 [HIGH] NEW. MIDI matching recipe (freshollie procedure):** dump sound blob
  (m4a-walker script) → extract MIDIs (VGMusicStudio + reverseVolume hack) →
  `mid2agb -E -V046 -G000 -R020 -P010` → fix PATT (insert time-sig before pattern) /
  fix KEYSH (remove a leading VOL at tick 0). Tools also seen: `m4a2s` (ipatix),
  `Voicegroupie` (Diegoisawesome). (pret fe8 2022-05) → docs/tools/mid2agb.md
- **D-SND4 [HIGH] CORRECTION/NEW. `mid2agb`-reproduced music may NOT byte-match** —
  FE8 audio likely authored with `mks4agb`/`mml2agb` (Nintendo internal, not
  open-source); some tracks show KEYSH patterns inconsistent with generic mid2agb.
  Expect to keep some music as incbin. → mid2agb.md
- **D-SND5 [MED][~rep] NEW. Sound dir layout:** direct samples → `sound/
  direct_sound_samples/*.bin`; programmable waves → `*.pcm`; songs named
  `song{NNN}_{mml_name}`. → data-target-map.md

### D-TXT (text/script/font)
- **D-TXT1 [HIGH][✓verified] NEW. Text pipeline = `scripts/texttools/`** —
  `textprocess.py` (include-expand + control-code subst from textdefs + SJIS/charmap
  + Huffman via `huffman.py`) → `src/msg_data.c` + `include/constants/msg.h`. FE8J
  already has a parallel `msg_jp.py` — reconcile with fe8u's structure. → texttools note
- **D-TXT2 [HIGH] NEW/CONFIRM. JP Huffman tree differs from US** (compresses 2-byte
  Shift-JIS pairs, not 1-byte). Re-encoding needs the EXACT tree-construction +
  tie-break; matching prob ~0 if text changes. JP termination/leaf coding differs.
  Plan: keep JP text incbin OR re-encode with a verified JP algorithm. → texttools note
- **D-TXT3 [HIGH][✓verified] NEW. Font glyph pipeline** = `src/data/fonts/
  glyphs_{1,2,3}.h` (2bpp glyph bitmaps) + `color_lookup_tables.h` (2bpp→4bpp).
  Build intermediates `.latfont/.hwjpnfont/.fwjpnfont` (Latin/half/full-width JP).
  FE8J's JP build will lean on the half/full-width JP font path. → texttools note

### D-STRUCT (struct tables / structured blobs)
- **D-ST1 [HIGH][✓verified] NEW. `dump_*.py` family (~40+ scripts)** is the
  structured-data extractor set: `dump_portrait.py`, `dump_cgs.py`,
  `dump_blob_structured.py`, `dump_events.py`, `dump_battle_animation_pointer_table.py`,
  `dump_chapter_*`, `dump_anim_*`, etc. Port + re-point at JP addresses. → strategy.md
- **D-ST2 [HIGH] NEW. `dump_blob_structured.py` emits structured GAS** (`.2byte`/
  `.byte` with field comments + `.if size!=EXP;.error` guard) for OAM/wmpath blobs
  that have no standard asset form — better than opaque `.incbin`. → carve_data note
- **D-ST3 [HIGH] CONFIRM. Banim pointer table = 12 modes/char** (close/crit/ranged/
  dodge/stand/missed variants); each char refs sheet+OAM_L+OAM_R+pal+script (all LZ).
  Blank sheets share one `blank.4bpp.lz`. (matches our extract_banim_oam.py) → data-map
- **D-ST4 [HIGH] NEW. CG (event/ending art) = 1 pal + 1 TSA + up to 10 part
  tilemaps** via `dump_cgs.py`; tiles `.4bpp.lz`, TSA raw `.tsa.bin`. → gfxtools note

### D-ORDER / MISC
- **D-ORD1 [MED] CONTEXT. fe8u data order:** code → banim sheets (2019) → sound
  structure (2019) → simple graphics (2019-22) → bulk structured data (2022-23) →
  TSA backgrounds (2024-25, gated on tsa_generator). Text never fully closed.
  Lesson for FE8J: front-load TSA + text tooling. → strategy.md
- **D-ORD2 [HIGH][✓verified] CONFIRM. `scripts/` 3-way split:** `gfxtools/` (image/
  TSA), `texttools/` (text/Huffman), `dump_*.py` (ROM traversal). Mirror it. → strategy.md

>> SINGLE MOST REUSABLE DATA INSIGHT: copy `scripts/gfxtools/` (tsa_generator.py)
   from fe8u + `pip install numpy pillow`; FE8J's Makefile feimg/fetsa rules are
   already wired — this unblocks btl_bg + worldmap (the bulk of Tier-2 volume).

================================================================================
## BUCKET A — code-match idioms / levers (NEW vs discord_findings.md)
================================================================================
- **A-N1 [HIGH] EXTENSION of C5. Inter-procedural reg bump is broader than caller.**
  ANY TU-neighbor compiled-to-C (not just a caller) can shift another function's
  agbcc allocation; reverting an unrelated neighbor to asm can restore a near-miss.
  → playbook §1/§5 (extend C5)
- **A-N2 [LOW] NEW. GNU statement-expression `({stmt; expr;})` as an order lever.**
  Single observed "weird" matching solution; reshapes eval order/spills. Last-resort
  on an evaluation-order near-miss. → playbook §1
- **A-N3 [MED] NEW. Literal palette/array bytes must be `u8`** — signed treatment
  (`0x90`↔`0xF0`) caused a banim data near-miss; distinct from the load-mnemonic
  field oracle (applies to constant array data). → playbook §7

================================================================================
## BUCKET B — tooling / automation (NEW)
================================================================================
- **B-N1 [HIGH][✓verified] arm_call.s trampolines unreproducible by modern ld.**
  Thumb→ARM veneers `bx pc; mov r8,r8; <arm b>`; modern arm-none-eabi-ld emits
  `bx pc; b .-2` (different nop). Keep `asm/arm_call.s` (+`arm.s`) as permanent
  stubs. → strategy.md / playbook §0 DEADEND
- **B-N2 [HIGH] NEW. `-ffix-debug-line` is version-gated** — invalid on stock agbcc,
  hard error; some fe8u banim TUs (with `-g`) use it. Strip when porting unless on
  the patched fork. → docs/agbcc_internals.md / build docs
- **B-N3 [HIGH] NEW. fe8u build now needs `numpy`+`pillow`** (for tsa_generator.py);
  on Debian/Ubuntu use venv or `--break-system-packages`. → setup docs
- **B-N4 [MED] NEW. decomp.me diff-algo switch (Levenshtein↔difflib)** affects
  score display (not compile) for over-length scratches. → docs/tools/decomp-me.md
- **B-N5 [HIGH] NEW. mgfembp multiboot payload is fully decompiled externally**
  (StanHash/mgfembp) — a position-independent EWRAM FE6-save-reader present in FE8J
  too (fe8u wires `src/sio_multiboot.o`). Carve as named incbin or port from ref. → strategy.md

================================================================================
## BUCKET C — RE / identification (FE-engine-specific, NEW)
================================================================================
- **C-N1 [HIGH][partial✓] fe8u ldscript TU ORDER is the ground truth for C3**
  (map-proximity TU inference): main/irq/rng/proc/font/face/event/bm*/banim/m4a...
  NOTE: some 2018-era proposed TU names (e.g. `hino.c`, `evtcmd_gmap.c`) did NOT
  survive into the final fe8u src — use the LIVE fe8u ldscript, not the 2018 list.
  → playbook §2
- **C-N2 [MED] NEW. `ekr*` = battle-animation proc family** (gauge HUD, dragon,
  arena `ekrTogi`); `efx*`/`ekrfx*` = effects sub-prefix. Reuse names from fe8u.
  → playbook §5
- **C-N3 [HIGH][✓verified] NEW. fe8u's last holdouts** = `ekrGaugeMain` + two spline
  math fns (solved ~2025-11 via collaborative decomp.me). FE8J's hardest region-diff
  candidates will likely be the same cluster. → playbook §0
- **C-N4 [HIGH][✓verified] NEW. `arm.s` (ARM-mode, e.g. MapFloodCore) is hand-asm**,
  not agbcc — permanent NONMATCHING; naive switch reconstruction is buggy (missing
  cases). → playbook §0 DEADEND

================================================================================
## BUCKET E — GBAFE conventions (NEW)
================================================================================
- **E-N1 [HIGH] NEW ref. Proc/6C coroutine system** documented at
  feuniverse.us guide (ProcCmd table: END/CALL/LOOP/SLEEP/GOTO/LABEL/YIELD/REPEAT/
  OVERLAY/GOTO_IF). `PROC_REPEAT`+`Proc_Break` is a valid IntSys idiom. → playbook §5
- **E-N2 [HIGH][✓verified] NEW conventions. `#ifdef NONMATCHING/<naked asm>` +
  `#ifdef BUGFIX` guards** are intentional fe8u conventions for genuinely-unmatchable
  fns / known dev bugs — adopt rather than block. fe8u ended with exactly 49 NONMATCHING.
  → playbook §0b
- **E-N3 [MED] CONFIRM. Asset name prefixes `Img_`/`Tsa_`/`Pal_`/`g*Data`**; dumpers
  strip the prefix for the file basename. → data-target-map.md

================================================================================
## BUCKET F — workflow (NEW)
================================================================================
- **F-N1 [HIGH][✓verified] fe8u is ~99.7% code-in-C (Nov 2025), 49 NONMATCHING,
  only arm.s/arm_call.s hand-asm left** — treat fe8u as a near-complete porting
  reference; the "not-yet-decompiled-upstream" blocker is essentially gone for code.
  → strategy.md / memory
- **F-N2 [MED] CONFIRM. Track BYTES self-contained, not incbin-directive count** —
  splitting an incbin inflates the count (text → ~3,000). → calcprogress / README
- **F-N3 [LOW] NEW. `preproc` also applies a charmap to `_("...")` literals** — FE8J
  uses `iconv UTF-8→CP932` instead, so ported `preproc`-style C may need `_()` macros
  stripped / charmap applied separately. → preproc.md

================================================================================
## TOP ~10 (CTO triage)
================================================================================
1. [D-TSA1, ✓] Copy fe8u `scripts/gfxtools/` (tsa_generator.py) + numpy/pillow —
   FE8J Makefile feimg/fetsa rules are pre-wired; unblocks btl_bg+worldmap (bulk Tier-2).
2. [D-TXT2] JP Huffman text tree differs from US, ~0 match prob if changed — biggest
   data target; plan incbin-or-verified-re-encode, not naive round-trip.
3. [F-N1, ✓] fe8u ~99.7% code-complete (49 NONMATCHING) — near-complete port source.
4. [D-SND3/4] Full MIDI→mid2agb workflow + the caveat that music may not byte-match
   (mks4agb/mml2agb origin) — bound the sound effort honestly.
5. [B-N1/C-N4, ✓] arm.s + arm_call.s are permanent hand-asm (trampoline nop differs
   from modern ld) — don't grind them; same cluster as fe8u.
6. [D-PAL1] Palette bit-15 (0x7FFF vs 0xFFFF) byte-exactness trap — verify every pal.
7. [D-ST1/2, ✓] Port the ~40-script `dump_*.py` family + `dump_blob_structured.py`
   (structured GAS w/ size-guard) — the structured-data extractor backbone.
8. [D-GFX1/2/3] gbagfx gotchas: `.PRECIOUS .4bpp`, `-num_tiles X`, `.pal` CRLF — each
   a silent byte-diff / broken-build cause.
9. [E-N2, ✓] Adopt `#ifdef NONMATCHING/BUGFIX` guard convention (49 is fine, not failure).
10. [D-ORD2/B-N5] Mirror fe8u `scripts/{gfxtools,texttools,dump_*}` split; mgfembp
    multiboot has an external full decomp reusable for that region.

## Residual / honesty
- ROM addresses + exact counts (songtable 0x224470, "172 portraits", %s) are
  worker-reported from chat and must be RE-DERIVED for JP — tagged [~rep].
- 2018-era TU names (hino.c, evtcmd_gmap.c) did not all survive to final fe8u src —
  use the LIVE fe8u ldscript for C3 grounding (C-N1 caveat).
- Both channels mined high-signal (code-block + keyword filtered), not exhaustively;
  the 2020-2021 dormant era is genuinely sparse. decomp.me channels were NOT re-mined
  (already covered by discord_findings.md). No m4a/MIDI byte-match was independently
  proven here — D-SND4 is a documented caveat, not a tested result.
