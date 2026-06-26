#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_292_ref, \"a\", %progbits\n"
"\t.global gFontgrp_292\n"
"gFontgrp_292:\n"
"\t.4byte frontier_df4_uistuff_020_59BFE4 + 0x360\n"
"\t.4byte 0x00000B93\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002C0BF\n"
"\t.4byte 0x0002C000\n"
"\t.4byte 0x0002C2FF\n"
"\t.4byte 0x000BFF00\n"
"\t.4byte 0x0002C0BF\n"
"\t.4byte 0x0002C000\n"
"\t.4byte 0x0002C0BF\n"
"\t.4byte 0x0002CB00\n"
"\t.4byte 0x0002EC00\n"
"\t.4byte 0x0002ECBF\n"
"\t.4byte 0x0002C0BB\n"
"\t.4byte 0x0002C0BB\n"
"\t.4byte 0x0002C0BB\n"
"\t.4byte 0x0002C0BF\n"
"\t.4byte 0x0002F0BB\n"
);
