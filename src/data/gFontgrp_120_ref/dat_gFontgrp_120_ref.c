#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_120_ref, \"a\", %progbits\n"
"\t.global gFontgrp_120\n"
"gFontgrp_120:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0xD8\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000030\n"
"\t.4byte 0x000000EC\n"
"\t.4byte 0x00000FEC\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x0000EDAC\n"
"\t.4byte 0x0000EFAC\n"
"\t.4byte 0x0000EF6C\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0003B0EC\n"
"\t.4byte 0x0000C030\n"
"\t.4byte 0x00000000\n"
);
