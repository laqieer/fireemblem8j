#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_250_ref, \"a\", %progbits\n"
"\t.global gFontgrp_250\n"
"gFontgrp_250:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x318\n"
"\t.4byte 0x00000A82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002C00\n"
"\t.4byte 0x00002C00\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x0002FC0B\n"
"\t.4byte 0x0000AFFB\n"
"\t.4byte 0x00002EAB\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002C0B\n"
"\t.4byte 0x00002E0B\n"
"\t.4byte 0x00002B2E\n"
"\t.4byte 0x00000BAC\n"
"\t.4byte 0x000002C0\n"
);
