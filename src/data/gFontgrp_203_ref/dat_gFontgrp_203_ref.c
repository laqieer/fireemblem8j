#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_203_ref, \"a\", %progbits\n"
"\t.global gFontgrp_203\n"
"gFontgrp_203:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0xA20\n"
"\t.4byte 0x00000983\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00002E2C\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x00002FAC\n"
"\t.4byte 0x0000BAFC\n"
"\t.4byte 0x0000B00B\n"
);
