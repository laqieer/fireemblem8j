#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_54_ref, \"a\", %progbits\n"
"\t.global gFontgrp_54\n"
"gFontgrp_54:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x120\n"
"\t.4byte 0x00000683\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000003F0\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x00000EF0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00000000\n"
);
