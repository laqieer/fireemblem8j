#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_325_ref, \"a\", %progbits\n"
"\t.global gFontgrp_325\n"
"gFontgrp_325:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x17A0\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x0000EBEB\n"
"\t.4byte 0x0000EB3B\n"
"\t.4byte 0x00003B0C\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x000033B0\n"
"\t.4byte 0x0000EFEC\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x00003FFC\n"
"\t.4byte 0x00000000\n"
);
