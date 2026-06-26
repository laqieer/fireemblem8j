#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_318_ref, \"a\", %progbits\n"
"\t.global gFontgrp_318\n"
"gFontgrp_318:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x1E18\n"
"\t.4byte 0x00000B97\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x000BFFFF\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x000B02CB\n"
"\t.4byte 0x0002EF2C\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x0002EEEC\n"
"\t.4byte 0x000BBFFB\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x000BFFFF\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
);
