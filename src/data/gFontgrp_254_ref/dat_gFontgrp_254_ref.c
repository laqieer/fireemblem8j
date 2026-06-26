#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_254_ref, \"a\", %progbits\n"
"\t.global gFontgrp_254\n"
"gFontgrp_254:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x3F0\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x00002FC0\n"
"\t.4byte 0x00000AFF\n"
"\t.4byte 0x00000BAA\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00002E00\n"
"\t.4byte 0x00002FFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x0000200B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000AAE\n"
"\t.4byte 0x00000FF8\n"
);
