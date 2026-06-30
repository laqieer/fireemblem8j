#include "global.h"
#include "fontgrp.h"

/* gFontgrp_346: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_348;

SECTION(".rodata.dat_gFontgrp_346_ref") struct Glyph gFontgrp_346 = {
    .sjisNext = (struct Glyph *)&gFontgrp_348,
    .sjisByte1 = 0x81,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x000000F0,
        0x0000C3AC, 0x0003BEFB, 0x0000EB0C, 0x00003C00,
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
    },
};
