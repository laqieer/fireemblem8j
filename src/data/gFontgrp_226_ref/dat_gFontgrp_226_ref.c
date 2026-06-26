#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_226_ref, \"a\", %progbits\n"
"\t.global gFontgrp_226\n"
"gFontgrp_226:\n"
"\t.4byte frontier_df4_uistuff_015_599BE4 + 0x48\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000B2CB\n"
"\t.4byte 0x0000B2CB\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00000000\n"
);
