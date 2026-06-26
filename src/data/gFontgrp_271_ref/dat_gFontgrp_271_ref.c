#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_271_ref, \"a\", %progbits\n"
"\t.global gFontgrp_271\n"
"gFontgrp_271:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x1E60\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x0000B2C0\n"
"\t.4byte 0x00002FFF\n"
"\t.4byte 0x00000AEA\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x00002ECB\n"
"\t.4byte 0x00000BFE\n"
"\t.4byte 0x000002E8\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002FC\n"
"\t.4byte 0x00002FEB\n"
"\t.4byte 0x00003ACB\n"
"\t.4byte 0x000020BE\n"
);
