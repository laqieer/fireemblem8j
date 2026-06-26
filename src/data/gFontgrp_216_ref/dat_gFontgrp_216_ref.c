#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_216_ref, \"a\", %progbits\n"
"\t.global gFontgrp_216\n"
"gFontgrp_216:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x1488\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000BFFF\n"
"\t.4byte 0x0000BAAB\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000BFFF\n"
"\t.4byte 0x0000BAAB\n"
);
