#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_16_ref, \"a\", %progbits\n"
"\t.global gFontgrp_16\n"
"gFontgrp_16:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x5340\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000CC00\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x0003BBB0\n"
"\t.4byte 0x0000EAB0\n"
"\t.4byte 0x0000EFB0\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0000EFBB\n"
"\t.4byte 0x0000EECF\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x000003AC\n"
"\t.4byte 0x000000F0\n"
"\t.4byte 0x00000000\n"
);
