#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_51_ref, \"a\", %progbits\n"
"\t.global gFontgrp_51\n"
"gFontgrp_51:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x48\n"
"\t.4byte 0x00000783\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FB0\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x00003FBC\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x00003FBC\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x00003FB0\n"
"\t.4byte 0x0000EAC0\n"
"\t.4byte 0x00003F00\n"
"\t.4byte 0x00000000\n"
);
