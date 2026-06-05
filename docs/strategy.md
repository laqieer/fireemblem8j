# Porting strategy: US decomp → JP ROM

## The core insight

`Fire Emblem - Seima no Kouseki (J)` (`BE8J`) and `Fire Emblem - The Sacred
Stones (U)` (`BE8E`) were built from the **same Intelligent Systems C source by
the same compiler** (agbcc / GCC 2.95). Therefore, for the great majority of
functions, *the US `.c` file, recompiled and re-linked at the JP addresses,
produces byte-identical JP machine code automatically.* The linker fills in the
JP absolute addresses; the instruction stream is otherwise the same.

What actually differs between the two ROMs:

1. **Embedded addresses** — every literal-pool word / data pointer differs
   because data lives at different ROM/RAM addresses. These are resolved by the
   linker once the layout (`ldscript.txt`) matches JP. *Not* hand-work.
2. **Data content** — Japanese text/script (huge), fonts (JP uses a JIS font),
   some graphics, and a handful of tables sized differently.
3. **A small set of genuinely region-different functions** — text rendering,
   font/glyph handling, menu geometry, save-data versioning, region checks.

So the project is dominated by **(a)** discovering the JP layout and **(b)**
extracting JP data, not by rewriting logic.

## Measured ROM facts (US vs JP, 16 MB each)

* Header `0x00–0xBF`: differs only in title/game-code/complement-checksum.
* First post-header divergence at `0x224`: an IWRAM pointer (`0x03003090` JP vs
  `0x030030F0` US) — i.e. boot code is identical except for a RAM symbol address.
* `0xC00000–0x1000000` (~4 MB, the ROM tail) is **byte-identical** between the
  two — shared assets (sound/music engine data, some graphics). These can be
  carved out as shared `.incbin` data with near-zero effort.
* ~29 % of all bytes match even under a naive position-wise compare.

## The baseline (where we start)

`asm/baserom.s` incbins the entire ROM and `ldscript.txt` places it at
`0x08000000`, so `make compare` is `OK` immediately. This guarantees a always-
matching ROM and gives a monotonic progress metric: *bytes still inside the
incbin vs. bytes produced by real source*.

## The decompilation loop (per region/function)

1. **Locate the JP twin of a US symbol.** Take the US function's compiled bytes
   (from `fireemblem8u`'s `.map` + ELF), mask out literal-pool / relocated words,
   and pattern-search the JP ROM. The match gives `US symbol → JP address`.
   Build this mapping in bulk (it reconstructs most of the JP `ldscript`).
2. **Carve the range** out of `asm/baserom.s` (split the incbin into
   `…before… + <object> + …after…`) and insert the new object in `ldscript.txt`
   at the JP address.
3. **Provide the source:**
   * Code → copy the US `src/x.c` (+ needed headers) and compile. If the bytes
     match the JP ROM range, done. If not, diff and adjust (usually a data
     pointer that isn't placed yet, occasionally real logic).
   * Data → extract from the JP ROM with the `dump_*.py` tooling (ported from
     the US decomp) into typed C / asm.
4. **Verify** `make compare` stays `OK` after every carve. Never regress.

## Order of work (epics)

1. **Bootstrap & infra** — build system, toolchain, CI, checksum. *(this commit)*
2. **Layout discovery** — bulk `US symbol → JP address` map; reconstruct
   `ldscript.txt`; identify code vs data regions.
3. **Shared-tail reuse** — carve the byte-identical `0xC00000+` assets.
4. **Code porting** — recompile US C per translation unit, matching JP; fix the
   region-different functions.
5. **JP data extraction** — text/script (largest), fonts, graphics, tables.
6. **Completion** — 100 % of the incbin replaced; documentation; reproducible CI.

## Tooling reused from `../fireemblem8u`

* `tools/agbcc` — the matching compiler (copied in; gitignored).
* `scripts/dump_*.py` — data extractors (re-point at JP offsets).
* `scripts/func_re_workflow.js` etc. — AI RE workflows for naming.
* `asmdiff.sh` / shiftcheck — diff & pointer-shiftability auditing.
