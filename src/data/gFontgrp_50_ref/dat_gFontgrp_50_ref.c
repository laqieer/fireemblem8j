#include "global.h"
#include "fontgrp.h"

/* gFontgrp_50: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df4_uistuff_004_57CF7C;

SECTION(".rodata.dat_gFontgrp_50_ref") struct Glyph gFontgrp_50 = {
    .sjisNext = (struct Glyph *)&frontier_df4_uistuff_004_57CF7C,
    .sjisByte1 = 0x83,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000C00,
        0x00003B00, 0x00003B00, 0x00003B3C, 0x00003BEC,
        0x00003BB0, 0x00000EC0, 0x00003AC0, 0x0000EEC0,
        0x0000F3BC, 0x000000EB, 0x0000003C, 0x00000000,
    },
};
