#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_327_ref, \"a\", %progbits\n"
"\t.global gFontgrp_327\n"
"gFontgrp_327:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0x9D8\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C00\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x00003AC0\n"
"\t.4byte 0x00003AB0\n"
"\t.4byte 0x00003AEC\n"
"\t.4byte 0x0000EAFB\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00003AFC\n"
"\t.4byte 0x0000EAB0\n"
"\t.4byte 0x00003FC0\n"
"\t.4byte 0x00000000\n"
);
