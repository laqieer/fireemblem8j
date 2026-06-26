#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_100_ref, \"a\", %progbits\n"
"\t.global gFontgrp_100\n"
"gFontgrp_100:\n"
"\t.4byte frontier_df4_uistuff_006_57E4DC + 0x120\n"
"\t.4byte 0x00000682\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x00000FB0\n"
"\t.4byte 0x00003BBC\n"
"\t.4byte 0x00000EAB\n"
"\t.4byte 0x00000EFC\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00003BFB\n"
"\t.4byte 0x00000C3B\n"
"\t.4byte 0x00000FFB\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00000000\n"
);
