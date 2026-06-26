#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_165_ref, \"a\", %progbits\n"
"\t.global gFontgrp_165\n"
"gFontgrp_165:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0x1E18\n"
"\t.4byte 0x00000897\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003B9BB\n"
"\t.4byte 0x0000EEEC\n"
"\t.4byte 0x0003B9BB\n"
"\t.4byte 0x0000EA9C\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000000\n"
);
