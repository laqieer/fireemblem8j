#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_213_ref, \"a\", %progbits\n"
"\t.global gFontgrp_213\n"
"gFontgrp_213:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x13B0\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002C00\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002E00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000000B0\n"
);
