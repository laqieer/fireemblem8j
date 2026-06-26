#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_125_ref, \"a\", %progbits\n"
"\t.global gFontgrp_125\n"
"gFontgrp_125:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x7B30\n"
"\t.4byte 0x00000894\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000F3C\n"
"\t.4byte 0x0000FBEC\n"
"\t.4byte 0x0003A9AC\n"
"\t.4byte 0x0000EFBB\n"
"\t.4byte 0x0003FFFC\n"
"\t.4byte 0x0003AAEC\n"
"\t.4byte 0x0003BEAB\n"
"\t.4byte 0x0003AAEC\n"
"\t.4byte 0x0003BE6C\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0003BEEB\n"
"\t.4byte 0x0003AAEF\n"
"\t.4byte 0x0003FFF0\n"
"\t.4byte 0x00000000\n"
);
