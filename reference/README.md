# `reference/` — curated external US↔JP maps

Curated **reference data** for the FE8 Japanese decomp: US↔JP address correspondences
harvested from external sources. These are **not build inputs** — nothing here is read by
`gen_layout.py`/`make`, so they cannot affect `make compare`. They are a lookup resource for
triaging region-same vs region-different data and for naming JP addresses from the
better-documented US side. (Tracked in issue #32; see `docs/decisions.md` D15.)

## Files (`reference/maps/`)

| File | Rows | Columns | What |
|---|---|---|---|
| `febuilder_rom_us_jp.tsv` | 302 | `name  jp_vma  us_vma  region  exact_symbol  nearest_symbol_off  source` | FEBuilderGBA ROM table/struct base addresses, joined US↔JP by field name, cross-walked to US-decomp symbols. |
| `febuilder_dynamic.tsv` | 9 | `name  jp_vma  us_vma  region  exact_symbol  nearest_symbol_off  candidate_offsets_jp  source` | The 9 FEBuilder `FindROMPointer` (dynamic) entries, resolved against the real ROMs by pointer dereference. |
| `ram_us_jp.tsv` | 697 | `us_symbol  us_addr  jp_addr  region  kind  source` | US↔JP RAM (EWRAM/IWRAM) map: US-decomp `nm` RAM symbols + FEBuilder `workmemory_*` JP/US pairs. (First non-`#` line is the column header.) |
| `extract_febuilder_map.py` | — | (in `scripts/`) | Reproducible extractor for the ROM map (re-run to regenerate). `build_ram_us_jp.py` (in `reference/maps/`) builds the RAM map. |

Addresses are VMAs (`0x08…`/`0x09…` ROM, `0x02…`/`0x03…` RAM). `region` is **byte-evidence-based**
(`same` only if the JP/US bytes actually match — many `same` rows have *different* JP/US addresses but
identical bytes; never inferred from `us==jp`). `region=diff` ⇒ region-different (the JP placement is
the value). RAM rows with no JP evidence have `jp_addr = -` / `region = unverified` (never a fabricated
`jp==us`).

## Value

**291 of 302 (96%)** of the FEBuilder ROM addresses are **not** in `layout/addr_map.tsv` — that map only
covers addresses referenced by located functions' literal pools, so unreferenced table bases (esp.
ROM-tail assets) were missing. This fills exactly that gap, and supplies named JP symbols (via the
US-decomp crosswalk) + an explicit US↔JP RAM map (RAM is **not** identical across versions).

## Sources & licensing

- **FEBuilderGBA** (`ROMFE8JP.cs` / `ROMFE8U.cs`, GPL-3.0) — the ROM definition addresses. We derive a
  **fact table of addresses** (addresses are not copyrightable) with attribution; **no FEBuilder code or
  comment text is copied** — the `source` column cites only `ROMFE8{JP,U}.cs:<line>`.
- **US decomp** `../fireemblem8u/fireemblem8.elf` (`nm`) — the symbol-name crosswalk + named RAM symbols.
- **JP/US ROMs** — for the byte-evidence `region` tags.

## Using these maps

- **Triage:** `region=same` ⇒ the JP bytes equal the US bytes (carve directly / region-same). `region=diff`
  ⇒ region-different at the given JP placement.
- **Naming:** `exact_symbol` (or `nearest_symbol_off`) is the US-decomp name for the structure at `us_vma`.
- **Later integration (deliberate, validated, per-symbol — not done here):** a follow-up can emit selected
  rows as `layout/baseline_syms.d/*.tsv` fragments (`<exact_symbol>  <jp_vma>  data|thumb`) so decompiled
  code can reference a named global at its JP address, and/or seed `layout/addr_map` with the `(us_vma,
  jp_vma)` pairs. Validate each against `addr_map`/byte-evidence before wiring it into the build.

`make compare` remains the only oracle.
