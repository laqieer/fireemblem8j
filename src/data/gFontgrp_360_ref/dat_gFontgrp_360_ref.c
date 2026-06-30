#include "global.h"
#include "fontgrp.h"

/* gFontgrp_360: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df3_fontgrp_se_007_581A04;

SECTION(".rodata.dat_gFontgrp_360_ref") struct Glyph gFontgrp_360 = {
    .sjisNext = (struct Glyph *)&frontier_df3_fontgrp_se_007_581A04,
    .sjisByte1 = 0x81,
    .width = 0x06,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000F3F,
        0x00003AEA, 0x00003B3A, 0x00003B3A, 0x00003B3A,
        0x00003B3A, 0x00003B3A, 0x00000EEA, 0x00000EEB,
        0x000003AB, 0x000003AB, 0x000000FC, 0x00000000,
    },
};
