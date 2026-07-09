#include "global.h"
#include "fontgrp.h"

/* gFontgrp_222: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph dat_gFontgrp_085985AC_ref;

SECTION(".rodata.dat_gFontgrp_222_ref") struct Glyph gFontgrp_222 = {
    .sjisNext = (struct Glyph *)&dat_gFontgrp_085985AC_ref,
    .sjisByte1 = 0x83,
    .width = 0x09,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x0000000B, 0x0000002E, 0x0000B0B8, 0x0000B0A0,
        0x0000B800, 0x00002C00, 0x00002E00, 0x00000B00,
        0x00000B80, 0x000002E0, 0x000000BA, 0x0000002F,
    },
};
