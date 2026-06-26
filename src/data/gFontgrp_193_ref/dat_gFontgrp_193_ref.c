#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_193_ref, \"a\", %progbits\n"
"\t.global gFontgrp_193\n"
"gFontgrp_193:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x4C8\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002C000\n"
"\t.4byte 0x000BBFFF\n"
"\t.4byte 0x0002FAAA\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000B800\n"
"\t.4byte 0x00002C00\n"
"\t.4byte 0x00002E00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x0000002C\n"
);
