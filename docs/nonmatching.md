# NON_MATCHING C — the readability tier above descriptive asm

> **Note on dead-end classifications:** Any function labelled "dead-end" in this
> doc or in issue comments should be treated as **provisional**. Many previously
> classified dead-ends (lsr/asr, reg-alloc, prologue-push) were reclaimed via
> deterministic levers. Before parking a function as permanently non-matching, apply
> `docs/agbcc_codegen_levers.md`. For the current live frontier of genuinely
> unmatched functions, see `docs/frontier.md` (single source of truth — not tsv caches).

## Core thesis

FE8J carves every hard, region-different function as **descriptive asm**
(`asm/<fn>.s`, gbadisasm output, byte-perfect, linked at the JP address). That
is already the FE-family INCLUDE_ASM-equivalent: it builds the oracle, but it is
*not human-readable*. The next quality tier — between "have the bytes" and "have
matching C" — is **NON_MATCHING C**: a readable C body that documents and stages
a function whose *bytes still come from the asm*.

```
descriptive asm  ──►  NON_MATCHING C  ──►  matching C
(have, oracle)        (readable, NON-oracle)   (goal, oracle)
 byte source = .s      byte source STILL = .s    byte source = .c
```

NON_MATCHING C **unblocks documentation and readability of the remaining
hard functions WITHOUT ever touching `make compare`**. (For the current count
of genuinely unmatched functions, see `docs/frontier.md` — the single source of
truth. The ~5942 figure above is a historical snapshot from when this document
was written; matching-C is now at 95.44%.) It is an *enhancement*,
not a goal change: CLAUDE.md already accepts descriptive asm as "real source"
for the final goal. NON_MATCHING C is a staging area for future matching plus
living documentation of intent — never a byte-match claim.

**The hard governance invariant (PUA harness integrity):** NON_MATCHING C must
NEVER be in the `make compare` (oracle) build path. The oracle must always build
from asm or genuinely-matching C. The design below makes faking a match
*structurally impossible*, not merely discouraged.

---

## How the FE decomps + community do it

The FE family has **no `INCLUDE_ASM` macro** — `grep -rn INCLUDE_ASM` over
`../fireemblem8u` returns zero hits. Non-matching is an in-function preprocessor
toggle; the byte source for the rare hard case is a `__attribute__((naked))`
function whose body is one `asm(".syntax unified\n"...)` block. The community
(SA2, pret, N64 decomps) generalizes this. Crucially **every** project keeps the
sha1/compare build on the byte-perfect source and exposes the readable C only in
a *separate, non-checksummed* build.

| Project | Macro / mechanism | Byte-perfect source in oracle | How non-matching C is counted |
|---|---|---|---|
| **fireemblem8u** (our reference) | In-function `#if NONMATCHING` / `#else`. Default = matching branch. Hard case: whole fn `__attribute__((naked))` + `asm(".syntax unified"...)` | Matching C, or naked-asm body (`eventscr.c` `GetUnitDefinitionFormEventScr`) | `calcfunc.sh` *counts* `#if NONMATCHING` as unmatched; never flips the build. Oracle never `-D`s NONMATCHING (Makefile has 0 hits). Near-100% matched: only 29 files / 49 uses |
| **StanHash/fe8, fireemblem6j** | Same, gated by a `MODERN` flag in the prelude: `#if defined(MODERN)&&MODERN … #define NONMATCHING 1 #define BUGFIX 1 #endif` | Default build (MODERN unset) → matching/naked-asm branch | `make MODERN=1` is a *separate* portable/readable build; default ROM stays byte-exact |
| **SAT-R/sa2** | `NONMATCH(path, decl){ asm(".include "#path); if(0)` … `END_NONMATCH }`. Oracle: naked fn linking `.inc`, C is unreachable `if(0)` dead code | The `asm(.include …)` disassembly; the readable C emits **zero bytes** | `PORTABLE`/`DEBUG` build defines `NON_MATCHING`, drops the asm, compiles the C for real |
| **pret/pokeemerald, pokeruby** (same agbcc lineage) | `#ifndef NONMATCHING` → `.incbin` asm fallback (default); `#else` → C body | The asm fallback include | `make NONMATCHING=1` is a separate, **not sha1-gated** build; "decompiled" (C count) tracked apart from "matched" (sha1 OK) |
| **OOT/MM/SM64, Paper Mario** (N64) | `#pragma GLOBAL_ASM("f.s")` (asm-processor swaps a dummy fn for the real asm) / `INCLUDE_ASM(...)` | The assembled target asm, always | objdiff/decomp.dev **auto-strip** `.NON_MATCHING`-labelled fns from the byte-match %; "decompiled" ≠ "matched". Marker taxonomy: `NON_MATCHING` (believed-equiv, bytes differ) vs `NON_EQUIVALENT`/`IDO_NON_MATCHING` |

**What we reuse from fireemblem8u, verbatim:** the `MODERN ⇒ NONMATCHING 1 +
BUGFIX 1` prelude block, and the iron rule that the oracle build never defines
`NONMATCHING`/`MODERN`. FE8J's `include/global.h:46` already *references* MODERN
(`#if !defined(MODERN) || !MODERN` for `STRUCT_PAD`) but lacks the block —
adding it wires the two-build split for free. We keep the US `#if NONMATCHING`
in-C toggle **only** for genuinely-matching C (the ~6 inherited files like
`src/spline.c` — already correct, leave them). For the region-different
functions whose byte source is asm (~5942 at time of writing; see `docs/frontier.md`), we use a **distinct file/build-level
convention** (below), because reusing the same token for "in-oracle matching
aid" and "out-of-oracle documentation" would be ambiguous and the US repo has no
INCLUDE_ASM analogue to copy.

---

## FE8J design

### The macro header

Add the family prelude block to `include/global.h` (currently `:46` references
MODERN with no defining block). Copy StanHash/fe8 `global.h:4-13` verbatim:

```c
/* Two-build separation: the ORACLE build (make compare) defines NEITHER
 * MODERN nor NONMATCHING, so the matching/asm branch is always selected and
 * the compared ROM is byte-exact. `make MODERN=1` is a separate, NON-oracle,
 * NON-sha1 build that compiles the readable C for portability/equivalence. */
#if defined(MODERN) && MODERN
#  ifdef NONMATCHING
#    undef NONMATCHING
#  endif
#  ifdef BUGFIX
#    undef BUGFIX
#  endif
#  define NONMATCHING 1
#  define BUGFIX 1
#endif
```

This handles **in-C matching aids** (the US-style toggle, unchanged). For the
**asm-byte / documentation-C split** the separation is at the **file/build
level, not via `#ifdef`** — that is what makes a fake match structurally
impossible. The byte source is the *existing* `asm/<fn>.s` (untouched). The
readable C is a sibling file in a new tracked dir `src/nonmatching/<fn>.c`,
deliberately *outside* the oracle `$(wildcard src/*.c)` set.

### File skeleton — one function, shown both ways

**Byte source (oracle, already exists — `asm/AddSpecialChar.s`):**

```asm
	.include "macro.inc"
	.syntax unified
	thumb_func_start AddSpecialChar
AddSpecialChar:
	push {r4, r5, lr}
	...                       @ gbadisasm, byte-perfect
	thumb_func_end AddSpecialChar
```

Its carved_rom row (`layout/carved_rom.d/gbadisasm_AddSpecialChar.tsv`) names
`asm/AddSpecialChar.o(.text.AddSpecialChar)` at the JP address+size. This is the
**sole thing the linker places** for this function. Unchanged.

**Documentation (NON-oracle, new — `src/nonmatching/AddSpecialChar.c`):**

```c
/* NON_MATCHING: byte source is asm/AddSpecialChar.s @ JP 0x08XXXXXX.
 * This C documents/stages the function and is NOT in the make-compare oracle.
 * Graduate via permuter -> matching C (then move up to src/, flip the
 * carved_rom row asm->src, delete the .s; make compare must stay OK). */
#include "global.h"

void AddSpecialChar(struct TextHandle *handle, int code)
{
    ...   /* readable, US-funcmap-named, agbcc-compilable C — no asm, no #ifdef */
}
```

No `#ifdef` inside the file, no asm in it. The split is purely the directory it
lives in plus the Makefile wiring.

### Makefile wiring (the HARD INVARIANT)

The oracle today (verified):

```make
CFILES      := $(wildcard src/*.c)          # line 57
C_OBJECTS   := $(CFILES:.c=.o)              # line 64
ALL_OBJECTS := $(C_OBJECTS) $(ASM_OBJECTS)  # line 66 — what $(ELF) links & compare checksums
```

`$(wildcard src/*.c)` does **not** recurse into `src/nonmatching/`, so the
oracle excludes it for free. Add a *separate, non-sha1* target:

```make
# --- NON_MATCHING staging: prove-builds only, NEVER linked, NEVER checksummed ---
NONMATCH_CFILES := $(wildcard src/nonmatching/*.c)
NONMATCH_OBJECTS := $(NONMATCH_CFILES:.c=.o)

nonmatching: $(NONMATCH_OBJECTS)            # reuses the existing %.o: %.c recipe (line 131)
	@echo "PROVE-BUILDS ONLY — staging C compiled, NOT checksum-gated, NOT linked."
```

Add `nonmatching` to `.PHONY` (line 123). The objects are **not** in
`ALL_OBJECTS`, so `$(ELF)` (line 137) and `compare` (line 74) never see them.

**Structural guarantee against fake matches — two independent locks:**

1. **Linker can't see it.** `src/nonmatching/*.o ∉ ALL_OBJECTS`; the
   `$(LD) -T $(LDSCRIPT) … $(ALL_OBJECTS)` line never receives it.
2. **Even if someone wrongly added it, the ldscript has no catch-all.**
   `ldscript.template.txt` places sections by **explicit name only** (verified:
   the only wildcard is `/DISCARD/` — no `*(.text)`). An unplaced `.text.orphan`
   links at orphan VMA `0x0` under `--no-check-sections` (line 138), *not* into
   `.rom`, so it cannot overwrite oracle bytes. To enter the oracle a function
   MUST have a `layout/carved_rom` row naming its object's section at its real
   JP address+size — which only the byte-matching object (asm OR matching C) can
   satisfy, or `make compare` goes RED.

So a non-matching object can never silently masquerade as a byte-match: the
match verdict is the sha1 of bytes placed by an explicit, address-pinned row,
never an assertion in a C file. The asm half already exists and already builds
the oracle; this design only *adds* a readable sibling that the oracle is
structurally blind to.

---

## Pipeline & graduation

```
gbadisasm asm   ──►  m2c seed   ──►  NON_MATCHING C   ──►  permuter   ──►  matching C
asm/<fn>.s           base.c          src/nonmatching/      nonmatchings/    src/<fn>.c
(oracle byte src,    (scratch,        <fn>.c (TRACKED,      <fn>/ (gitignored (oracle,
 carved_rom row)      gitignored)      prove-builds)         scratch)        flipped row)
```

| Stage | Artifact | Home | Tracked? | In oracle? |
|---|---|---|---|---|
| 1. Byte source (DONE) | `asm/<fn>.s` + carved_rom fragment | `asm/`, `layout/carved_rom.d/` | yes | **yes** (the bytes) |
| 2. m2c seed | `base.c` (m2c `-t gba`, arch_arm, `--valid-syntax`) | `nonmatchings/<fn>/` | no (gitignored) | no |
| 3. NON_MATCHING C | hand-cleaned, US-funcmap-named, compiles via `make nonmatching` | `src/nonmatching/<fn>.c` | **yes** | no |
| 4. Permuter | `output-<score>-*.c`, `target.o`, `score.txt` | `nonmatchings/<fn>/` | no (gitignored) | no |
| 5. Matching C | graduated body | `src/<fn>.c` | **yes** | **yes** |

- **m2c → seed:** `m2c --target gba` consumes `asm/<fn>.s`. Per D24 it can't
  resolve PC-relative literals, so the output is a *seed only*, dropped in the
  existing gitignored `nonmatchings/<fn>/base.c` scratch (the convention
  `nonmatchings/StartStoneShatterAnim/base.c` already follows).
- **seed → NON_MATCHING C:** hand-clean into readable agbcc C, give it US funcmap
  types/names, `#include "global.h"` first, verify with `make nonmatching`,
  commit to `src/nonmatching/<fn>.c`. This is the reviewed, prove-builds tier.
- **permuter:** `scripts/permuter/compile.sh` (already mirrors the agbcc
  pipeline: `cpp|iconv|agbcc|as`) assembles `asm/<fn>.s` as the target `.o` and
  scores candidates by objdump-diff; **score 0 = byte-match**, `--stop-on-zero`
  exits on it. The match verdict is an independently *recomputed* byte-diff,
  never an assertion — the strongest anti-fake-match lock. All permuter output
  stays in gitignored `nonmatchings/<fn>/`, outside ldscript and the oracle.

**Graduation — the one-row flip, gated by a single `make compare`:**

1. Move `src/nonmatching/<fn>.c` → `src/<fn>.c` (or merge into the owning TU).
2. Delete `asm/<fn>.s`.
3. Flip the carved_rom row object: `asm/<fn>.o(.text.<fn>)` →
   `src/<fn>.o(.text)`. The JP range is **unchanged**, so the layout tiling is
   invariant.
4. `make compare` → **OK** is the graduation oracle. That single green
   certifies the byte-match; nothing else can.

**check_layout.py + carve fragments handle it cleanly by construction:**

- `gen_layout.py` builds `ldscript` *purely* from `carved_rom*.tsv` rows. A
  NON_MATCHING function's row already names the **asm** object;
  `src/nonmatching/<fn>.c` gets **no row**, so gen_layout can never reference it
  — it cannot enter ldscript, period.
- `check_layout.py` scans carved_rom for `(asm|src)/\S+\.o(` refs and requires a
  tracked source for each. Since no row references `src/nonmatching/`, it
  imposes no constraint there.
- **Two recommended lint additions** (turn the invariant into committed CI):
  1. Extend `check_layout.py`: assert **no carved_rom row references an object
     under `src/nonmatching/`** (regex `src/nonmatching/\S+\.o`); exit non-zero
     with *"non-matching C must not be placed in the oracle layout."*
  2. A trivial `make check-nonmatching`: assert every `src/nonmatching/<fn>.c`
     has a byte source `asm/<fn>.s` (a staging C can't exist for a function with
     no oracle byte source).

---

## Metrics

The accounting must report three *distinct* numbers and never let documentation
masquerade as a match. Honesty is mandatory (PUA: no fake matches).

`calcprogress.py` today (verified): bytes come from carved_rom rows by section
name (`.text` ⇒ code), and functions are counted **only** from text symbols of
`src/*.o` objects that appear in a carved_rom row (the oracle, matching C).
`US_TOTALS["functions"] = 8528`.

| Metric | Source | Effect of NON_MATCHING C | Change |
|---|---|---|---|
| **(a) Byte-perfect %** (the byte goal) | carved_rom `.text`/`.data` rows | gbadisasm `asm/<fn>.s` row **already counts** — a function is "byte-done" the moment its asm carve is green | **unchanged** |
| **(b) C-matched %** (`functions decompiled`) | text symbols of oracle `src/*.o` | NON_MATCHING C has **no carved_rom row** ⇒ correctly does **not** inflate this | **unchanged** |
| **(c) C-decompiled** (NEW, separate line) | `glob('src/nonmatching/*.c')` (or count `^[A-Za-z].*(` defs) | reports readable-C progress without overstating matches | **add one line** |

Concrete `calcprogress.py` addition:

```python
nonmatch_c = len(glob.glob('src/nonmatching/*.c'))
out.append(f"{nonmatch_c} functions staged as non-matching C "
           f"({pct(nonmatch_c, fn_t)}% of {fn_t}) — documented, NOT byte-matched.")
```

Net accounting, with no double-count across graduation:

- **(a) byte goal** — asm carve counts; green asm = byte-done.
- **(b) C-matched** — oracle `src/*.o` text symbols only; only *graduated*
  functions count. Never inflated.
- **(c) C-decompiled** — (b) PLUS staged NON_MATCHING C, reported on its **own
  line**, so the portal/board never shows "matched" when only asm+staging-C
  exist. On graduation the function silently moves from (c)-only into (b); no
  double count.

This mirrors objdiff/decomp.dev's "decompiled ≠ matched" rule and the N64
`.NON_MATCHING` auto-strip: the byte-match % is mechanically protected from
inflation.

---

## Decision (D26) + next steps

**D26 — ADOPT NON_MATCHING C as the readability tier above descriptive asm,
reusing fireemblem8u's convention.** Add the family `MODERN ⇒ NONMATCHING 1 +
BUGFIX 1` block to `include/global.h`; introduce a **tracked** staging tier
`src/nonmatching/<fn>.c` (readable, funcmap-named) compiled by a **separate
`make nonmatching` target that never links into `$(ELF)` and never runs sha1**.
The byte source remains the existing `asm/<fn>.s`, unchanged. The oracle
(`make compare`) links **only** asm + genuinely-matching top-level `src/*.c`.
`gen_layout` + `carved_rom*.tsv` stay the sole source of truth for what links.

*Rationale:* this is the battle-tested family pattern (SA2/pokeemerald/N64 all
converge on "oracle on byte-perfect source + separate non-checksummed C build"),
it composes with our existing carve with near-zero new machinery, and the
two-lock structural guarantee (object not in `ALL_OBJECTS`; ldscript has no
`*(.text)` catch-all) makes faking a match impossible rather than merely
discouraged — satisfying the PUA harness-integrity invariant by construction.

**Minimal first implementation (one PR, gated by `make compare` staying OK):**

1. Add the `MODERN ⇒ NONMATCHING/BUGFIX` block to `include/global.h` (verbatim
   from StanHash/fe8). Confirm `make compare` still OK (no `-DMODERN` anywhere).
2. Add the `nonmatching` target + `NONMATCH_CFILES`/`NONMATCH_OBJECTS` to the
   Makefile; add `nonmatching` to `.PHONY`. Create empty `src/nonmatching/`.
3. **One pilot function** carrying both halves: keep its `asm/<fn>.s` (oracle),
   add `src/nonmatching/<fn>.c` (the readable body, from an m2c seed +
   hand-clean). Verify `make compare` → OK **and** `make nonmatching` builds the
   pilot. (Promote the existing
   `nonmatchings/efxmagic_coretail/banim-efxmagic-coretail.c` — already a
   readable body — into the tracked tier as the pilot.)
4. Add the two lints (`check_layout.py` assertion + `make check-nonmatching`)
   and the `calcprogress.py` (c)-line.

**How it composes with in-flight work:**

- **gbadisasm scaling:** every asm carve *is* the byte source and the oracle —
  unchanged. NON_MATCHING C layers on top opportunistically; the two scale
  independently. Carve breadth (bytes) is never gated on readability (C).
- **bindiff / funclib (US↔JP map):** the funclib map names the **US C function**
  to port as the NON_MATCHING body — turning "write readable C from scratch"
  into "port the US source, re-point offsets" (exactly the CLAUDE.md
  copy-US-then-adjust workflow). This makes Stage 3 cheap for the large
  region-different-but-structurally-similar set and feeds the permuter a strong
  seed (US C often permutes to score 0 with minor nudges).

**Cost / risk (honest):**

- *Cost:* small. ~1 global.h block, ~4 Makefile lines, ~2 lint snippets, ~1
  calcprogress line. No change to the carve, gen_layout, or the oracle.
- *Risk — oracle contamination:* eliminated by construction (two locks above);
  the proposed `check_layout` assertion makes it a committed lint, not just a
  convention.
- *Risk — metric dishonesty:* eliminated by the separate (c)-line; matched-%
  stays oracle-only.
- *Residual cost:* the staging C is maintenance surface that can drift from the
  asm (it's never linked, so nothing catches drift automatically). Mitigation:
  treat `src/nonmatching/<fn>.c` as *documentation of intent*, graduate
  aggressively via the permuter, and keep the volatile permuter scratch in
  gitignored `nonmatchings/`. Do **not** let the staging tier accumulate
  unbounded — its purpose is to feed graduation, not to be a permanent parallel
  source.

Log D26 in `docs/decisions.md` and on project board #14.
