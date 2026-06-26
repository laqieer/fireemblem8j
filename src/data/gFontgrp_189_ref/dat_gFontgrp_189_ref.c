#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_189_ref, \"a\", %progbits\n"
"\t.global gFontgrp_189\n"
"gFontgrp_189:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0xB40\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000BB00B\n"
"\t.4byte 0x000BB00B\n"
"\t.4byte 0x000BB00B\n"
"\t.4byte 0x0000BC0B\n"
"\t.4byte 0x00002BFF\n"
"\t.4byte 0x000002AB\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000AAAC\n"
"\t.4byte 0x0000BFF0\n"
);
