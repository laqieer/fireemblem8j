#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_242_ref, \"a\", %progbits\n"
"\t.global gFontgrp_242\n"
"gFontgrp_242:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x90\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00002EFF\n"
"\t.4byte 0x00002CBA\n"
"\t.4byte 0x000008B0\n"
"\t.4byte 0x00000BF0\n"
"\t.4byte 0x00002EBC\n"
"\t.4byte 0x00002CBB\n"
"\t.4byte 0x00002CBB\n"
"\t.4byte 0x00002C2F\n"
"\t.4byte 0x00000B2E\n"
);
