#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_78_ref, \"a\", %progbits\n"
"\t.global gFontgrp_78\n"
"gFontgrp_78:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0x288\n"
"\t.4byte 0x0000098E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003030\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0003ABAB\n"
"\t.4byte 0x0003EFEC\n"
"\t.4byte 0x000EAAEC\n"
"\t.4byte 0x0003BFAC\n"
"\t.4byte 0x000EAAEC\n"
"\t.4byte 0x0003BFEB\n"
"\t.4byte 0x0003BEEC\n"
"\t.4byte 0x0003BBEC\n"
"\t.4byte 0x0003BCEC\n"
"\t.4byte 0x0003ACDB\n"
"\t.4byte 0x0000F03F\n"
"\t.4byte 0x00000000\n"
);
