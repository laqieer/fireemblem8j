#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_112_ref, \"a\", %progbits\n"
"\t.global gFontgrp_112\n"
"gFontgrp_112:\n"
"\t.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x9D8\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00003EC0\n"
"\t.4byte 0x0000EEFC\n"
"\t.4byte 0x0000DAAB\n"
"\t.4byte 0x00003FBC\n"
"\t.4byte 0x0000EAB0\n"
"\t.4byte 0x00039FAC\n"
"\t.4byte 0x0003B0EC\n"
"\t.4byte 0x0003B030\n"
"\t.4byte 0x0000EF00\n"
"\t.4byte 0x00003AC0\n"
"\t.4byte 0x00000F00\n"
"\t.4byte 0x00000000\n"
);
