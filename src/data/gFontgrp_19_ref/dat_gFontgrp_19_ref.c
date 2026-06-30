#include "global.h"
#include "fontgrp.h"

/* gFontgrp_19: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_350;

SECTION(".rodata.dat_gFontgrp_19_ref") struct Glyph gFontgrp_19 = {
    .sjisNext = (struct Glyph *)&gFontgrp_350,
    .sjisByte1 = 0x83,
    .width = 0x06,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000CCC,
        0x00003BBB, 0x00003BBB, 0x00003BBB, 0x00003BCC,
        0x00000EF0, 0x000003AC, 0x000000F0, 0x00000000,
    },
};
