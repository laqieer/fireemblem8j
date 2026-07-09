#include "global.h"
#include "fontgrp.h"

/* gFontgrp_45: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph dat_gFontgrp_0857E32C_ref;

SECTION(".rodata.dat_gFontgrp_45_ref") struct Glyph gFontgrp_45 = {
    .sjisNext = (struct Glyph *)&dat_gFontgrp_0857E32C_ref,
    .sjisByte1 = 0x83,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x0000FC00, 0x00036700,
        0x0003BAC0, 0x0003EEFC, 0x0003AAAB, 0x0000FEFC,
        0x0000EEEC, 0x0000EEEC, 0x00039EE7, 0x0003BEDB,
        0x0003BEFB, 0x0000CECC, 0x00000300, 0x00000000,
    },
};
