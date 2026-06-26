#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_82_ref, \"a\", %progbits\n"
"\t.global gFontgrp_82\n"
"gFontgrp_82:\n"
"\t.4byte frontier_df4_uistuff_006_57E4DC + 0x240\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C0C\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000303B\n"
"\t.4byte 0x000000EC\n"
"\t.4byte 0x00000030\n"
"\t.4byte 0x00000000\n"
);
