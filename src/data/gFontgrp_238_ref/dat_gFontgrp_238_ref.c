#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_238_ref, \"a\", %progbits\n"
"\t.global gFontgrp_238\n"
"gFontgrp_238:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x4260\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x000002F8\n"
"\t.4byte 0x000000A0\n"
"\t.4byte 0x000002F0\n"
"\t.4byte 0x00000BAF\n"
"\t.4byte 0x00000B0A\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B00\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x000002E8\n"
"\t.4byte 0x000000BC\n"
);
