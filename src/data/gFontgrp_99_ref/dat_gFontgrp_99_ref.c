#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_99_ref, \"a\", %progbits\n"
"\t.global gFontgrp_99\n"
"gFontgrp_99:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x3600\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003300\n"
"\t.4byte 0x0000EEC0\n"
"\t.4byte 0x0000EEF0\n"
"\t.4byte 0x00003EAC\n"
"\t.4byte 0x00003BF0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000030\n"
"\t.4byte 0x000000EC\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x00000FFB\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00000000\n"
);
