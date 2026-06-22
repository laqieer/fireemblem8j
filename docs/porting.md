# Per-translation-unit porting playbook

The proven recipe for decompiling one US translation unit into the JP build,
byte-perfect. Validated end-to-end by `src/rng.c` (see commit history).

## Tools (all in `scripts/`)

| Tool | Purpose | Output |
|------|---------|--------|
| `match_us_jp.py`  | locate US functions in the JP ROM       | `layout/us_jp_funcmap.tsv`, `sym_jp.txt` |
| `data_addr_map.py`| US→JP address map from literal pools     | `layout/addr_map.tsv` |
| `gen_layout.py`   | manifests → `asm/baserom.s`, `ldscript.txt`, `asm/jp_syms.s` | (run via `make layout`) |

`layout/addr_map.tsv` translates **any** US address (function or data) to its JP
address; `layout/us_jp_funcmap.tsv` maps function *names*.

## Steps

1. **Pick a TU** from the US `ldscript.txt` order (decompile roughly in ROM
   order so gaps stay simple). Copy `../fireemblem8u/src/X.c` → `src/X.c` and any
   missing headers it needs.

2. **Find its JP placement.** Look up each of the TU's functions in
   `us_jp_funcmap.tsv`. The `.text` span is `[first_jp_addr, last_jp_addr+size)`.
   For unmatched functions (e.g. ones calling `__modsi3`), infer the address by
   contiguity — JP function order equals US order.

3. **Locate the TU's own `.rodata`/`.data`.** Compile to an object and
   `objcopy -O binary -j .rodata`. If the section has no internal pointers,
   search the JP ROM for its bytes (unique hit = its JP address). Otherwise
   translate the US `.rodata` address via `addr_map.tsv`.

4. **Resolve external references.** Compile, then `arm-none-eabi-nm -u src/X.o`.
   For each undefined symbol:
   * a function → JP address from `us_jp_funcmap.tsv`
   * a data global → JP address from `addr_map.tsv` (look up its US address).
     **Check the `votes`/`conflicts` columns**: a single-vote entry (often from
     one masked match) can be wrong — sanity-check the region (an IWRAM `0x03..`
     global should not map to an EWRAM `0x02..` or an odd address). Verify
     low-confidence data addresses by disassembling a JP function that uses them.
   * libgcc/libc helper (`__divsi3`, `memcpy`, …) → from `us_jp_funcmap.tsv`
   Add any not-yet-present ones to `layout/baseline_syms.tsv`
   (`name  jp_addr  thumb|arm|data`). **Typed Thumb is essential** — it makes the
   linker emit a direct `BL` with no interwork veneer.

5. **Place RAM sections.** Add the TU's `.bss`/`.data`/COMMON to
   `layout/carved_ram.tsv` at their JP addresses (from `addr_map.tsv`) so the
   `.text` literals resolve. RAM sections are NOLOAD (not in the ROM).

6. **Register the carve.** Add the `.text` (and `.rodata`/`.data`) ranges to
   `layout/carved_rom.tsv`.

7. **Generate & verify.**
   ```bash
   make layout && make compare
   ```
   Must end with `fireemblem8.gba: OK`. If it does, the TU matched the JP ROM
   byte-for-byte; commit. If not, diff the produced range against the ROM and fix
   (usually a wrong/ missing symbol address, or a genuine region-different
   function — see below).

## When bytes don't match

* **Off by a constant in every BL/literal** → the section landed at the wrong
  address (check the carve range / a missing earlier carve).
* **A few BL instructions differ** → wrong helper address, or a veneer crept in
  (symbol not declared typed-Thumb in `baseline_syms.tsv`).
* **A literal pointer differs** → that data global's JP address is wrong; verify
  via `addr_map.tsv`, or it isn't placed yet.
* **Whole function differs** → genuinely region-specific (text/font/menu/save).
  Decompile it against the JP behaviour rather than copying US verbatim.

## Scaling

Functions calling only mapped symbols + own data are portable now. For what
remains as the active work list, see `docs/frontier.md` (single source of truth
for the remaining work). Track progress on the project board.
