#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_198_ref, \"a\", %progbits\n"
"\t.global gFontgrp_198\n"
"gFontgrp_198:\n"
"\t.4byte frontier_df4_uistuff_013_5987EC + 0x120\n"
"\t.4byte 0x00000A83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002EEC0\n"
"\t.4byte 0x0002EEC0\n"
"\t.4byte 0x0002EEC0\n"
"\t.4byte 0x0000BFFF\n"
"\t.4byte 0x00002AEA\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x00002EEC\n"
"\t.4byte 0x00002EEC\n"
"\t.4byte 0x00002EEC\n"
"\t.4byte 0x0000B2CB\n"
"\t.4byte 0x0000B2CB\n"
"\t.4byte 0x0000B2CB\n"
"\t.4byte 0x000002C0\n"
);
