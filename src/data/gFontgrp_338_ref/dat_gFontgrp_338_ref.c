#include "global.h"
#include "fontgrp.h"

/* gFontgrp_338: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_356;

SECTION(".rodata.dat_gFontgrp_338_ref") struct Glyph gFontgrp_338 = {
    .sjisNext = (struct Glyph *)&gFontgrp_356,
    .sjisByte1 = 0xFA,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00003FFC,
        0x0000EAAB, 0x00003FEB, 0x00003AAB, 0x0000EBFC,
        0x0000EBEB, 0x00003AAC, 0x00000FF0, 0x00000000,
    },
};
