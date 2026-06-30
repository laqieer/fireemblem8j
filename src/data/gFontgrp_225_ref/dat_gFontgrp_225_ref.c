#include "global.h"
#include "fontgrp.h"

/* gFontgrp_225: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df4_uistuff_020_59BFE4;

SECTION(".rodata.dat_gFontgrp_225_ref") struct Glyph gFontgrp_225 = {
    .sjisNext = (struct Glyph *)&frontier_df4_uistuff_020_59BFE4,
    .sjisByte1 = 0x82,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000B0B,
        0x00000B0B, 0x00000B8B, 0x000002EC, 0x000002EC,
        0x000002EC, 0x000000B0, 0x000000B0, 0x00000000,
    },
};
