# FE8J decomp frontier (living doc — update every session)

**Keep this current.** Refresh the numbers from `scripts/calcprogress.py` and the target lists from
ground truth whenever an axis moves. Stale frontier data caused real wasted work (see "Pitfall" below).

## Current state (2026-06-22)
- BUILD SELF-CONTAINMENT: 100%
- **MATCHING-C: 95.44%** (8139/8528 funcs) → **~389 functions genuinely unmatched**
- EXTRACTED DATA: 100% of the measured set (but data is ~94% of ROM; see Data frontier)
- NAMED SYMBOLS: 85.23% (capped by ~1611 asset labels fe8u itself doesn't name — structurally < 100%)

## Code frontier — priority order (USER-DEFINED, JP-area-first)
The remaining matching-C work is JP-only / JP-divergent code that **cannot be ported from fe8u** and
needs real reconstruction (asm → behavior → idiomatic C → byte-match). Work these areas first:
1. **sio / link-arena** — link/multiplayer arena (`sio_battlemap`, `sio_uiutils`, `LinkArena*`)
2. **name-entry / kana** — JP kana name-input screen (JP-exclusive UI)
3. **debug / augury** — `bmdebug` + the 占い/augury fortune feature
4. **worldmap** — `worldmap_*`
5. **save / 周回** — save menu + New Game+/周回 (`savemenu`, `savedraw`)

## How to find REAL targets (ground truth — NOT the stale tsv lists)
The unmatched frontier = functions whose `.text` still comes from `asm/` (what calcprogress counts):
- **~440 `asm/sub_*.s` stubs** (region-different gbadisasm code) — the bulk of the real frontier.
- plus any named region-diff `.s` and functions still inside the `asm/baserom.s` incbin.

A target is REAL **iff** it is still in `asm/` (a `sub_<H>.s` exists, or still in the baserom incbin)
and is **not** already a `src/*.c` (including carved-as `src/<module>_<addr>.c`). Before dispatching a
team, **spot-check a sample** — if they're already carved, the list is stale; fix it first.

### ⚠️ Pitfall (do not repeat)
`layout/nofuncmap_region_*.tsv` is a **stale, un-pruned classification cache**: it lists ~3,926
entries but only ~389 are truly unmatched (≈10× inflated; addresses for region-different entries are
also stale/wrong). **Never define a work frontier from it.** Reconcile any scope discrepancy against
calcprogress (389) before spending team effort. Regenerate via `scripts/classify_nofuncmap.py` if the
canonical lists are needed, but the `asm/sub_*.s` set is the authoritative remainder.

## Data frontier (future — data is ~94% of the ROM)
- Port fe8u `scripts/gfxtools/` (tsa_generator.py) — FE8J Makefile feimg/fetsa rules are already wired
  → unblocks btl_bg + worldmap graphics (bulk of graphics volume).
- JP Huffman **text tree differs from US** → re-encode or named-incbin; biggest data target.
- Port the `dump_*.py` family + `scripts/texttools/`. See `docs/fe8u_decomp_history.md` for the order
  fe8u extracted data and the pitfalls (palette bit-15 0x7FFF, gbagfx flags, mid2agb caveats).

## Genuine exclusions (not winnable as C)
Hand-written asm (`arm.s`, `arm_call.s`, m4a `m4a_1.s`, Sram fast funcs) + ARM-mode funcs + libc/libgcc.
These stay as asm by design; do not grind them.
