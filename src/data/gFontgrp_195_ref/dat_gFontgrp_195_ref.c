#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_195_ref, \"a\", %progbits\n"
"\t.global gFontgrp_195\n"
"gFontgrp_195:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0xCF0\n"
"\t.4byte 0x00000A83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002ECB0\n"
"\t.4byte 0x0002ECB8\n"
"\t.4byte 0x0002EEEC\n"
"\t.4byte 0x000002EC\n"
"\t.4byte 0x00000B8C\n"
"\t.4byte 0x00000B0E\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C00\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000B000\n"
);
