# What "Decompilation Complete" Actually Means (and Where FE8J Really Stands)

A prior effort drove the catch-all `asm/baserom.s` to **zero** `.incbin "baserom.gba"`
directives and declared the FE8J decompilation **complete**. That conclusion was
wrong. Nothing was decompiled or extracted to achieve it — the 12,462 incbins were
simply **relocated** out of `asm/baserom.s` into 2,319 other committed
`asm/*.s` files (e.g. `data_banim.s` = 1,475 incbins, `dat_data_portrait.s` = 482,
`direct_sound_data.s` = 439), each still literally pulling raw bytes with
`.incbin "baserom.gba", off, size`. The "goal met" was a **byte-shuffle**, not a
decompilation. The build still cannot produce a single one of those 13.3 MB of bytes
without the original ROM physically present.

This document states the **real** definition of "decomp complete" as proven by the
gold-standard references — `fireemblem8u` (the near-complete US counterpart) and
`pokeemerald` (pret) — and measures FE8J honestly against it.

**The real definition of "decomp complete":** the ROM is reproduced **byte-for-byte
from committed source alone** — matching C (`src/*.c`), descriptive/data assembly
(`*.s`), and **extracted, descriptively-named source assets** (PNG/`.pal`/`.bin`
graphics, charmap-encoded text, C struct tables, `.mid`/`.aif` music) compiled by an
asset toolchain (gbagfx, preproc, jsonproc, textencode, mid2agb, aif2pcm). The
original ROM, `baserom.gba`, is **only** the verification target of `make compare`
(a post-build `sha1sum -c`) — it is **never a build input**. Delete `baserom.gba`
and `make` must still emit the byte-identical ROM. FE8U and pokeemerald pass this.
**FE8J fails it on 83% of the ROM.**

---

## The real completion criterion — "remove `baserom.gba`, `make` still builds byte-perfect"

Build self-containment is THE oracle. It is not "`asm/baserom.s` has zero incbins"
(cosmetic, already gamed); it is "the build graph has no edge to `baserom.gba`."

**fireemblem8u — baserom is verification-only.** Across its build directories
(`asm/`, `data/`, `src/`) there are **exactly 0** `.incbin "baserom"` directives.
The 1,395 baserom incbins that grep finds across the whole tree live **only** in
`scripts/` (one-time extraction tooling: `gen_split_data.py`, `pointer_dump.py`,
`dump_chapter_assets.py`, …) and in human-readable reports — never assembled into the
ROM. The Makefile references `baserom.gba` exactly once, and it is
`git clean -dfx -e baserom.gba` — i.e. **preserve** it during clean; no build recipe
reads it. The ROM target chain is purely source:
`$(ROM): $(ELF)` (objcopy) and
`$(ELF): $(ALL_OBJECTS)` where
`ALL_OBJECTS := C_OBJECTS + DATA_SRC_C_OBJECTS + ASM_OBJECTS + BANIM_OBJECT + MID_OBJECTS`
— compiled C and assembled `.s` only. `compare:` then runs `sha1sum -c checksum.sha1`.
You can `make` fireemblem8u with `baserom.gba` absent.

**pokeemerald sets the bar even harder.** Its Makefile contains **zero** occurrences
of `baserom`. Compare is optional and gated:
`ifeq ($(COMPARE),1)` → `@$(SHA1) rom.sha1`. ROM build is `$(ROM): $(ELF)` (objcopy)
and `$(ELF): $(LD_SCRIPT) $(LD_SCRIPT_DEPS) $(OBJS) libagbsyscall` — compiled source
only. The pret/Glitch-City framing is explicit: an **incomplete** matching decomp
*requires* a base ROM precisely because it still `INCBIN`s ranges from it; a
**complete** one does not.

**Even the single genuinely-foreign code blob is built from source.** FE8U's only
in-build binary incbin is `asm/fe6sio.s: .incbin "fe6sio_payload.bin.lz"` (the FE6
link-cable payload). It is **not** carved from baserom: `fe6sio_payload.bin.lz` is
built by `gbagfx mgfembp/mgfembp.bin -mindist 1`, and `mgfembp.bin` is compiled from
C source in the `mgfembp` git **submodule** (`StanHash/mgfembp`) via its own agbcc
variant. The strictest "foreign blob" case is still reproduced byte-perfectly **from
source**. This is the model for any region that resists C: reconstruct from source
or commit a descriptively-named extracted asset — never incbin the original ROM.

**FE8J's true state.** The Makefile **hard-depends** on `baserom.gba`:
`asm/baserom.o: baserom.gba` (Makefile L134), `baserom.gba` is in
`GEN_LAYOUT_INPUTS`, and the header comment states "Requires a local copy of the
original ROM at `./baserom.gba`." There are **12,462** `.incbin "baserom.gba"`
directives across **2,319** `asm/*.s` files (0 in `src/`), summing to **13,932,295
bytes = 13.29 MB = 83.0%** of the 16 MiB (16,777,216-byte) ROM. Every one resolves
**only** against `baserom.gba`; 0 resolve against any generated/extracted source.
**Delete `baserom.gba` and 83% of the ROM cannot be produced — the build fails.**

> **Definition of done (the acceptance test FE8J must add to CI):**
> `mv baserom.gba /tmp && make` → builds `fireemblem8.gba`; then restore baserom and
> `make compare` → `OK`. Call this the **self-contained build** gate. Until every
> `.incbin "baserom.gba"` is replaced by an extracted source asset / assembled data /
> matching C **and** the `baserom.gba` build-graph edges are removed, FE8J is **not**
> a complete decomp — regardless of the `asm/baserom.s` incbin count or any README
> badge.

---

## The four real fronts

### (a) Data extraction — replace ~14 MB of incbin with extracted assets

**The standard (fireemblem8u / pokeemerald).** A complete decomp's data is
**extracted into named source assets**, then incbin'd from **those** — never from the
ROM. FE8U commits the editable source-of-truth and **gitignores** the build
intermediates:

- **Graphics:** committed **PNG** is the source. gbagfx compiles `png → 4bpp/8bpp`,
  `*.pal` (JASC) `→ gbapal`, then LZ77/RL-compresses, and the compiled binary is
  pulled in via `INCBIN_U8("graphics/.../x.4bpp.lz")` in `src/data/*.c`. Generic
  Makefile rules: `%.4bpp: %.png`, `%.gbapal: %.pal`, `%.lz: %`. Flow:
  `png (committed) → 4bpp → .lz → incbin → object → ROM`, with baserom never in the
  loop. FE8U commits **3,434 PNG**, **510 `.pal`**, **1,381 extracted `.bin`** TSA
  tilemaps (descriptive names like `005DD518_Tsa_BreathBgBase.map.bin`) — **4,815**
  graphics assets — and **0** committed `.lz/.4bpp/.gbapal` (all regenerated).
- **Text:** human-readable bracket-annotated strings in `texts/texts.txt`
  (`Weapon Level increased.[.][X]`) + control-token map `texts/textdefs.txt`, encoded
  to **CP932 (Shift-JIS)** `u16` arrays then **Huffman-compressed** into
  `src/msg_data.c` by `scripts/texttools/textprocess.py` + `huffman.py` (or
  `tools/textencode`). FE8 text **is** Huffman-compressed in ROM, so a *matching*
  Huffman encoder is mandatory.
- **Tables:** three tiers — (a) descriptive `.s` with a named `.globl` symbol and
  `.byte/.short/.word` (e.g. `gItemData` in `src/data_items.s`, 11,499 lines, 0
  incbin), (b) the modern target: **JSON → `jsonproc` (inja) → generated C struct
  array** (`src/data/chapter_settings.json` → `struct ROMChapterData
  gChapterDataTable[]` with named enums), (c) hand-written C struct arrays. **222**
  committed `.s` carry `.byte/.short` tables; **149** `.json`; **72** `src/data/*.c`.
- **Music:** **589 `.mid`** compiled per-song by `mid2agb` with exact per-song flags
  (`-E -G000 -R020 -P010 -V051`); **439 `.aif`** PCM samples via `aif2pcm`.
- **Compression must be byte-exact.** gbagfx pins `-mindist` per asset (1/2/3) to
  reproduce the original compressor's output; without the right value the bytes
  differ and `make compare` fails.

**FE8J's TRUE current state.** **0.12% extracted.** Of carved data,
**13,899,434 bytes (99.88%)** are named `.incbin` from `baserom.gba`; only
**17,369 bytes (0.12%)** live in C arrays — and those are lookup tables inside ported
`.c` (e.g. `sOamTileSizeLut`), **not** extracted assets. The whole repo has **1 PNG**,
**0** generated `.4bpp/.gbapal/.lz`, **0 `.mid`**. There is **no asset toolchain at
all** — `tools/` holds only RE/build tooling (agbcc, ida, gbadisasm, m2c, permuter,
objdiff); no gbagfx, preproc, bin2c, jsonproc, textencode, mid2agb, or aif2pcm. The
"data 18.6% carved" figure is **named-incbin-of-baserom**, which is **not extraction**.
Worse, `scripts/calcprogress.py` (L149–150) sets `jp_data_total = data_bytes` and
hardcodes `data_remaining = 0`, so "Data 100%" is **tautological** (denominator ==
numerator).

**Work to close it.** Port `tools/preproc` + `tools/bin2c` + `tools/gbagfx` (gfx +
LZ/RL); write ROM→asset extractors (gbagfx `Nbpp→png`, palette→`.pal`,
LZ-decompress), commit the PNGs/`.pal`/`.bin`, add the generic Makefile rules, and
replace each gfx incbin with `INCBIN_U8` of the rebuilt asset — **tuning `-mindist`
per asset by trial** (decompress → recompress → diff) until byte-identical. Port
`tools/jsonproc` and the `include/` struct defs to turn `.byte` tables into typed C /
JSON. Port `textencode`+`huffman`, dump the JP Huffman message table back to
bracket-annotated **Japanese** `texts.txt` (CP932), and verify the re-Huffman'd output
round-trips byte-identically (the JP tree differs from US). Music is the hardest class
(`mid2agb` output depends on exact `-V/-R/-P/-G` flags per song) — **defer it**:
carve as named incbin first, extract last.

### (b) Code decompilation — asm → matching C for every function (disasm ≠ decomp)

**The standard.** A "decompiled function" means its **bytes come from compiling C**
and the function passes the sha1 build — measured by `calcfunc.sh` as
`funcTotal − (FUNC_START-in-asm)`, gated by the byte-identical build, **not** by
"has a C-shaped file." FE8U: **8,509 / 8,528 functions = 99.777%** are matching C;
only **19** remain in asm (ARM helpers in `arm.s`/`arm_call.s`); **0 INCLUDE_ASM**.
The ~**46 NONMATCHING** functions are **still fully C** — an `if (NONMATCHING)`
readable branch plus an `else` branch with a register-pinning hack that forces exact
bytes (e.g. `Spline_Ease` in `src/spline.c`). Raw asm function bodies are the **wrong
end** of the spectrum:
`descriptive asm (oracle, byte-source .s)` → `NONMATCHING C (readable, byte-source
still .s)` → `matching C (goal, oracle, byte-source .c)`.

**FE8J's TRUE current state.** Code is the most-advanced axis but still **<26% real
C**. Of 8,528 US-target functions, only **2,187 (25.6%)** are matching C compiled from
`src/*.c`; **6,282 (73.7%)** are **gbadisasm descriptive asm** — real Thumb/ARM
opcodes that *do* assemble without the ROM, but are **disassembly, not
decompilation** (+12 NONMATCHING staging C). By code byte: of 900,892 carved code
bytes, **156,736 (17.4%)** is real C and **744,156 (82.6%)** is descriptive asm. Even
named files like `asm/sub_8024390.s` (`push`/`ldr`/`bl`) and `AddTarget.s` are
gbadisasm output, not C. **disasm ≠ decomp**: the 6,282 descriptive-asm functions each
have a byte-source of `.s`, the `INCLUDE_ASM`-equivalent — exactly what FE8U has
**zero** of.

**Work to close it.** Convert each of the 6,282 asm function `.s` into byte-matching
C (m2c first pass → hand refinement → decomp-permuter), with the byte-identical build
as the per-function gate. Only the genuinely-unmatchable tail stays C with a
`NONMATCHING` `else` that still compiles to exact bytes — never raw asm. The
gbadisasm `.s` is a **decompile starting point**, not the destination.

### (c) Symbol documentation — meaningful names for every function and data symbol

**The standard.** FE8U names **all** symbols; `calcrom.pl` runs `nm` on the ELF and
counts any `sub_<hex>` / `Unknown_<hex>` / address-suffixed symbol as
undocumented. FE8U's map has **0 `sub_`** and **0 `nullsub`** — **35,140** symbols,
all documented (the 377 `gUnknown_*` are named placeholders with documented offsets,
counted as partial). Naming is real C names plus `sym_iwram.txt` for IWRAM/BSS layout.

**FE8J's TRUE current state.** Of **19,961** `.global` asm labels, roughly **8,180
(~41%)** are auto-generated placeholders: **5,730 `sub_XXXX`** + **654 `data_`** +
**109 `nullsub_`** + **~1,687** auto `banim_/snd_/gfx_` asset-sheet labels. The
remaining ~11,680 are PascalCase/`gGlobal` names largely **inherited from the US map**.

**Work to close it.** Name every `sub_/data_/nullsub_/auto-sheet` label with an
RE-derived name. The workflow keys on the **US address** via
`reference/maps/funclib_us_jp.tsv` (**8,377** rows — *hint, not truth*, ~0.6%
non-random errors), resolves the current name from `fireemblem8u`, and **validates
with `make compare`**; supplement with IDA Hex-Rays MCP + Ghidra MCP + the FE
community function library where the funclib is silent or wrong.

### (d) Build self-containment + honest metrics

**The standard.** Metrics measure **real** progress: matched-C function %, extracted
data-byte %, named-symbol %, and (the ultimate gate) baserom-independence. FE8U's
`calcrom.pl` computes `dataExtracted = dataTotal − bytes-still-in-data-blobs`,
hitting 100% only when those blobs reach 0; `gen-report.py` feeds documented%,
matched_code, and matched_functions to decomp.dev.

**FE8J's TRUE current state — the metrics are not honest.** `calcprogress.py` reports
**"code in src 99.94%"** (counts incbin-free descriptive **asm** as "src"), **"data
in src 100%"** (denominator == numerator, L149), and **"94,277 symbols documented =
225.28%"** — an overflow past 100% (against a 41,849 denominator), implying
"−52,428 undocumented (−125%)". Only the Functions line (**25.6%**) is honest. The
README advertises a "byte-perfect raw-ROM baseline" where progress is "incbin replaced
with real decompiled C **and descriptively-named data**" — but descriptively-named
data **is still incbin**. The badges conflate descriptive-asm with decompiled-C and
self-reference the data denominator.

**Work to close it.** Replace the badges with four honest axes — (1)
build-without-baserom %, (2) matching-C function %, (3) extracted-asset data %, (4)
meaningfully-named symbol % — fix `jp_data_total` to a real `dataTotal` and the
symbol denominator to stop overflowing, and add the **self-contained build** CI gate.

---

## Honest scorecard — where FE8J REALLY is

Blunt numbers from the audit (ROM = 16,777,216 bytes):

| Front | Honest figure | What the badges claimed |
|---|---|---|
| **Build without `baserom.gba`** | **~17%** (only ~2.85 MB of 16 MB is real source; **13.29 MB / 83.0%** is `.incbin "baserom.gba"` across **12,462** directives in 2,319 files) — **the self-contained build FAILS** | implied ~complete |
| **Code as matching C** | **25.6% by function** (2,187 / 8,528); **17.4% by code-byte** (156,736 / 900,892). The other **73.7%** of functions are gbadisasm **descriptive asm**, not C | "code in src 99.94%" |
| **Data extracted to assets** | **~0.12%** (13.27 MB named-incbin; only **17 KB** in C arrays; **1 PNG**, **0** `.4bpp/.gbapal/.lz`, **0 `.mid`** in the whole repo) | "data in src 100%" (tautological) |
| **Symbols meaningfully named** | **~59%** (8,180 of 19,961 labels are `sub_/data_/nullsub_/auto-sheet` placeholders; the named rest is largely inherited from the US map) | "225.28% documented" (overflow) |

**Bottom line:** FE8J is **not close** to a real decompilation. The genuinely-advanced
axis is code-**as-opcodes** (99.9% of the *code region* builds without the ROM — but
disasm ≠ decomp). Everything else is early: 83% of the ROM still resolves only against
`baserom.gba`, data extraction is essentially **zero**, a quarter of functions are C,
and two-fifths of symbols are placeholders. The "decomp complete / byte-coverage goal
met" claim was a **mirage** produced by relocating incbins and by self-referential
metrics.

---

## Phased re-plan to TRUE completion

This is a **multi-sprint** effort: ~13.3 MB of data to extract, **6,282** functions
to decompile to matching C, and **~8,000** placeholder symbols to name — every step
gated by the byte-identical build. Ordered by dependency, with the existing assets
feeding each phase.

**Phase 0 — Stand up the oracle and the toolchain (do this FIRST).**
1. Add the **self-contained build** target/CI gate: build with `baserom.gba` moved
   away; it must succeed once data is extracted, and *today it should be allowed to
   fail loudly* so the metric is honest from day one. Keep `baserom.gba` strictly
   behind `make compare`.
2. Port the asset toolchain from FE8U in dependency order:
   `tools/preproc` + `tools/bin2c` → `tools/gbagfx` (gfx + LZ/RL with `-mindist`) →
   `tools/jsonproc` → `tools/textencode`+`huffman` → (last) `tools/mid2agb` +
   `tools/aif2pcm`. Add the generic Makefile rules (`%.4bpp: %.png`,
   `%.gbapal: %.pal`, `%.lz: %`, `sound/%.bin: sound/%.aif`).
3. Fix the metrics (front d) so progress is measured honestly before grinding begins.

**Phase 1 — Data → assets (the bulk: ~94% of the ROM is data).** Grind region by
region: graphics → committed PNG + `.pal` via gbagfx (decode → commit → recompress →
diff, tuning `-mindist` to byte-match); tilemaps/TSA → committed `.map.bin`;
palettes → `.pal/.gbapal`; tables → typed C structs (port `include/` defs:
`struct ItemData/CharacterData/ClassData`, or JSON+jsonproc); JP text → CP932 +
Huffman round-trip into `src/msg_data.c`; music **last**. Each extracted region
**removes** baserom incbins and moves the build-without-baserom % up for real.

**Phase 2 — asm → matching C (in parallel with Phase 1).** Run **m2c at scale** over
the 6,282 gbadisasm `.s` (they are the decompile *starting point*), refine by hand,
and converge with **decomp-permuter** (`scripts/permuter/`). The byte-identical build
is the per-function oracle. The **NONMATCHING infra is already built** (`src/nonmatching/`,
12 staged) for the unmatchable tail — keep those as C with an exact `else` branch.

**Phase 3 — Naming as we go.** For every function/data symbol touched, port the US
name by **address** via `funclib_us_jp.tsv` → resolve in `fireemblem8u` → validate
with `make compare`; fill gaps with IDA Hex-Rays MCP + Ghidra MCP. Naming rides along
with Phases 1–2 rather than being a separate pass.

**How existing assets feed this:** the **funclib map** (8,377 rows) bootstraps Phase 3
naming; the **NONMATCHING tier** absorbs the unmatchable code tail; the **m2c +
permuter** pipeline is the Phase-2 engine; the **gbadisasm `.s`** files are not waste —
they are the verified-byte starting point each function is decompiled *from*. The
missing piece is the **asset toolchain** (Phase 0), without which Phase 1 cannot begin.

---

## Corrected metrics + the new oracle

**The new oracle (`make compare` WITHOUT baserom as a build input):**

```
# Self-contained build gate — baserom.gba is NOT a build input:
mv baserom.gba /tmp/ && make            # MUST build fireemblem8.gba from source alone
mv /tmp/baserom.gba . && make compare   # restore ONLY to verify: sha1 -> OK
```

Concretely, FE8J must reach the FE8U/pokeemerald build graph: remove
`asm/baserom.o: baserom.gba` and the `baserom.gba` node from `GEN_LAYOUT_INPUTS`,
gitignore `*.gba`/`*.4bpp`/`*.gbapal`/`*.lz`, and keep `baserom.gba` referenced **only**
for the post-build `sha1sum -c` (or, like pokeemerald, behind `COMPARE=1`). When
`grep baserom Makefile` finds only clean-time preservation (or nothing), the oracle is
met.

**Honest per-front metrics to publish (replacing the inflated badges):**

| Axis | Definition (denominator) | FE8J today | Target |
|---|---|---|---|
| **Build self-containment** | bytes producible from source ÷ 16,777,216 | **~17%** | 100% (self-contained build passes) |
| **Matching-C functions** | matching-C funcs ÷ 8,528 | **25.6%** (2,187) | 100% (FE8U: 99.777%) |
| **Extracted data** | extracted-asset bytes ÷ data bytes (real `dataTotal`, **not** `data_bytes`) | **~0.12%** | 100% |
| **Named symbols** | named ÷ total labels (no overflow) | **~59%** (8,180 placeholders of 19,961) | 100% (FE8U: 0 `sub_`/`nullsub`) |

Until all four reach 100% **and** the self-contained build passes with `make compare`
→ `OK`, FE8J is an **in-progress** decompilation — currently ~17% build-independent,
25.6% decompiled-to-C, ~0.1% data-extracted, ~59% symbol-named — not a complete one.
The single number that matters most is the first one, because it is the only one that
cannot be gamed by relabeling: **remove `baserom.gba`, and see if `make` still builds.**
