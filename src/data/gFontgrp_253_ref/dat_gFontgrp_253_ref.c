#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_253_ref, \"a\", %progbits\n"
"\t.global gFontgrp_253\n"
"gFontgrp_253:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x3600\n"
"\t.4byte 0x00000A82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002E000\n"
"\t.4byte 0x0002EC00\n"
"\t.4byte 0x0000AC2C\n"
"\t.4byte 0x00000BF8\n"
"\t.4byte 0x000002A0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00002AAE\n"
"\t.4byte 0x00003FF8\n"
);
