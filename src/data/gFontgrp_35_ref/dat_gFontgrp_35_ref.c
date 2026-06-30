#include "global.h"
#include "fontgrp.h"

/* gFontgrp_35: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_347;

SECTION(".rodata.dat_gFontgrp_35_ref") struct Glyph gFontgrp_35 = {
    .sjisNext = (struct Glyph *)&gFontgrp_347,
    .sjisByte1 = 0x83,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00003300, 0x0000EECC,
        0x0000EEFB, 0x0000333B, 0x00000F3B, 0x00003AFB,
        0x00000FAB, 0x000000FB, 0x0000003B, 0x0000003B,
        0x00000FFB, 0x00003AAC, 0x00000FF0, 0x00000000,
    },
};
