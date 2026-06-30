#include "global.h"
#include "fontgrp.h"

/* gFontgrp_89: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_361;

SECTION(".rodata.dat_gFontgrp_89_ref") struct Glyph gFontgrp_89 = {
    .sjisNext = (struct Glyph *)&gFontgrp_361,
    .sjisByte1 = 0x82,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x000000C0,
        0x00003FB0, 0x0000EBB0, 0x0003BEAC, 0x0000C3B0,
        0x00003FB0, 0x0000EAAC, 0x0003BFBB, 0x0003B3BB,
        0x0003B3BB, 0x0000ECEC, 0x00003030, 0x00000000,
    },
};
