#include "global.h"
#include "fontgrp.h"

/* gFontgrp_340: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_355;

SECTION(".rodata.dat_gFontgrp_340_ref") struct Glyph gFontgrp_340 = {
    .sjisNext = (struct Glyph *)&gFontgrp_355,
    .sjisByte1 = 0xFA,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00003FFF,
        0x0000EAAB, 0x0000EBEB, 0x00003AFF, 0x00000EB0,
        0x00000EB0, 0x00000EB0, 0x00000FF0, 0x00000000,
    },
};
