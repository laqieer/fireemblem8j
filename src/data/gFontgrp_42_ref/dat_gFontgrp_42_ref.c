#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_42_ref, \"a\", %progbits\n"
"\t.global gFontgrp_42\n"
"gFontgrp_42:\n"
"\t.4byte frontier_df4_uistuff_005_57DFCC + 0x1B0\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FC00\n"
"\t.4byte 0x00036700\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x000367B0\n"
"\t.4byte 0x0000FEEC\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x0000E73B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x00039C0F\n"
"\t.4byte 0x0003B000\n"
"\t.4byte 0x0003B000\n"
"\t.4byte 0x0003B000\n"
"\t.4byte 0x0000C000\n"
"\t.4byte 0x00000000\n"
);
