#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_104_ref, \"a\", %progbits\n"
"\t.global gFontgrp_104\n"
"gFontgrp_104:\n"
"\t.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x360\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C00\n"
"\t.4byte 0x0000FBFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FBFC\n"
"\t.4byte 0x00003AB0\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00003AEC\n"
"\t.4byte 0x00003BB0\n"
"\t.4byte 0x00003BC0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000000\n"
);
