#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_243_ref, \"a\", %progbits\n"
"\t.global gFontgrp_243\n"
"gFontgrp_243:\n"
"\t.4byte frontier_df4_uistuff_020_59BFE4 + 0xD8\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00002CB0\n"
"\t.4byte 0x0000BAF0\n"
"\t.4byte 0x0000B0BF\n"
"\t.4byte 0x000000BA\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00002FF0\n"
"\t.4byte 0x0000BAB0\n"
"\t.4byte 0x0000B0BC\n"
"\t.4byte 0x0000B0BB\n"
"\t.4byte 0x0000B0BB\n"
"\t.4byte 0x0000B0BB\n"
"\t.4byte 0x00002FBC\n"
);
