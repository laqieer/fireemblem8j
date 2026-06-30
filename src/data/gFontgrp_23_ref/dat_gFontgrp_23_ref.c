#include "global.h"
#include "fontgrp.h"

/* gFontgrp_23: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_353;

SECTION(".rodata.dat_gFontgrp_23_ref") struct Glyph gFontgrp_23 = {
    .sjisNext = (struct Glyph *)&gFontgrp_353,
    .sjisByte1 = 0x83,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00003300, 0x0000EEF0,
        0x0000EEAC, 0x000033F0, 0x00003FFC, 0x0000EAAB,
        0x00003EFC, 0x00000EC0, 0x00000EC0, 0x00000E70,
        0x000003B0, 0x000000EC, 0x00000030, 0x00000000,
    },
};
