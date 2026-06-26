#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_60_ref, \"a\", %progbits\n"
"\t.global gFontgrp_60\n"
"gFontgrp_60:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x2D0\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x00000EEC\n"
"\t.4byte 0x00000EEC\n"
"\t.4byte 0x0000CEEC\n"
"\t.4byte 0x0003BEEC\n"
"\t.4byte 0x00039EEC\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x0000E6EC\n"
"\t.4byte 0x00003ADB\n"
"\t.4byte 0x00000EFB\n"
"\t.4byte 0x0000030C\n"
"\t.4byte 0x00000000\n"
);
