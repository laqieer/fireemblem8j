#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_177_ref, \"a\", %progbits\n"
"\t.global gFontgrp_177\n"
"gFontgrp_177:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x7E0\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000BBFFC\n"
"\t.4byte 0x000BBAA8\n"
"\t.4byte 0x000BB000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003FFF\n"
"\t.4byte 0x00002AEA\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x0000002C\n"
);
