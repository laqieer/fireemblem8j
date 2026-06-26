#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_66_ref, \"a\", %progbits\n"
"\t.global gFontgrp_66\n"
"gFontgrp_66:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0x630\n"
"\t.4byte 0x00000682\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00003AF0\n"
"\t.4byte 0x00003AC0\n"
"\t.4byte 0x00003AC0\n"
"\t.4byte 0x00000F00\n"
);
