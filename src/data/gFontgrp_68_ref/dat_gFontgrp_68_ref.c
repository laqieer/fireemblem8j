#include "global.h"
#include "fontgrp.h"

/* gFontgrp_68: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph data_0857D48C;

SECTION(".rodata.dat_gFontgrp_68_ref") struct Glyph gFontgrp_68 = {
    .sjisNext = (struct Glyph *)&data_0857D48C,
    .sjisByte1 = 0x83,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x0000000F,
        0x0000303B, 0x0000ECEC, 0x0000ECF0, 0x0000EC00,
        0x0000E700, 0x00003B00, 0x000039C0, 0x00000EF0,
        0x0000039C, 0x000000EB, 0x0000003F, 0x00000000,
    },
};
