# fireemblem8u — Decompilation Project History (distilled)

A paraphrased narrative history of the **Fire Emblem 8 US** decompilation
(`../fireemblem8u`, the project FE8J ports from), reconstructed from the public
Fire Emblem Universe `#decomp` channel and the pret `fireemblem8` channel
(2018-02 → 2026-06). This is a DISTILLED summary for FE8J planning — no verbatim
logs, generic attribution (Discord handles only where already public), and every
factual address/percentage below should be treated as a pointer to verify in the
fe8u repo, not as gospel. Cross-checked against the live fe8u tree where load-bearing.

The single strategic takeaway: **fe8u reached ~99.7% code-in-C by late 2025**
(49 functions left `NONMATCHING`; only `arm.s` / `arm_call.s` hand-ARM remain),
but its **DATA axis plateaued around ~43% in-src** — data extraction, not code
matching, was and remains the long tail. FE8J is mostly-data, so fe8u's data
tooling and the *order* it extracted things is the most reusable asset here.

---

## 1. Bootstrap (2018-02, week 1)

The project opened on 2018-02-22 and copied the **pret/pokeemerald methodology
wholesale**:

- **incbin baseline from day one.** The whole ROM is a series of
  `.incbin "baserom.gba", <off>, <size>` chunks with named globals, so the build
  is byte-perfect immediately and progress is a monotonic "bytes in `src/` vs
  bytes still in `asm/`" metric. (FE8J inherited this exact model.)
- **`calcrom.perl`** existed on day one as the progress gauge (0% of ~872 KB of
  code at start, ~3,378 incbin entries).
- The **agbcc / GCC 2.95 ARM-Thumb** toolchain was confirmed on day one (FE8 was
  known-compiled with agbcc from the pret side); code style (Allman, 4-space,
  `global.h` first) was settled the same week, matching pokeemerald.
- **`asmdiff.sh`** (compile a function, diff its bytes against the baserom at an
  offset) was in use by day two and remained the core matching inner-loop tool.
- First files: `proc.c` was the first attempted (and first NONMATCHING) on day 2;
  **`m4a_2.c` was the first confirmed matching C file** (~day 3), taking the
  project from 0 → ~0.83%. By end of week one it was ~1.3–1.9%.

The "declare war on incbins" splitting workflow was formalized in week one:
isolate a baserom region → run a datadump tool (`ddump`/`splitdata.perl`) to pull
out pointer tables → emit labeled sub-incbins → rebuild and confirm bytes unchanged.
This is the ancestor of FE8J's `scripts/carve_data.py`. It was noted immediately
that **text alone (Huffman-compressed strings) was ~3,000 of the ~6,000 incbin
entries** — the single biggest data target, recognized on day ~4 and *still* only
partly resolved years later.

---

## 2. Tooling build order

Roughly the order each tool/technique entered active use:

1. **`calcrom.perl`** (d1) — progress metric (`src/` vs `asm/` bytes).
2. **`asmdiff.sh`** (d2) — per-function byte diff vs baserom; the matching loop.
3. **datadump / `splitdata.perl`** (week 1) — pointer-table extraction → labeled
   sub-incbins (the incbin-splitting workflow; FE8J's `carve_data.py` analogue).
4. **`gbagfx`** (mentioned d2, batch use from 2019) — tiles↔PNG, palettes, LZ77/RL.
   **Could not handle TSA (tilemaps)** — a limitation that gated graphics for years.
5. **`old_agbcc`** override (2018-02-28) — m4a/library TUs need GCC 2.95.2 + per-TU
   `-O1`; per-target `CC1 := $(CC1_OLD)` Makefile override (FE8J inherited this).
6. **m4a tooling** — `m4a2s` (song disassembly), then a matching **`mid2agb`**
   reimplementation ported from pokeemerald (~2019-03), plus voicegroup tooling.
7. **`decomp.me`** (~2022) — online agbcc matcher for hard reg-alloc / control-flow
   NONMATCHINGs; FE8 had no dedicated preset for a long time (used a Pinball preset).
8. **`scripts/dump_*.py` family** (grew 2019→2025) — ROM-traversal extractors for
   structured data (battle-animation pointer tables, chapters, events, portraits,
   CGs, sprites). Now ~40+ scripts.
9. **`scripts/gfxtools/tsa_generator.py`** (the TSA gap-filler, numpy+PIL) — the
   tool that finally let TSA-bearing backgrounds (btl_bg, worldmap, CGs) build from
   committed PNGs. **FE8J does not yet have this directory** (its Makefile already
   has the `%.feimg<N>.bin`/`%.fetsa<N>.bin` rules waiting for it).
10. **`scripts/texttools/`** (`textprocess.py` + `huffman.py`) — the text build
    pipeline (source `.txt` → control-code expand → SJIS/charmap → Huffman → C).
11. **GitHub Actions CI** — operational by ~2023-04 (needs the ROM as a secret).

The durable convention is a three-way `scripts/` split: **`gfxtools/`** (image/TSA),
**`texttools/`** (text/Huffman), **`dump_*.py`** (ROM traversal/structured data).
FE8J should mirror it.

---

## 3. Chronological timeline (eras)

- **2018-H1 — foundation sprint.** 0 → ~4% code. Toolchain, asmdiff, incbin
  splitting, `old_agbcc`, the proc/font/text subsystems started. Shiftability
  declared a *separate axis* from code-% (a recurring point of confusion).
- **2018-H2 — plateau.** ~4%. Mostly toolchain restructuring (removing the
  DevKitPro dependency from agbcc), which stalled builds and confused newcomers for
  a long time.
- **2019 — acceleration + first data.** ~4.6 → ~9.8% code. **m4a sound driver
  completed** (CgbSound imported from pokeemerald, ~2019-03); **first real data
  work**: graphics dumped in batches, the big m4a tables split into labeled
  sub-regions (voicegroups, wave data, the ~590-entry song table), first `.4bpp`+
  `.png` graphics pairs. Text re-confirmed as the top pending eliminator.
- **2020–2021 — dormant.** ~11–12% code; data axis ~0%. Few high-signal messages;
  attention had moved to other pret projects. Occasional newcomers hit the stale
  agbcc-branch / DevKitPro confusion.
- **2022 — revival + shiftability.** ~12 → ~24% code. Batch graphics extraction
  (unit-icon sheets), **shiftability declared achieved** (recompile-and-run, with
  known crashes), decomp.me adopted for hard functions, TSA limitation documented.
- **2023 — the big code year.** ~36 → ~71% code; **data-in-src jumped to ~40%**
  (a large bulk data extraction happened across 2022–2023). 40%, 50%, milestones
  celebrated; GitHub Actions CI confirmed live.
- **2024 — final code sprint.** ~71 → ~98%+. 90% milestone (2024-03);
  `dump_events.py` written (2024-06); remaining asm narrowed to a short list
  (`arm.s`, `arm_call.s`, banim/spline/sio hard cases). TSA tilemap *matching*
  technique found (2024-09).
- **2025 — code essentially done.** The last spline math functions matched
  (collaborative decomp.me scratch, ~2025-11). Final state reported ~**99.7% code
  in `src/`**; **49 `NONMATCHING`**; data-in-src ~**43%** (the rest, incl. the
  ~2.4 MB banim blob, still incbin). Hand-ARM `arm.s`/`arm_call.s` are permanent.
- **2026 — declared code-complete.** Remaining work is *data extraction and full
  shiftability* (resolving every pointer so `baserom.gba` leaves the build graph) —
  exactly the frontier FE8J faces.

---

## 4. Data-extraction timeline (most reusable for FE8J)

Data was **never extracted in one pass**; it trailed code by years and went
roughly in this order:

1. **Pointer-table labeling (2018–2019)** — split monolithic data incbins into
   per-symbol labeled incbins (no `baserom.gba` removal yet). Const/RNG/string
   tables first. This is the cheap "region-same → named incbin" lever.
2. **Sound structure (2019-05)** — the m4a tables carved into voicegroups, wave
   data, music-player table, and a ~590-entry song table; partial m4a data dump.
   Full MIDI→`mid2agb`→`.s` round-tripping stayed hard (see pitfalls).
3. **Graphics, simple sprites (2019→2022)** — `gbagfx` PNG/`.4bpp`(`.lz`) pipeline
   for icons, unit-icon sheets, portraits. Uncompressed `.4bpp`, LZ `.4bpp.lz`,
   and FE "fake-compression" `.4bpp.fk` (raw under a 4-byte `(len+4)<<8` header).
4. **Bulk data (2022–2023)** — the jump from ~0% to ~40% data-in-src. Structured
   `dump_*.py` extractors for battle-animation pointer tables, chapter/event data.
5. **TSA-bearing backgrounds (2024–2025)** — blocked until `tsa_generator.py`
   (numpy+PIL) existed, because **gbagfx cannot generate TSA**. btl_bg / worldmap /
   CGs build as `png → .feimg<N>.bin + .fetsa<N>.bin (both LZ) → incbin`, where
   `<N>` is a tile-dedup method number. This is the **biggest data lever FE8J is
   currently missing** (FE8J has the Makefile rules but not the tool).
6. **Text / font (recurring, never fully closed)** — the Huffman-compressed string
   system is the largest incbin source and the hardest to fully eliminate; much of
   it stayed as labeled incbin even at code-completion.

Data state near completion: data-in-src plateaued ~43%; the rest (notably the
~2.4 MB `data/banim` blob) remained committed binary/incbin. **Full shiftability
was NOT reached at code-completion** — pointer resolution is the open long tail.

---

## 5. Pitfalls / lessons (recurring pain, validated)

1. **TSA is not auto-generatable by gbagfx.** Tilemaps need a dedicated tool
   (`tsa_generator.py`); dump gfx + tsa + pal as *separate* objects. This gated all
   background graphics for years — adopt the tool early.
2. **Text/Huffman is the biggest incbin source and the hardest to remove.** The
   Huffman tree is data-specific; re-encoding requires the *exact* tree-construction
   + tie-break order, and the JP tree differs from US. Plan to keep JP text as
   incbin or re-encode with a verified JP algorithm — don't assume it round-trips.
3. **Shiftability ≠ code-%.** They are independent axes; conflating them misleads
   planning. Code can be ~100% C while the ROM still needs `baserom.gba` because
   data pointers are unresolved.
4. **`old_agbcc` vs `agbcc` is per-file.** m4a/library TUs need the older compiler
   (and sometimes `-O1`); a per-target `CC1 := $(CC1_OLD)` override. A perennial
   newcomer stumbling block.
5. **Toolchain churn burns newcomers.** The multi-year DevKitPro-removal /
   agbcc-branch migration created stale-branch confusion. Pin a known-good setup.
6. **agbcc reg-alloc is stochastic and context-sensitive.** r4/r5 swaps are the
   most common near-miss; nested loops are the hardest. Inter-procedural pressure
   means an *unrelated* neighbor TU can shift another function's allocation. Levers:
   benign nudges, `register asm("rN")` as a last resort, decomp.me for hard cases.
7. **NONMATCHING is a last resort, not an early exit** — fe8u ended with only 49.
   Use a `#ifdef NONMATCHING ... #else <naked asm>` guard (and `#ifdef BUGFIX` for
   real developer bugs) as an intentional convention, not a failure.
8. **Splitting an incbin temporarily inflates the count** (e.g. text → ~3,000
   entries). Track *bytes self-contained*, not incbin-directive count.
9. **Trust only a clean-build progress number.** Stale outputs give false-OK
   readings; rebuild before believing a percentage (FE8J's `make compare` stale-OK
   trap is the same lesson).
10. **Some regions are permanently hand-asm.** `arm.s` (ARM-mode core routines,
    e.g. map-flood) and `arm_call.s` (Thumb→ARM trampolines whose `nop` differs
    from modern `ld` output) cannot be reproduced from C — keep them as asm stubs.

---

## 6. How completion was approached

Not a single push but a long tail: a fast code-matching front (asmdiff →
decomp.me, fingerprint/neighbor identification, NONMATCHING guards for the
genuinely unmatchable) that reached ~99.7% C, leaving a small permanent
hand-asm core; and a much slower data front (gbagfx + `tsa_generator.py` +
`dump_*.py` + text/Huffman pipeline) that, even at code-completion, had only
removed ~43% of data bytes from the incbin baseline. For FE8J the lesson is to
**front-load the data tooling** (especially TSA) rather than treating data as a
post-code cleanup, because data is ~94% of the ROM and the long pole.
