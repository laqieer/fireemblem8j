#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_114_ref, \"a\", %progbits\n"
"\t.global gFontgrp_114\n"
"gFontgrp_114:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x8B8\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000CC00\n"
"\t.4byte 0x0003BB00\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x0000FEBC\n"
"\t.4byte 0x0000EF6B\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0003ACEC\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000000\n"
);
