#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_69_ref, \"a\", %progbits\n"
"\t.global gFontgrp_69\n"
"gFontgrp_69:\n"
"\t.4byte data_0857D48C + 0x48\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000CC00\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x0003BBB0\n"
"\t.4byte 0x0000FFBF\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000EFFB\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000E70C\n"
"\t.4byte 0x00003B00\n"
"\t.4byte 0x000039C0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000000\n"
);
