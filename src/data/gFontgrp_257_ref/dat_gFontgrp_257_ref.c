#include "global.h"
#include "fontgrp.h"

/* gFontgrp_257: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df4_uistuff_014_598E64;

SECTION(".rodata.dat_gFontgrp_257_ref") struct Glyph gFontgrp_257 = {
    .sjisNext = (struct Glyph *)&frontier_df4_uistuff_014_598E64,
    .sjisByte1 = 0x82,
    .width = 0x09,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x0000000B, 0x00002E0B,
        0x00002ECB, 0x00000ACB, 0x0000008B, 0x0000000B,
        0x0000000B, 0x0000000B, 0x0000B00B, 0x0000B00B,
        0x00002C0B, 0x00002E0B, 0x00000BAE, 0x000002F8,
    },
};
