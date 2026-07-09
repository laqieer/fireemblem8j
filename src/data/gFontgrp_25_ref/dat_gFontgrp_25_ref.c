#include "global.h"
#include "fontgrp.h"

/* gFontgrp_25: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph SjisGlyphs_0857DCB4;

SECTION(".rodata.dat_gFontgrp_25_ref") struct Glyph gFontgrp_25 = {
    .sjisNext = (struct Glyph *)&SjisGlyphs_0857DCB4,
    .sjisByte1 = 0x83,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00003300, 0x0000EEF0,
        0x0000EEEC, 0x000033EC, 0x000000EC, 0x000003EC,
        0x00000EAC, 0x00003BEC, 0x00000CEC, 0x000000EC,
        0x000000EC, 0x000000EC, 0x00000030, 0x00000000,
    },
};
