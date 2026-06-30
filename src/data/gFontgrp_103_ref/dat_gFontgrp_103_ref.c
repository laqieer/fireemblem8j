#include "global.h"
#include "fontgrp.h"

/* gFontgrp_103: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph frontier_df3_fontgrp_se_000_57E884;

SECTION(".rodata.dat_gFontgrp_103_ref") struct Glyph gFontgrp_103 = {
    .sjisNext = (struct Glyph *)&frontier_df3_fontgrp_se_000_57E884,
    .sjisByte1 = 0x82,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00003300, 0x0000EECC,
        0x0000EEFB, 0x0000333B, 0x0000003B, 0x0000003B,
        0x0000003B, 0x0000303B, 0x0000EC3B, 0x0000EC3B,
        0x00003BFB, 0x00000EAC, 0x000003F0, 0x00000000,
    },
};
