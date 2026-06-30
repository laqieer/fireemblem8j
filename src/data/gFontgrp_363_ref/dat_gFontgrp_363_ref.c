#include "global.h"
#include "fontgrp.h"

/* gFontgrp_363: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque binary blob.
 * This glyph is the head of a Shift-JIS list, so sjisNext is NULL;
 * byte-identical to baserom (gated by `make compare`). */

SECTION(".rodata.dat_gFontgrp_363_ref") struct Glyph gFontgrp_363 = {
    .sjisNext = NULL,
    .sjisByte1 = 0x81,
    .width = 0x07,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x00000000,
        0x00000000, 0x00000FC0, 0x00003A73, 0x0000E99E,
        0x0000EBAE, 0x0000EBAE, 0x0000EBAE, 0x0000EBAE,
        0x0000D9AD, 0x000036B3, 0x00000FC0, 0x00000000,
    },
};
