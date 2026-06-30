#include "global.h"
#include "fontgrp.h"

/* gFontgrp_364: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque binary blob.
 * This glyph is the head of a Shift-JIS list, so sjisNext is NULL;
 * byte-identical to baserom (gated by `make compare`). */

SECTION(".rodata.dat_gFontgrp_364_ref") struct Glyph gFontgrp_364 = {
    .sjisNext = NULL,
    .sjisByte1 = 0x81,
    .width = 0x09,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x0003C0FC, 0x0003B367, 0x0000EFBB,
        0x00003B67, 0x00000EFC, 0x0000FFB0, 0x000367EC,
        0x0003BB3B, 0x0003670F, 0x0000FC00, 0x00000000,
    },
};
