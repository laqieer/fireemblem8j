#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_49_ref, \"a\", %progbits\n"
"\t.global gFontgrp_49\n"
"gFontgrp_49:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0xA20\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000DB0\n"
"\t.4byte 0x00003BB0\n"
"\t.4byte 0x00003BB0\n"
"\t.4byte 0x0000EF6C\n"
"\t.4byte 0x0000EFEC\n"
"\t.4byte 0x00039AEC\n"
"\t.4byte 0x0003BDAB\n"
"\t.4byte 0x0000C3FF\n"
"\t.4byte 0x00000000\n"
);
