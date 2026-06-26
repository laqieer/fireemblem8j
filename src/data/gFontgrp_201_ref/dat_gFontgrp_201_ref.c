#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_201_ref, \"a\", %progbits\n"
"\t.global gFontgrp_201\n"
"gFontgrp_201:\n"
"\t.4byte frontier_df4_uistuff_019_59BA8C + 0x4C8\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x000002F0\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x00002E00\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000BC\n"
"\t.4byte 0x00000BE0\n"
"\t.4byte 0x00000E00\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000002F\n"
"\t.4byte 0x000002F8\n"
"\t.4byte 0x00002F80\n"
"\t.4byte 0x00003800\n"
);
