#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_39_ref, \"a\", %progbits\n"
"\t.global gFontgrp_39\n"
"gFontgrp_39:\n"
"\t.4byte frontier_df4_uistuff_003_57CC64 + 0x1B0\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FC00\n"
"\t.4byte 0x00036700\n"
"\t.4byte 0x0003BBFC\n"
"\t.4byte 0x000366AB\n"
"\t.4byte 0x0000FBFC\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x000003BC\n"
"\t.4byte 0x000000EB\n"
"\t.4byte 0x0000003C\n"
"\t.4byte 0x00000000\n"
);
