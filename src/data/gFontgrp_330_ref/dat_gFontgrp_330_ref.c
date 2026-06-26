#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_330_ref, \"a\", %progbits\n"
"\t.global gFontgrp_330\n"
"gFontgrp_330:\n"
"\t.4byte frontier_df3_fontgrp_se_001_57F604 + 0x3F0\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003FF0\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x00003BFB\n"
"\t.4byte 0x00003B0C\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x00000000\n"
);
