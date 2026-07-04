# fe8u→fe8j asset-form alignment gap (#145 step-1 itemized checklist)

> Single source of truth for the #145 form-alignment frontier. Split into
> **B1 (shiftability-critical, pointer-bearing)** and **B2 (editability-only)**.
> Regenerate the numbers from the live ELF + fe8u pointer oracle (see method).
> Keep `make compare` OK + `make shiftcheck` 0 HIGH on every carve.

## Method / why `make shiftcheck` under-reports (the D345/D346 false floor)
`audit_pointers.py --true-debt --gate` = 1 (0 real) is a **false floor**: raw-hex
pointer words living *inside* typed `EventListScr[]` / `struct ProcCmd[]` shells
(`CALL(0x08xxxxxx)`, `PROC_CALL((ProcFunc)0x08..)`) carry no linker relocation, so
`make shiftcheck` cannot see them. The real debt is found by a per-symbol
un-relocated-word scan cross-checked against the fe8u relocation oracle
(`scripts/fe8u_ptr_offsets.py:fe8u_ptr_at_jp`): a word is a **real** pointer iff
fe8u relocates the corresponding JP address (vs a coincidental data/pixel constant).

Audit baseline (2026-07-04): `audit_bin_forms.py` → MISS=3 / FLOOR=1401 /
UNCERTAIN=222; `calcprogress.py` axis 3/6 → 99.31% extracted, 96,516 B opaque.
Per-symbol fe8u-oracle scan → 207 symbols with signal, 874 real pointer words.

## Summary
**B1 = 31 assets / 835 real pointers** — proc-scripts owned by #143 = 5 assets /
79 ptrs; **non-proc-script (the new #145 frontier) = 26 assets / 756 ptrs**.
**B2 = 204 bins / 96,516 B**, essentially pointer-free (mostly FLOOR).

---

## B1 — shiftability-critical, non-proc-script → the #145 carve frontier
26 chapter/tower **event-script** tables (the `frontier_*` positional names are
misleading — these are `EventListScr[]` chapter events, not menus). Region-same
with fe8u; stored as C with raw `CALL(0x08xxxxxx)` / `EVENT_WORD(0x08..)` operands
that do not relocate. **Fix:** replace each raw operand with a symbol —
`CALL(EventScr_Sym)` / `EVENT_WORD_SYM(Sym)` — bridging targets via
`layout/us_jp_funcmap.tsv` + `layout/addr_map.tsv`. Reducible, not floor.

### Group A — `src/data/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch.c` (19 tables / 628 ptrs)
| symbol | JP range | ptrs |
|---|---|--:|
| frontier_df3_eventscr_ch_021_A6FC48 | A6FC48–A70C88 | 170 |
| frontier_df3_eventscr_ch_012_A6DE0C | A6DE0C–A6E60C | 52 |
| frontier_df3_eventscr_ch_001_A696D4 | A696D4–A69F50 | 50 |
| frontier_df3_eventscr_ch_017_A6F47C | A6F47C–A6FA2C | 45 |
| frontier_df3_eventscr_ch_002_A6A06C | A6A06C–A6A76C | 43 |
| frontier_df3_eventscr_ch_016_A6EFD8 | A6EFD8–A6F43C | 43 |
| frontier_df3_eventscr_ch_011_A6D850 | A6D850–A6DCEC | 35 |
| frontier_df3_eventscr_ch_008_A6CD00 | A6CD00–A6D2C4 | 34 |
| frontier_df3_eventscr_ch_003_A6AA20 | A6AA20–A6ADB0 | 31 |
| frontier_df3_eventscr_ch_007_A6C8CC | A6C8CC–A6CBA4 | 27 |
| frontier_df3_eventscr_ch_013_A6E680 | A6E680–A6E7DC | 25 |
| frontier_df3_eventscr_ch_005_A6B460 | A6B460–A6C000 | 22 |
| frontier_df3_eventscr_ch_010_A6D524 | A6D524–A6D758 | 19 |
| frontier_df3_eventscr_ch_014_A6EDFC | A6EDFC–A6EEC0 | 12 |
| frontier_df3_eventscr_ch_006_A6C078 | A6C078–A6C88C | 8 |
| frontier_df3_eventscr_ch_009_A6D3F8 | A6D3F8–A6D4DC | 5 |
| frontier_df3_eventscr_ch_000_A69464 | A69464–A69688 | 4 |
| frontier_df3_eventscr_ch_004_A6AE28 | A6AE28–A6B224 | 2 |
| frontier_df3_eventscr_ch_015_A6EF04 | A6EF04–A6EF3C | 1 |

### Group B — `src/data/frontier_df4_menu/frontier_df4_menu.c` (7 tables / 128 ptrs)
> ⚠️ This file is SHARED with the #143 config proc-script carve
> (`frontier_df4_menu_034_AAF9EC`) — serialize edits to it.

| symbol | JP range | ptrs | fe8u anchor |
|---|---|--:|---|
| frontier_df4_menu_008_A66F88 | A66F88–A674A0 | 29 | EventScr_Ch10A |
| frontier_df4_menu_011_A71268 | A71268–A715AC | 26 | EventScr_Ruin |
| frontier_df4_menu_012_A71CC4 | A71CC4–A71F3C | 25 | EventScr_Ruin |
| frontier_df4_menu_009_A67660 | A67660–A678CC | 19 | EventScr_Ch10A |
| frontier_df4_menu_006_A65504 | A65504–A65768 | 16 | EventScr_Ch7 |
| frontier_df4_menu_007_A657D4 | A657D4–A65AA0 | 10 | EventScr_Ch7 |
| frontier_df4_menu_010_A67EEC | A67EEC–A682EC | 3 | EventScr_Ch10A |

Highest leverage first: `frontier_df3_eventscr_ch_021_A6FC48` (170 ptrs = 22% of #145).

## B1 — proc-scripts (owned by #143, listed for completeness) — 5 assets / 79 ptrs
`frontier_df4_menu_034_AAF9EC` (config cluster, 61), `data_085C37D8` (9),
`frontier_df4_uistuff_026b_5C3798` (6), `frontier_df4_uistuff_026_5C3618` (2),
`sProcScr_DungeonRecord_UpdateNewRecordValues` (1). Fix = `PROC_CALL(RealFn)`.
The config + guide clusters are confirmed raw-hex (`.set` aliases into `.short`
blobs); their `.set`-alias attribution is why a per-symbol scan under-reports them.
Re-verify the D346 11-blocker residuals with the gba-kit A/B harness after each carve
(some may already be relocated by intervening waves — do not re-carve).

---

## B2 — editability-only (no real pointers, no shifted-ROM impact) — 96,516 B
| category | bytes / bins | fe8u form | status |
|---|---|---|---|
| `data_08BB8ED0.bin` | 43,824 / 1 | malloc/BSS scratch | genuine FLOOR |
| opaque `data_*` value blobs | 31,092 / 185 | typed C value arrays (no editable twin) | decomp-completeness only |
| `*.map.bin` / `*.tsa.bin` tilemaps | 21,600 / 18 | fe8u also keeps binary | genuine FLOOR |
| gfx tail (coincidental ptr hits) | 15 syms | indexed PNG / JASC `.pal` | reducible, NOT B1 |
| MISS bins (proven better fe8u source) | 3 | 1 PNG + 2 C literals | reducible |

## Regenerable script
`scripts/audit_formalign_gap.py` (to be added): nm `-S --defined-only` the ELF →
per-object un-relocated pointer words (objdump `-r` minus reloc offsets) → attribute
to defining symbol by nm range → classify B1-eventscr(#145) / B1-procscr(#143) /
B2-gfx-coincidental / B2-opaque via `fe8u_ptr_at_jp`. Guardrails: (a) INCBIN
`graphics/*` blobs with few `0x08..` words are coincidental → B2; (b) proc-scripts
hide under positional-alias names → attribute by nm range, not by name.
