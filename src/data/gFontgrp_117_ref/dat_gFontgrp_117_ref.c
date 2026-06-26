#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_117_ref, \"a\", %progbits\n"
"\t.global gFontgrp_117\n"
"gFontgrp_117:\n"
"\t.4byte frontier_df3_fontgrp_se_005_580B1C + 0x2D0\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000CC00\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x0003BBB0\n"
"\t.4byte 0x0000CEC0\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00003EC0\n"
"\t.4byte 0x0000EEF0\n"
"\t.4byte 0x000399EC\n"
"\t.4byte 0x0003BBEC\n"
"\t.4byte 0x0003BBDB\n"
"\t.4byte 0x0003BBBB\n"
"\t.4byte 0x0000CECC\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000000\n"
);
