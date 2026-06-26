#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_265_ref, \"a\", %progbits\n"
"\t.global gFontgrp_265\n"
"gFontgrp_265:\n"
"\t.4byte frontier_df4_uistuff_016_59A2EC + 0x1B0\n"
"\t.4byte 0x00000B82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B80B0\n"
"\t.4byte 0x000BB0B0\n"
"\t.4byte 0x0002B0B0\n"
"\t.4byte 0x00002BF0\n"
"\t.4byte 0x000002BF\n"
"\t.4byte 0x000000BA\n"
"\t.4byte 0x00003F2C\n"
"\t.4byte 0x00002A2C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x000002CB\n"
"\t.4byte 0x000002CB\n"
"\t.4byte 0x00002ACB\n"
"\t.4byte 0x00003F8B\n"
);
