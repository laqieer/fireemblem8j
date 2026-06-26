#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_267_ref, \"a\", %progbits\n"
"\t.global gFontgrp_267\n"
"gFontgrp_267:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x8B8\n"
"\t.4byte 0x00000B82\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B8000\n"
"\t.4byte 0x000BBEFF\n"
"\t.4byte 0x0002BCBA\n"
"\t.4byte 0x00002CB0\n"
"\t.4byte 0x0000BC2C\n"
"\t.4byte 0x0000BC2C\n"
"\t.4byte 0x0000BC0B\n"
"\t.4byte 0x0002EC0B\n"
"\t.4byte 0x0002EC0B\n"
"\t.4byte 0x0000AE0B\n"
"\t.4byte 0x00000B0B\n"
"\t.4byte 0x00000BAE\n"
"\t.4byte 0x000002F8\n"
);
