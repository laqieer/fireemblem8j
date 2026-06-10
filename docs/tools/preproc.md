# preproc — `INCBIN_U8(...)` expander for typed-C assets

This is the **US decomp's** `preproc` (`../fireemblem8u/tools/preproc`), a small
C++11 program. It is **not** pret's charmap preproc: it expands
`INCBIN_{S8,U8,S16,U16,S32,U32}("path"[, off[, size]]...)` directives in a C
source into brace-enclosed integer initializer lists, reading the referenced
binary at build time (everything else passes through verbatim).

## Why we vendor it (Phase 0, supporting)

It is the mechanism that lets an extracted asset live in **typed C**
(`src/data/*.c`) as, e.g.

```c
u8 Img_MenuScrollBar[] = INCBIN_U8("graphics/misc/Img_MenuScrollBar.4bpp.lz");
```

instead of a raw `.incbin` in assembly — exactly how FE8U pulls rebuilt gbagfx
output into the ROM. FE8J's pilot currently uses an `asm/*.s` `.incbin` of the
rebuilt `.lz` (no preproc needed yet); preproc is vendored now so that when the
C data front (`src/data/*.c`) is stood up, the agbcc pipeline can run
`preproc → cpp → iconv → agbcc` like the US decomp, and graphics can move into
typed C arrays.

## Setup

```bash
scripts/tools/preproc/setup.sh
```

Idempotent. Stages `preproc.cpp` from `../fireemblem8u/tools/preproc` (override
with `FE8U=/path`; this INCBIN-expander variant is FE8-specific, so the US tree
is required — there is no clean pret upstream for it), builds with `g++ -O2`, and
smoke-tests that `INCBIN_U8` expands to `{0x01,0x02,0x03,0x04}`. The binary lands
in the **gitignored** `tools/preproc/preproc`; the setup script + this doc are
tracked.

## Usage

```bash
tools/preproc/preproc src/data/foo.c   # expanded C on stdout
```

Argument grammar mirrors GNU `as` `.incbin`: `"path" [, offset [, size]]` per
file, repeatable for concatenation. The file size must be a multiple of the
element width (1/2/4 bytes for the U8/U16/U32 variants).

When the C data pipeline is added to the root `Makefile`, the recipe will look
like the US decomp's:

```make
$(DATA_SRC_C_OBJECTS): %.o: %.c $(PREPROC)
	$(PREPROC) $< | $(CPP) $(CPPFLAGS) - | iconv -f UTF-8 -t CP932 | $(CC1) ... -o $*.s
	$(AS) $(ASFLAGS) $*.s -o $@
```
