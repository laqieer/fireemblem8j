#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_245_ref, \"a\", %progbits\n"
"\t.global gFontgrp_245\n"
"gFontgrp_245:\n"
"\t.4byte frontier_df4_uistuff_019_59BA8C + 0x438\n"
"\t.4byte 0x00000B82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B80B0\n"
"\t.4byte 0x000BB0B0\n"
"\t.4byte 0x0002BCB0\n"
"\t.4byte 0x00002EFC\n"
"\t.4byte 0x0000BBBB\n"
"\t.4byte 0x0000BBB2\n"
"\t.4byte 0x0000BB2C\n"
"\t.4byte 0x0000BB2C\n"
"\t.4byte 0x0000BB2C\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x000002FB\n"
);
