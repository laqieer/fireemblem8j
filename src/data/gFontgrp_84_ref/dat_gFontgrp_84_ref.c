#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_84_ref, \"a\", %progbits\n"
"\t.global gFontgrp_84\n"
"gFontgrp_84:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x4260\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000FC0\n"
"\t.4byte 0x00003ABC\n"
"\t.4byte 0x0000EFEB\n"
"\t.4byte 0x0000EC3C\n"
"\t.4byte 0x00003BC0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000000\n"
);
