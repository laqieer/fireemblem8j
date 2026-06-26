#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_176_ref, \"a\", %progbits\n"
"\t.global gFontgrp_176\n"
"gFontgrp_176:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x798\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002FFC\n"
"\t.4byte 0x00002AA8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000BFFF\n"
"\t.4byte 0x0000AAEA\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000000E0\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x0000002C\n"
);
