#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_365_ref, \"a\", %progbits\n"
"\t.global gFontgrp_365\n"
"gFontgrp_365:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x90\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002FFF\n"
"\t.4byte 0x00002E00\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x000002F0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x0000002F\n"
);
