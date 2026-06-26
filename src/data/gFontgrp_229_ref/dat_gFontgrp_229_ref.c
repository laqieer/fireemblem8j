#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_229_ref, \"a\", %progbits\n"
"\t.global gFontgrp_229\n"
"gFontgrp_229:\n"
"\t.4byte frontier_df4_uistuff_017_59A574 + 0x510\n"
"\t.4byte 0x00000682\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002FF\n"
"\t.4byte 0x000002EA\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x000002AB\n"
"\t.4byte 0x000002FF\n"
"\t.4byte 0x00000000\n"
);
