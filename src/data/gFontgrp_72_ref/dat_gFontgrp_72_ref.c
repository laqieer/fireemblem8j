#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_72_ref, \"a\", %progbits\n"
"\t.global gFontgrp_72\n"
"gFontgrp_72:\n"
"\t.4byte frontier_df3_fontgrp_se_001_57F604 + 0x48\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000333C\n"
"\t.4byte 0x0000EEEB\n"
"\t.4byte 0x0000EEEB\n"
"\t.4byte 0x0000EEEB\n"
"\t.4byte 0x0000EEEB\n"
"\t.4byte 0x0000EEEB\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x00003BB0\n"
"\t.4byte 0x00003CC0\n"
"\t.4byte 0x00000000\n"
);
