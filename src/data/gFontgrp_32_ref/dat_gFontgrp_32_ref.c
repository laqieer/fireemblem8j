#include "global.h"
#include "fontgrp.h"

/* gFontgrp_32: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_358;

SECTION(".rodata.dat_gFontgrp_32_ref") struct Glyph gFontgrp_32 = {
    .sjisNext = (struct Glyph *)&gFontgrp_358,
    .sjisByte1 = 0x83,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x0000CC00, 0x0003BB00,
        0x0003BB30, 0x0000CCEC, 0x00003BEC, 0x0000E7EC,
        0x0000ECEC, 0x0000ECEC, 0x00039CEC, 0x0003B0DB,
        0x0003B03B, 0x0003B03B, 0x0000C00C, 0x00000000,
    },
};
