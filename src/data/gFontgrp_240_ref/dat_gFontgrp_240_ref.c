#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_240_ref, \"a\", %progbits\n"
"\t.global gFontgrp_240\n"
"gFontgrp_240:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0xEE8\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x000002F8\n"
"\t.4byte 0x000000A0\n"
"\t.4byte 0x00000BFC\n"
"\t.4byte 0x000002E8\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002F0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x0000BE0B\n"
);
