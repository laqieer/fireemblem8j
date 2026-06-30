#include "global.h"
#include "fontgrp.h"

/* gFontgrp_335: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df4_uistuff_003_57CC64;

SECTION(".rodata.dat_gFontgrp_335_ref") struct Glyph gFontgrp_335 = {
    .sjisNext = (struct Glyph *)&frontier_df4_uistuff_003_57CC64,
    .sjisByte1 = 0xFA,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000FF0,
        0x00003AAC, 0x0000EBEB, 0x00003AFF, 0x00000FB0,
        0x0000FFAC, 0x0000EAAB, 0x0000FFFF, 0x00000000,
    },
};
