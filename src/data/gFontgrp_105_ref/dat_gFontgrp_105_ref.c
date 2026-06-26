#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_105_ref, \"a\", %progbits\n"
"\t.global gFontgrp_105\n"
"gFontgrp_105:\n"
"\t.4byte frontier_df3_fontgrp_se_008_582A54 + 0x3F0\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00033300\n"
"\t.4byte 0x000EEEC0\n"
"\t.4byte 0x000EEEFC\n"
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
