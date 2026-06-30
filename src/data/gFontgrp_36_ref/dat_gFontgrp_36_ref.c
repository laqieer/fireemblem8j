#include "global.h"
#include "fontgrp.h"

/* gFontgrp_36: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df4_uistuff_005_57DFCC;

SECTION(".rodata.dat_gFontgrp_36_ref") struct Glyph gFontgrp_36 = {
    .sjisNext = (struct Glyph *)&frontier_df4_uistuff_005_57DFCC,
    .sjisByte1 = 0x83,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x0000FC00, 0x0003670C,
        0x0003BB3B, 0x0003673B, 0x0000FF3B, 0x00003AFB,
        0x00000FAB, 0x000000FB, 0x0000003B, 0x0000003B,
        0x00000FFB, 0x00003AAC, 0x00000FF0, 0x00000000,
    },
};
