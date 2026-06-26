#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_118_ref, \"a\", %progbits\n"
"\t.global gFontgrp_118\n"
"gFontgrp_118:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1E60\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00003EFC\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x00003EFC\n"
"\t.4byte 0x00003EFB\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x00003EF0\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x00003AFB\n"
"\t.4byte 0x0000EEFB\n"
"\t.4byte 0x0000F3AC\n"
"\t.4byte 0x000000F0\n"
"\t.4byte 0x00000000\n"
);
