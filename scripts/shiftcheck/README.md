# Shiftability harness

Tools that test whether the ROM is **shiftable** — i.e. whether it could be edited,
recompiled, and run correctly without breaking pointer integrity. The build being
byte-identical (`make compare`) does **not** prove this: a pointer stored as a raw
absolute address (`(u8*)0x08A39148`) holds the correct value only because everything
sits at its original offset. It carries no relocation, so it breaks the moment the
layout moves. These tools find such hardcoded pointers.

Nothing here touches the matching build — every target is `.PHONY` and uses a
separate ELF / a generated ldscript, never `ldscript.txt`, `$(ROM)`, or `compare`.

## fe8j (JP) adaptation — read this first

This harness was ported from fe8u (PR #745). fe8j's build differs structurally, so
two things changed (see `docs/decisions.md` D313):

1. **The CI gate is the STATIC layers only: `make shiftcheck = shiftcheck-build +
   shiftcheck-static + shiftcheck-offsets + shiftcheck-talk +
   shiftcheck-ptraudit + shiftcheck-codeliterals + shiftcheck-selfrefs +
   shiftcheck-tests`.** These read the linked ROM + the `--emit-relocs` ELF + the
   `.map`, audit packed talk metadata and source pointer classifications
   (including STT_FUNC-targeting ABS32 relocations and proven packed-scalar
   false relocations), lexically reject raw numeric C literal-pool pointers
   that have no relocation, decode opaque self-referential embedded-data words
   against a narrow evidence manifest, and run focused scanner tests.

2. **Layer 2 (`shiftcheck-diff`) and Layer 3 (`shiftcheck-run`) are NON-gating and,
   for Layer 2, NOT APPLICABLE to fe8j as-is.** fe8u's differential shift injects
   `. += S;` after `src/crt0.o(.text);` to slide the tail into the slack that exists
   before the first absolute pin `. = 0x08C00000;`. fe8j's generated `ldscript.txt`
   has **no crt0** (first object is `src/rom_header.o(.text)` @ `0x08000000`), is
   **packed 100 % to the full 16 MB** (zero slack — every byte is a carved object),
   and **has no `. = 0x…;` pins** in the sequential body. Instead it ends with a tail
   of ~248 NOLOAD overlay sections declared at absolute addresses (e.g.
   `.bss_37 0x08A73D7C (NOLOAD) : { src/uichapterstatus.o(.data) }`) whose backing
   bytes live in the sequential body. A uniform `. += S` shift would overflow the
   cart **and** desync those overlays from their bytes, so it cannot build a valid
   shifted ROM. The targets remain (anchor adapted to `rom_header`, `PIN` raised to
   `ROM_HI`) but exit with a clear "no slack / not applicable" message rather than
   producing a broken image. fe8u's `--banim-ldscript` / `BANIM_OBJECT` plumbing is
   dropped (fe8j has no separate banim linker script on `main` yet).

The validation cases below (`opinfo`, `redas`, the cross-resource fixes) are the
**fe8u** history that motivated the harness; on fe8j the `make shiftcheck` HIGH-bucket
result is recorded in the V1 PR.

## Layers (cheapest → strongest)

| Make target | Layer | What it does |
| --- | --- | --- |
| `make shiftcheck-build` | 0 | Audits hardcoded GBA addresses in the **build system** (Makefile, ldscripts). Cross-checks coupled constants — e.g. the banim link base `-b 0x8c02000` must equal the ldscript pin `0xC02000` — and fails on a mismatch. |
| `make shiftcheck-static` | 1 | Relinks with `ld --emit-relocs`, then flags every ROM-pointer-looking word that carries **no relocation**. Ranked by signal (see below). |
| `make shiftcheck-offsets` | 1b | Of the words that *do* relocate, flags any relocated against the **wrong base symbol** — `ResourceA + hardcoded offset` that lands at the start of a different resource B (`scan_offsets.py`). |
| `make shiftcheck-talk` | 1c | Rejects ABS32 relocations in packed battle/defeat-talk fields other than the real event-pointer member. It parses only relocations **sourced from `.rom`**; `.debug_*` offsets that merely overlap the GBA numeric range are excluded. |
| `make shiftcheck-ptraudit` | 1d | Rejects source-level pointer-classification mistakes that the relocated ELF alone cannot distinguish, plus (from `fireemblem8_relocs.elf`) false ROM ABS32 decodes: non-entry `STT_FUNC` targets, named zero-size semantic resources with addends ≥`0x10000`, proven packed scalars, and every unaudited relocation resolving inside the cartridge header. Header-domain targets fail closed unless they are exact typed FUNC/OBJECT pointers or explicitly audited pinned slots; known TileAnimations3, LZ, and nested DACS-image source domains always fail. |
| `make shiftcheck-codeliterals` | 1e | Lexically tokenizes every linked code C source (excluding `src/data/**`) for standalone hex integer literals, then rejects numeric values in `[0x08000000, 0x0A000000)`. This catches 7/8/extra-leading-zero and suffixed spellings of agbcc literal-pool words emitted **without** `R_ARM_ABS32`; only the three declaration/call-scoped packed-value contexts documented by D377 are accepted. |
| `make shiftcheck-selfrefs` | 1f | Decodes every structureless-opaque symbol's built-ROM bytes for self-referential words and checks each hit against a narrow evidence manifest (`scripts/shiftcheck/opaque_selfref_evidence.json`); unresolved candidates or evidence drift fail `scripts/audit_pointers.py --true-debt --gate`. Zero-size symbols are never extended to the next global. |
| `make shiftcheck-glyphs` | 1g | Structural glyph-table audit (issue #143): walks the ACTUAL `TextGlyphs_System`/`TextGlyphs_Talk` linked lists in the built ROM (schema-known 0xC0 heads + `struct Glyph.sjisNext` chains, cycle-detected, ROM-range-checked) and requires a real relocation at every non-null pointer word. Catches a blind spot Layers 1 and 1d both miss: a raw literal in a single-glyph residue object never looks "MIXED" to the Layer-1 classifier, and a plain C `u32[]` numeric initializer (agbcc never relocates it) is invisible to Layer 1d's `.4byte`-token text scan. `--shifted-gba` adds an optional A/B proof against a `+shift` ROM (`build_shifted_rom.sh`): every reachable glyph's links track `+shift` and its payload bytes stay identical. |
| `make shiftcheck-tests` | test | Runs the focused scanner unit tests, including debug-section collisions and genuine `.rom` packed-field failures. |
| `make shiftcheck-diff` | 2 | Builds the ROM **shifted** by two amounts and diffs: a real pointer's value tracks the shift; a hardcoded literal stays put. **fe8j: NON-gating, not applicable** (packed/no-slack ROM — see the fe8j note above). |
| `make shiftcheck` | static + tests | The complete non-emulator gate above. |

(fe8u's Layer 3 — `make shiftcheck-run`, a headless mGBA runtime comparison of the
matching vs a shifted ROM — is omitted on fe8j: it depends on a shifted build that
this layout can't produce, so its tooling (`run_dynamic.py`, `mgba_oracle.c`, `tas/`)
is not ported.)

## Why ranking, not a flat list

Perfect static precision is impossible: incbin'd audio/graphics/animation data
contains byte runs that coincidentally look like unrelocated ROM pointers. The
shared classifier (`_classify.py`) buckets findings so the signal isn't drowned:

- **[A] HIGH** — a *coherent* pointer table (≥4 consecutive entries pointing into
  1–2 symbols) inside a **MIXED** object (one that also has real relocated pointers).
  This is the actionable worklist; the tools exit non-zero when it is non-empty.
- **[B] MIXED scattered** — unrelocated words in pointer-bearing objects that aren't
  a coherent table. Review / let Layers 2–3 adjudicate.
- **[C] BLOB** — objects with no relocations at all (pure incbin data); almost
  certainly coincidental.
- **[D] BLOB-INTERNAL** — a word inside the very symbol it points at (embedded blob
  data, e.g. a banim palette), not a typed pointer table.

Coincidental values in the cartridge header range (`< 0x08000100`) and `.text`
literal pools are filtered out by the relocation-ranking layer. D376 closes
that deliberate `.text` blind spot at the source level:
`shiftcheck-codeliterals` distinguishes the three proven packed contexts from
raw numeric C pointers before agbcc can lower them to unrelocated pool words.
(fe8u buckets pinned-region `≥ 0x08C00000` words separately; fe8j has no
absolute-pinned-block-with-slack, so `_classify.py` sets `PIN = ROM_HI` and
**nothing** is silenced as "pinned" — the whole 16 MB ROM stays in scope,
including the real carved data above `0x08C00000`.)

## Validation case (now fixed)

When first run, both Layers 1 and 2 independently isolated exactly one
high-confidence finding:

```
src/opinfo.o  (64 suspects in 1 table(s); targets: gUnkData_96(64))
  0x08A2F340 = 0x08A39148  -> gUnkData_96+0x1E48
  ...
```

`gOpinfo_1[]` in `src/opinfo.c` was a 64-entry table of raw `(u8*)0x08A3xxxx` casts
into the graphics blob `gUnkData_96`. Each was rewritten as a symbol reference,
`(u8*)gUnkData_96 + 0x1E48` (gUnkData_96 is `u16[]`, so the byte offset needs the
`(u8*)` cast). This is **byte-identical** in the matching build (so `make compare`
still passes) but is now a relocation, so it shifts correctly. After the fix the
HIGH bucket is empty:

```
[A] HIGH-CONFIDENCE ... : 0 in 0 object(s)
RESULT: no high-confidence shiftable-region suspects.
```

A separate probe also confirmed there are no hardcoded *jump* tables (runs of
unrelocated pointers at distinct symbol starts) elsewhere in the shiftable region —
`gOpinfo_1` was the only real hardcoded-pointer table in the typed data. The
remaining `[B]`/`[C]`/`[D]` words are coincidental incbin data, not pointers; the
definitive check on those is Layer 3 (runtime).

## Layer 3 runtime results

Backend: `mgba_oracle.c`, a small program linking `libmgba` (apt: `libmgba-dev`);
`run_dynamic.py` compiles it on demand. (The mGBA Python bindings aren't on PyPI for
this environment.) It is validated and non-vacuous:

- **Positive** — fixed ROM vs a shifted ROM (`+0x40000` and `+0x80000`): framebuffers
  are **identical at every checkpoint** through boot → title → intro → menus
  (frames 120–3000). The per-frame hashes vary (real changing screens), so the
  oracle is reading actual output, not a constant.
- **Oracle sanity** — base vs a heavily-corrupted ROM: correctly reports
  **DIVERGENCE**. So it does detect differences.
- **Coverage caveat** — reverting the fix and shifting did *not* diverge under
  generic input, because `gOpinfo_1` is only used on the deep in-game class-reel
  screen, which START/A spam doesn't reach in ~50 s. Layer 3 confirms the broadly
  exercised paths are shiftable; the **static layers** are what conclusively caught
  `opinfo` (the literal had no relocation; the fix gives it one). Reaching the
  class-reel screen would need a targeted input script / save state.

## Cross-resource hardcoded offsets — Layer 1b (`scan_offsets.py`)

Layers 1/2 ask "which ROM-pointer words carry **no** relocation?" (raw literals).
Layer 1b asks the complementary question: of the words that **do** relocate, which
point at a *different* resource than the symbol they relocate against — i.e.
`&ResourceA + hardcoded_offset` that actually lands in resource B.

A pointer written `Img_LimitViewSquares + 0x280` carries a relocation (so Layers 1–3
think it is safe), but the relocation tracks **Img_LimitViewSquares**, not the resource
that lives at `+0x280`. Grow `Img_LimitViewSquares.4bpp` and the next resource slides
down, while `+ 0x280` stays put → the pointer now lands in the middle of the enlarged
image. The shiftable form is a direct `&B` reference (addend 0), which relocates to
follow B.

`scan_offsets.py` parses the retained `R_ARM_ABS32` relocations: for each one against a
**named global** S it computes `addend = word − S.value` and the symbol T that owns the
word; `T ≠ S` means the offset crossed out of S. It buckets:

(fe8j note: relocations whose base is a **section symbol** are skipped — binutils
collapses local / asm-label / NOLOAD-overlay targets onto the section symbol, losing the
real source symbol, so a computed cross-resource addend is a collapse artifact. fe8u names
its sections `ROM`/`IWRAM` and skips them via `SECTION_SYMS`; fe8j names them `.rom` and
`.bss_<N>`, which `nm` does not even emit, so the scan additionally skips any base whose
name starts with `.`. Without this, ~5,200 `.rom`/`.bss_N`-collapsed relocs read as false
HIGH. See D313.)

- **[A] HIGH** — `word == T.start`, location is a **data** section, addend `> 0`: a stored
  pointer that reaches the *start* of a different resource. The actionable bug shape;
  exits non-zero when non-empty.
- **[B] REVIEW** — negative addends and mid-symbol landings: compiler `&arr[-1]`
  1-based-index bias bases and base-register reuse in `.text` literal pools. These are
  regenerated correctly every build and move with their object under a uniform shift.

**Blind spot — section symbols and runtime `ADD`.** binutils collapses relocations
against *local* symbols / asm labels onto the section symbol (`ROM`, `IWRAM`,
`ewram_data`), losing the source symbol — so a local-base `A + offset` is invisible here
(catch it at the source level). And when the compiler applies the offset as a runtime
`ADD #imm` reusing the base register, the relocated word is the base with addend 0 — also
invisible. Both classes must be found by reading the source.

### Validation cases (now fixed)

Three real cross-resource offsets were found, each resolved by its nature (all
byte-identical — `make compare` still passes):

- `src/playerphase.c` `gOpenLimitViewImgLut[]` — entry 6 was
  `Img_LimitViewSquares + (5*4*CHR_SIZE)` = `+0x280`, which fell into the *separate*
  resource `gUnkData_34` (the image was only `0x280` = 5 frames). These are six uniform
  frames of one animation, so the **stray 6th-frame asset was merged** into
  `Img_LimitViewSquares.png` (now `0x300` = 6 frames) and the table uses a clean
  `Img_LimitViewSquares + (n * LIMIT_VIEW_FRAME_SIZE)` formula that is genuinely
  within-resource. `gUnkData_34` is gone. (Was a HIGH-bucket hit; now within-resource.)
- `src/fontgrp.c` `InitTalkTextFont` — `Pal_Text + 0x10` (`Pal_Text` is `u16[]`, so
  `+0x20` bytes) was the separate talk-text palette `gUiPalettes_0`. Now references it
  directly; the palette was also **renamed `Pal_TalkText`** (it is the talk/sprite text
  palette in `fontgrp`, `scene`, and `bb`). (HIGH-bucket hit, now resolved.)
- `src/worldmap_rm.c` `WmDotPalAnim_Loop1`/`Loop2` — `Pal_WmPlaceDot_Standard - 0x10` and
  `Pal_WmPlaceDot_Highlight + 0x10` are the adjacent opposite palette. agbcc emits these as
  a runtime `ADD`/`SUB #0x20` reusing the other arg's base register, and the two loops
  anchor on different symbols, so there is **no byte-identical symbol form**; documented in
  place (keep the two palettes adjacent if the layout is edited). Invisible to this scan by
  construction — `Loop1` was found only via the source scan (subtraction form).

After the fixes the HIGH bucket is empty.

## Source-level raw-pointer scan (`scan_raw_casts.sh`)

The binary delta-0 heuristic in `scan_relocs.py` is noisy (coincidental data words
that equal symbol addresses). The **reliable** detector for the redas bug class is
at the source level: `scan_raw_casts.sh` greps for raw pointer casts in C
(`(T *)0x08…`) and raw `.4byte/.word 0x08…` literals in committed asm data. A full-
game TAS replay (see `tas/`) found one such bug that the binary scan ranked low:
`src/events_udefs.c` had `.redas = (void *)0x88b6e28` (9 chapter-7 `UnitDefinition.redas`
pointers) instead of the `REDA_*` symbols — they didn't relocate, so a shifted ROM
read garbage unit positions and desynced. Lesson: a *scattered* pointer (one per
struct, not a contiguous table) pointing exactly at a data symbol is the signal the
coherence heuristic misses; `scan_raw_casts.sh` catches it directly.

## Files

- `scan_raw_casts.sh` — source-level raw-pointer-cast detector (the redas class).
- `scan_build_addrs.py` — Layer 0.
- `emit_relocs_link.sh` — single source of truth for the production link line,
  parameterized (used with `-q` for Layer 1 and with a shifted ldscript for Layer 2).
- `scan_relocs.py` — Layer 1.
- `scan_offsets.py` — Layer 1b (cross-resource wrong-base relocations).
- `scan_event_list_ptrs.py` — targeted chapter event-list script-pointer scanner;
  with `--shifted-rom` it proves every decoded EventListScr pointer word tracks
  the +shift instead of staying stale.
- `scan_talk_table_relocs.py` — rejects false relocations in packed
  BattleTalk/DefeatTalk metadata words (e.g. flag+msg `0x08D70002`) where adding
  +shift would mutate message ids instead of relocating a pointer. Relocation
  offsets are section-relative, so only records under
  `RELOCATION RECORDS FOR [.rom]` are eligible; this preserves genuine `.rom`
  ABS32 checks while making the verdict independent of absolute build-path length.
- `audit_pointer_classification.py` — Layer 1d source heuristics plus a
  dependency-free ELF32 pass over the relocation-bearing final ELF. It resolves
  each ROM-backed `R_ARM_ABS32` against the exact relocation symbol-table entry;
  `STT_FUNC` targets must link to `S_even` or `S_even|1`; large-addend zero-size
  semantic resources and the proven AREA/TileAnimations3/LZ-stream packed
  scalars are separate high-confidence classes. Every target in
  `[0x08000000,0x080000C0)` is additionally schema-classified; compressed
  resources and nested firmware/debug-monitor images cannot borrow the parent
  ROM relocation domain. Non-ALLOC/debug relocation sections and OBJECT
  interiors are outside the function-specific rule.
- `test_scan_talk_table_relocs.py` — focused tests for `.debug_*` offset collisions,
  genuine packed-field failures, and absolute `.rom` offsets.
- `test_audit_pointer_classification.py` — exact even/Thumb function entries,
  function interiors, OBJECT interiors, debug/non-ROM section filtering, and
  rejection of a non-relocation-bearing ELF, plus zero-size large-addend,
  unproven placement-anchor review, proven compressed-anchor rejection,
  sized-provider AREA scalar, all twelve proven header-domain failures,
  TileAnimations3 frame-pointer controls, typed header pointers, pinned cases,
  and intentional raw-domain handling.
- `audit_glyph_relocs.py` — Layer 1g: structural `TextGlyphs_System`/`TextGlyphs_Talk`
  relocation audit (issue #143) + optional `--shifted-gba` A/B proof (links track
  `+shift`, payload bytes identical). Locates the tables from the reference ELF
  (never hardcoded); walks only the two schema-known pointer fields (table heads,
  `struct Glyph.sjisNext`), so it can never misclassify arbitrary packed data.
- `test_audit_glyph_relocs.py` — focused tests (synthetic ROM fixtures, no
  toolchain needed) for missing-relocation, cycle, malformed-target/truncated-read,
  and clean-chain traversal behavior.
- `gen_shifted_ldscript.py`, `diff_shift.py` — Layer 2 (non-gating; not applicable
  to fe8j's packed/no-slack ROM — kept for documentation and a future shiftable layout).
- `_classify.py` — shared classifier (Layers 1 and 2 feed it different "relocated"
  oracles: the reloc table vs. tracks-the-shift).
- `allowlist.txt` — value ranges proven coincidental (keep tight; prefer fixing).

(fe8u's `run_dynamic.py`, `mgba_oracle.c`, `tas/` — Layer 3 runtime — are not ported
to fe8j; see the fe8j note above.)
