#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_79_ref, \"a\", %progbits\n"
"\t.global gFontgrp_79\n"
"gFontgrp_79:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x5A0\n"
"\t.4byte 0x0000098D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x0000FC3B\n"
"\t.4byte 0x0000EBEF\n"
"\t.4byte 0x0000EC30\n"
"\t.4byte 0x0000ECFC\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x00039BEF\n"
"\t.4byte 0x0003BBEC\n"
"\t.4byte 0x0003B6EC\n"
"\t.4byte 0x000ECF6C\n"
"\t.4byte 0x0003FDAC\n"
"\t.4byte 0x000EAAFB\n"
"\t.4byte 0x0003FF0F\n"
"\t.4byte 0x00000000\n"
);
