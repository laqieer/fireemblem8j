#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_262_ref, \"a\", %progbits\n"
"\t.global gFontgrp_262\n"
"gFontgrp_262:\n"
"\t.4byte frontier_df4_uistuff_020_59BFE4 + 0xF78\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002FFC\n"
"\t.4byte 0x00000BA8\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x00002FFC\n"
"\t.4byte 0x00000AEB\n"
"\t.4byte 0x000000B2\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00000AE0\n"
"\t.4byte 0x00000F80\n"
);
