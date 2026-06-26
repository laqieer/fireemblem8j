#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_375_ref, \"a\", %progbits\n"
"\t.global gFontgrp_375\n"
"gFontgrp_375:\n"
"\t.4byte frontier_df4_uistuff_018_59B0FC + 0x1F8\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x0000BFFC\n"
"\t.4byte 0x0000BAE8\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B0B0\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000BC0B\n"
);
