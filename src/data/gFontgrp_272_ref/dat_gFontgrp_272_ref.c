#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_272_ref, \"a\", %progbits\n"
"\t.global gFontgrp_272\n"
"gFontgrp_272:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x40F8\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x00000BAC\n"
"\t.4byte 0x00002F2C\n"
"\t.4byte 0x0000BAF8\n"
"\t.4byte 0x0000B0BC\n"
"\t.4byte 0x0000B0BB\n"
"\t.4byte 0x00002FB2\n"
"\t.4byte 0x00000AB0\n"
"\t.4byte 0x000002E0\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x000002C0\n"
);
