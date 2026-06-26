#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_170_ref, \"a\", %progbits\n"
"\t.global gFontgrp_170\n"
"gFontgrp_170:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x240\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000BB2C0\n"
"\t.4byte 0x000BB2C0\n"
"\t.4byte 0x000BBFC0\n"
"\t.4byte 0x0000BAB0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B0BC\n"
"\t.4byte 0x0000BBEC\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000000BC\n"
);
