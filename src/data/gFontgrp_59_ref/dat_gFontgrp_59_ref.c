#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_59_ref, \"a\", %progbits\n"
"\t.global gFontgrp_59\n"
"gFontgrp_59:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x288\n"
"\t.4byte 0x00000683\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C00\n"
"\t.4byte 0x00003B0C\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B0C\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x000003AC\n"
"\t.4byte 0x000000F0\n"
"\t.4byte 0x00000000\n"
);
