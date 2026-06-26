#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_260_ref, \"a\", %progbits\n"
"\t.global gFontgrp_260\n"
"gFontgrp_260:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x5E8\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x0000BF2C\n"
"\t.4byte 0x00002BFF\n"
"\t.4byte 0x00000BAE\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x000002EC\n"
"\t.4byte 0x000000AC\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x00000AAC\n"
"\t.4byte 0x00000FF8\n"
);
