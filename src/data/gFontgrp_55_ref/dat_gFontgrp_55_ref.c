#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_55_ref, \"a\", %progbits\n"
"\t.global gFontgrp_55\n"
"gFontgrp_55:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x168\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003FF0\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x0000EFF0\n"
"\t.4byte 0x0000EC00\n"
"\t.4byte 0x0000EC00\n"
"\t.4byte 0x0000E700\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x0000FBFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FFFC\n"
"\t.4byte 0x00000000\n"
);
