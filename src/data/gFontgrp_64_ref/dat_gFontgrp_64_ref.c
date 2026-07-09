#include "global.h"
#include "fontgrp.h"

/* gFontgrp_64: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph SjisGlyphs_0857D36C;

SECTION(".rodata.dat_gFontgrp_64_ref") struct Glyph gFontgrp_64 = {
    .sjisNext = (struct Glyph *)&SjisGlyphs_0857D36C,
    .sjisByte1 = 0x83,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x0000FFFF,
        0x0000EAAB, 0x0000EFFB, 0x0000EC3B, 0x0000EC3B,
        0x0000EC3B, 0x0000EC3B, 0x0000EC0C, 0x0000E700,
        0x000039C0, 0x00000EB0, 0x000003C0, 0x00000000,
    },
};
