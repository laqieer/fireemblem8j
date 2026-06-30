#include "global.h"
#include "fontgrp.h"

/* gFontgrp_71: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph gFontgrp_360;

SECTION(".rodata.dat_gFontgrp_71_ref") struct Glyph gFontgrp_71 = {
    .sjisNext = (struct Glyph *)&gFontgrp_360,
    .sjisByte1 = 0x82,
    .width = 0x06,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000C3C, 0x00003BEB, 0x00003BEB,
        0x00003BEB, 0x00003BAB, 0x00003BAB, 0x00003BAC,
        0x00000EAC, 0x00000EB0, 0x000003C0, 0x00000000,
    },
};
