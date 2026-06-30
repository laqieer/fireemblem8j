#include "global.h"
#include "fontgrp.h"

/* gFontgrp_116: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df3_fontgrp_se_002_57FACC;

SECTION(".rodata.dat_gFontgrp_116_ref") struct Glyph gFontgrp_116 = {
    .sjisNext = (struct Glyph *)&frontier_df3_fontgrp_se_002_57FACC,
    .sjisByte1 = 0x82,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x000003C0,
        0x00000DB0, 0x00003AC0, 0x00000F00, 0x00003EC0,
        0x0000EEF0, 0x000399EC, 0x0003BBEC, 0x0003BBDB,
        0x0003BBBB, 0x0000CECC, 0x00000300, 0x00000000,
    },
};
