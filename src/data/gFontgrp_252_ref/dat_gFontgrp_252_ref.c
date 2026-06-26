#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_252_ref, \"a\", %progbits\n"
"\t.global gFontgrp_252\n"
"gFontgrp_252:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x1D88\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x00000FF8\n"
"\t.4byte 0x00000AA0\n"
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
