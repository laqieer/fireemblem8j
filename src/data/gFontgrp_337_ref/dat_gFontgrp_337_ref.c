#include "global.h"
#include "fontgrp.h"

/* gFontgrp_337: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph data_0857DA2C;

SECTION(".rodata.dat_gFontgrp_337_ref") struct Glyph gFontgrp_337 = {
    .sjisNext = (struct Glyph *)&data_0857DA2C,
    .sjisByte1 = 0xFA,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000000, 0x00000000, 0x00000FF0,
        0x00003AAC, 0x00003AEB, 0x00003AEB, 0x00003AEB,
        0x0000EAAB, 0x0000FAFC, 0x00003F00, 0x00000000,
    },
};
