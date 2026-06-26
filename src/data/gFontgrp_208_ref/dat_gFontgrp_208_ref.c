#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_208_ref, \"a\", %progbits\n"
"\t.global gFontgrp_208\n"
"gFontgrp_208:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x1248\n"
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
"\t.4byte 0x00000BFC\n"
"\t.4byte 0x00000BA8\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000BAA\n"
"\t.4byte 0x00002FFF\n"
);
