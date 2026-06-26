#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_58_ref, \"a\", %progbits\n"
"\t.global gFontgrp_58\n"
"gFontgrp_58:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x240\n"
"\t.4byte 0x00000783\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003FFC\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000EFFC\n"
"\t.4byte 0x0000EC00\n"
"\t.4byte 0x0000EC00\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x000003AC\n"
"\t.4byte 0x000000F0\n"
"\t.4byte 0x00000000\n"
);
