#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_249_ref, \"a\", %progbits\n"
"\t.global gFontgrp_249\n"
"gFontgrp_249:\n"
"\t.4byte frontier_df4_uistuff_021_59D034 + 0x2D0\n"
"\t.4byte 0x00000B82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000BAC00\n"
"\t.4byte 0x000BBB00\n"
"\t.4byte 0x0002B2C0\n"
"\t.4byte 0x000020B0\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000002E\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x00000B00\n"
);
