#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_270_ref, \"a\", %progbits\n"
"\t.global gFontgrp_270\n"
"gFontgrp_270:\n"
"\t.4byte frontier_df4_uistuff_018_59B0FC + 0x2D0\n"
"\t.4byte 0x00000B82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B80B0\n"
"\t.4byte 0x000BBBE0\n"
"\t.4byte 0x0002B2C0\n"
"\t.4byte 0x00002000\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00002EE0\n"
"\t.4byte 0x00002EC0\n"
"\t.4byte 0x0000BBAC\n"
"\t.4byte 0x0000BB2C\n"
"\t.4byte 0x0000BB3B\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x000002E0\n"
);
