#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_219_ref, \"a\", %progbits\n"
"\t.global gFontgrp_219\n"
"gFontgrp_219:\n"
"\t.4byte frontier_df4_uistuff_017_59A574 + 0x480\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002FF\n"
"\t.4byte 0x00000BAB\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000BAB\n"
"\t.4byte 0x000002FF\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
);
