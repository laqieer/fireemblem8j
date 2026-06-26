#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_91_ref, \"a\", %progbits\n"
"\t.global gFontgrp_91\n"
"gFontgrp_91:\n"
"\t.4byte frontier_df3_fontgrp_se_006_5814AC + 0x438\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000CC00\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x0003BBB0\n"
"\t.4byte 0x0000FFB0\n"
"\t.4byte 0x0000EFBC\n"
"\t.4byte 0x0000EDAB\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x00039EEC\n"
"\t.4byte 0x0003BEEC\n"
"\t.4byte 0x0000CEDB\n"
"\t.4byte 0x00000EFB\n"
"\t.4byte 0x000003BB\n"
"\t.4byte 0x000000CC\n"
"\t.4byte 0x00000000\n"
);
