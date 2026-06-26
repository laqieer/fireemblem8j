#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_367_ref, \"a\", %progbits\n"
"\t.global gFontgrp_367\n"
"gFontgrp_367:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x120\n"
"\t.4byte 0x00000783\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002F0\n"
"\t.4byte 0x000002EC\n"
"\t.4byte 0x000002CB\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
);
