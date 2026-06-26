#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_207_ref, \"a\", %progbits\n"
"\t.global gFontgrp_207\n"
"gFontgrp_207:\n"
"\t.4byte frontier_df4_uistuff_012_596F74 + 0x1200\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x0000BFB0\n"
"\t.4byte 0x0000BAF8\n"
"\t.4byte 0x0000B0BF\n"
"\t.4byte 0x000038B0\n"
"\t.4byte 0x00002CB0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
);
