#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_188_ref, \"a\", %progbits\n"
"\t.global gFontgrp_188\n"
"gFontgrp_188:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0xAF8\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000B80B\n"
"\t.4byte 0x00002FFF\n"
"\t.4byte 0x000002AB\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00002AAC\n"
"\t.4byte 0x00003FF0\n"
);
