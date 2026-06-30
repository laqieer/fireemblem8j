#include "global.h"
#include "fontgrp.h"

/* gFontgrp_218: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph data_0859848C;

SECTION(".rodata.dat_gFontgrp_218_ref") struct Glyph gFontgrp_218 = {
    .sjisNext = (struct Glyph *)&data_0859848C,
    .sjisByte1 = 0x83,
    .width = 0x09,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x0000BFFF, 0x0000BAAB, 0x0000B00B, 0x0000B00B,
        0x0000B00B, 0x0000B000, 0x0000B800, 0x00002C00,
        0x00000E00, 0x00000B80, 0x000002E0, 0x000000B0,
    },
};
