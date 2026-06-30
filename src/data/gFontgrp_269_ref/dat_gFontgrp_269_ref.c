#include "global.h"
#include "fontgrp.h"

/* gFontgrp_269: a Shift-JIS font glyph (struct Glyph). The pixel bitmap is JP-
 * region-specific; the struct WRAPPER is region-same form (fe8u src/data/fonts/
 * glyphs_*.h), typed here as real source instead of an opaque de-pointered
 * u32[] blob. sjisNext is a relocatable symbol reference (SHIFTABLE);
 * byte-identical to baserom (gated by `make compare`). */

extern struct Glyph data_0859A0AC;

SECTION(".rodata.dat_gFontgrp_269_ref") struct Glyph gFontgrp_269 = {
    .sjisNext = (struct Glyph *)&data_0859A0AC,
    .sjisByte1 = 0x82,
    .width = 0x09,
    .bitmap =
    {
        0x00000000, 0x00000000, 0x00000000, 0x000000B0,
        0x00000BE0, 0x000002C0, 0x00000000, 0x000000B0,
        0x000000B0, 0x00002EE0, 0x00002EC0, 0x0000BBAC,
        0x0000BB2C, 0x0000BBBB, 0x0000BBBB, 0x000002E0,
    },
};
