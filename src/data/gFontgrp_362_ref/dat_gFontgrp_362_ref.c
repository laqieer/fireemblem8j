#include "global.h"
#include "fontgrp.h"

/* gFontgrp_362: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque binary blob.
 * This glyph is the head of a Shift-JIS list, so sjisNext is NULL;
 * byte-identical to baserom (gated by `make compare`). */

SECTION(".rodata.dat_gFontgrp_362_ref") struct Glyph gFontgrp_362 = {
    .sjisNext = NULL,
    .sjisByte1 = 0x81,
    .width = 0x08,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x0000FCFC, 0x0000A7EB, 0x000099EA,
        0x0000BAEB, 0x0000BAEB, 0x0000BAEB, 0x0000BAEB,
        0x00009AEB, 0x00006BAA, 0x0000FCFF, 0x00000000,
    },
};
