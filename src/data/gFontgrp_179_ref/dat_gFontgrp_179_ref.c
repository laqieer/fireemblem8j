#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_179_ref, \"a\", %progbits\n"
"\t.global gFontgrp_179\n"
"gFontgrp_179:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x870\n"
"\t.4byte 0x00000A83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002EC2C\n"
"\t.4byte 0x0002EC2C\n"
"\t.4byte 0x0002EC2C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x000000BC\n"
"\t.4byte 0x00002FEC\n"
"\t.4byte 0x00002AAC\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002C\n"
);
