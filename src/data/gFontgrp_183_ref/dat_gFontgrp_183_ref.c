#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_183_ref, \"a\", %progbits\n"
"\t.global gFontgrp_183\n"
"gFontgrp_183:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x990\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002F0\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000BFFF\n"
"\t.4byte 0x00002EAA\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000BC0\n"
"\t.4byte 0x00002EF0\n"
"\t.4byte 0x0000BAEC\n"
"\t.4byte 0x0000B2CB\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
);
