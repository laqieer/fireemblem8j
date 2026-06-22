# FE8J decomp frontier (living doc — update every session)

> **This is the SINGLE SOURCE OF TRUTH for what remains.** All other docs (README,
> CLAUDE.md, strategy/porting/etc.) point here for "the frontier / what's left" and
> must not fork it. Do **not** read `layout/nofuncmap_*.tsv` as the work list — it is
> a stale, ~10× inflated classification cache (see "Pitfall" below).

**Keep this current.** Refresh the numbers from `scripts/calcprogress.py` and the target lists from
ground truth whenever an axis moves. Stale frontier data caused real wasted work (see "Pitfall" below).

## Current state (2026-06-22)
- BUILD SELF-CONTAINMENT: 100%
- **MATCHING-C: 95.57%** (8150/8528 funcs) → **~378 functions genuinely unmatched**
- EXTRACTED DATA: 100% of the measured set (but data is ~94% of ROM; see Data frontier)
- NAMED SYMBOLS: 85.24% (capped by ~1611 asset labels fe8u itself doesn't name — structurally < 100%)

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
- **~432 `asm/sub_*.s` stubs** (region-different gbadisasm code) — the bulk of the real frontier.
- plus any named region-diff `.s` and functions still inside the `asm/baserom.s` incbin.

A target is REAL **iff** it is still in `asm/` (a `sub_<H>.s` exists, or still in the baserom incbin)
and is **not** already a `src/*.c` (including carved-as `src/<module>_<addr>.c`). Before dispatching a
team, **spot-check a sample** — if they're already carved, the list is stale; fix it first.

### Ground-truth reality check (2026-06-22) — the remainder is HARD, not a sweep
The 432 `sub_*.s` stubs are **scattered across all ROM regions** (0x080Axxxx:65, 0x0800xxxx:55,
0x080Dxxxx:44, …), **mostly UNNAMED** `sub_<hex>`, and **region-different**. The JP "areas" above
(sio, name-entry, augury, save) are **already largely carved** under `sub_<addr>`/`module_addr` names
— so they are a *priority lens*, not a pool of easy named ports. The fe8u-module subsystem-sweep
approach is EXHAUSTED (a 6-team sweep this session produced ~0 net-new matching-C). The remaining work
is **function-by-function reconstruction** (IDA/Ghidra decompile → idiomatic C → byte-match, playbook §9)
plus **decomp-permuter-agbcc** for the reg-alloc/instruction-order near-misses. Dispatch SMALL bounded
batches of specific `sub_<H>` addresses, not module names. The big parallel lever left is the **data
frontier** (data is ~94% of ROM; port fe8u `scripts/gfxtools/`).

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
