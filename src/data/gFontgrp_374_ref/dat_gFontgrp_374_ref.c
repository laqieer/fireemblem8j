#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_374_ref, \"a\", %progbits\n"
"\t.global gFontgrp_374\n"
"gFontgrp_374:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x3A8\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x0000BFFF\n"
"\t.4byte 0x00002BAA\n"
"\t.4byte 0x00000BC0\n"
"\t.4byte 0x00000BC0\n"
"\t.4byte 0x00000BE0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00000BB8\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000B2E\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x000002C0\n"
);
