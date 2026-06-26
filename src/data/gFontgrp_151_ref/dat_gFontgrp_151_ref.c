#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_151_ref, \"a\", %progbits\n"
"\t.global gFontgrp_151\n"
"gFontgrp_151:\n"
"\t.4byte frontier_df3_fontgrp_se_003_57FD0C + 0x48\n"
"\t.4byte 0x00000889\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FFFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00003EF0\n"
"\t.4byte 0x0000EAAC\n"
"\t.4byte 0x00003EF0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x0000FEFC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FFFC\n"
"\t.4byte 0x00000000\n"
);
