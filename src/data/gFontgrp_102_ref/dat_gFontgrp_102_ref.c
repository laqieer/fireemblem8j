#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_102_ref, \"a\", %progbits\n"
"\t.global gFontgrp_102\n"
"gFontgrp_102:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x4068\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000303B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x00003BFB\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x000003F0\n"
"\t.4byte 0x00000000\n"
);
