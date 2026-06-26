#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_34_ref, \"a\", %progbits\n"
"\t.global gFontgrp_34\n"
"gFontgrp_34:\n"
"\t.4byte data_0857DEF4 + 0x48\n"
"\t.4byte 0x00000683\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x00000F3B\n"
"\t.4byte 0x00003AFB\n"
"\t.4byte 0x00000FAB\n"
"\t.4byte 0x000000FB\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x00000FFB\n"
"\t.4byte 0x00003AAC\n"
"\t.4byte 0x00000FF0\n"
"\t.4byte 0x00000000\n"
);
