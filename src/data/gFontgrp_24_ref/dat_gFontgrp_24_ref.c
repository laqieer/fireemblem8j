#include "global.h"
#include "fontgrp.h"

/* gFontgrp_24: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_357;

SECTION(".rodata.dat_gFontgrp_24_ref") struct Glyph gFontgrp_24 = {
    .sjisNext = (struct Glyph *)&gFontgrp_357,
    .sjisByte1 = 0x83,
    .width = 0x06,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000030,
        0x000000EC, 0x000000EC, 0x000000EC, 0x000003EC,
        0x00000EAC, 0x00003BEC, 0x00000CEC, 0x000000EC,
        0x000000EC, 0x000000EC, 0x00000030, 0x00000000,
    },
};
