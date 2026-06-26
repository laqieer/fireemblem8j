#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_182_ref, \"a\", %progbits\n"
"\t.global gFontgrp_182\n"
"gFontgrp_182:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x948\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000BFFC\n"
"\t.4byte 0x0000BAA8\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000B800\n"
"\t.4byte 0x00002CB0\n"
"\t.4byte 0x00002EC0\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x00002EE0\n"
"\t.4byte 0x000030B8\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x0000000B\n"
);
