#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_244_ref, \"a\", %progbits\n"
"\t.global gFontgrp_244\n"
"gFontgrp_244:\n"
"\t.4byte frontier_df4_uistuff_018_59B0FC + 0x708\n"
"\t.4byte 0x00000A82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00002CB0\n"
"\t.4byte 0x0000BAFC\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x0002EBB0\n"
"\t.4byte 0x0002CBB0\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x000002FB\n"
);
