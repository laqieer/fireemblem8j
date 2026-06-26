#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_43_ref, \"a\", %progbits\n"
"\t.global gFontgrp_43\n"
"gFontgrp_43:\n"
"\t.4byte frontier_df3_fontgrp_se_005_580B1C + 0x48\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x00039EE7\n"
"\t.4byte 0x0003BEDB\n"
"\t.4byte 0x0003BEFB\n"
"\t.4byte 0x0000CECC\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000000\n"
);
