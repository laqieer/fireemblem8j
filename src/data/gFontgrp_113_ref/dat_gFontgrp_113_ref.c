#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_113_ref, \"a\", %progbits\n"
"\t.global gFontgrp_113\n"
"gFontgrp_113:\n"
"\t.4byte frontier_df3_fontgrp_se_004_57FF94 + 0x678\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FC0\n"
"\t.4byte 0x00003AB0\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x00039EDB\n"
"\t.4byte 0x0003BEFB\n"
"\t.4byte 0x0003BE7B\n"
"\t.4byte 0x0003B3BB\n"
"\t.4byte 0x0003B39B\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x00003B30\n"
"\t.4byte 0x00000C00\n"
"\t.4byte 0x00000000\n"
);
