#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_187_ref, \"a\", %progbits\n"
"\t.global gFontgrp_187\n"
"gFontgrp_187:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0xAB0\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002C000\n"
"\t.4byte 0x000BBB00\n"
"\t.4byte 0x0002CBB0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00002CB0\n"
"\t.4byte 0x00002CB8\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000B02E\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
);
