#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_108_ref, \"a\", %progbits\n"
"\t.global gFontgrp_108\n"
"gFontgrp_108:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0xF78\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00003BF0\n"
"\t.4byte 0x0000FEC0\n"
"\t.4byte 0x0003AFBC\n"
"\t.4byte 0x0000FAAB\n"
"\t.4byte 0x00000EBC\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x00003EC0\n"
"\t.4byte 0x0000EB00\n"
"\t.4byte 0x00003C00\n"
"\t.4byte 0x00000000\n"
);
