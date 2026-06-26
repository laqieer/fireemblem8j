#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_123_ref, \"a\", %progbits\n"
"\t.global gFontgrp_123\n"
"gFontgrp_123:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x6DB0\n"
"\t.4byte 0x00000895\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FFBC\n"
"\t.4byte 0x00003FB0\n"
"\t.4byte 0x0000EAB0\n"
"\t.4byte 0x0000EFB0\n"
"\t.4byte 0x0000EF6C\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0000EF3B\n"
"\t.4byte 0x0000DACF\n"
"\t.4byte 0x00003FC0\n"
"\t.4byte 0x00000000\n"
);
