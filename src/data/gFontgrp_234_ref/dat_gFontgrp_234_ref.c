#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_234_ref, \"a\", %progbits\n"
"\t.global gFontgrp_234\n"
"gFontgrp_234:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x1CF8\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x00000BB0\n"
"\t.4byte 0x000002FC\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x00000BF0\n"
"\t.4byte 0x00002FBC\n"
"\t.4byte 0x0000BBBC\n"
"\t.4byte 0x0000B2FB\n"
"\t.4byte 0x0000B2FB\n"
"\t.4byte 0x0000B0BB\n"
"\t.4byte 0x00002F2E\n"
);
