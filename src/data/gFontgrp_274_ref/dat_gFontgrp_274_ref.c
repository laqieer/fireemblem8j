#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_274_ref, \"a\", %progbits\n"
"\t.global gFontgrp_274\n"
"gFontgrp_274:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x8988\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002FC0\n"
"\t.4byte 0x00000BBC\n"
"\t.4byte 0x00000B28\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x00000BF0\n"
"\t.4byte 0x00002EB0\n"
"\t.4byte 0x0000B82C\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B00B\n"
"\t.4byte 0x0000B800\n"
"\t.4byte 0x00002EA0\n"
"\t.4byte 0x00000BF0\n"
);
