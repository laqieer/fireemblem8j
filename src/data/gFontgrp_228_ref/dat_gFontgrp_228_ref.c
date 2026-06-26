#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_228_ref, \"a\", %progbits\n"
"\t.global gFontgrp_228\n"
"gFontgrp_228:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x2E68\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x000002EE\n"
"\t.4byte 0x000002EC\n"
"\t.4byte 0x000002EC\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x000000B0\n"
"\t.4byte 0x000000B8\n"
"\t.4byte 0x0000002F\n"
);
