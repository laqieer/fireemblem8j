#include "global.h"
#include "fontgrp.h"

/* gFontgrp_33: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph data_0857DEF4;

SECTION(".rodata.dat_gFontgrp_33_ref") struct Glyph gFontgrp_33 = {
    .sjisNext = (struct Glyph *)&data_0857DEF4,
    .sjisByte1 = 0x83,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x0000FC00, 0x00036700,
        0x0003BB30, 0x00036CEC, 0x0000FBEC, 0x0000ECEC,
        0x0000ECEC, 0x0000ECEC, 0x00039CEC, 0x0003B03B,
        0x0003B03B, 0x0003B03B, 0x0000C00F, 0x00000000,
    },
};
