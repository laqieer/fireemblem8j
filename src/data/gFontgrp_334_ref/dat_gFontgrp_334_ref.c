#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_334_ref, \"a\", %progbits\n"
"\t.global gFontgrp_334\n"
"gFontgrp_334:\n"
"\t.4byte data_0857E32C + 0x48\n"
"\t.4byte 0x000007FA\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EAC\n"
"\t.4byte 0x00000EBC\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00003EBC\n"
"\t.4byte 0x0000EAAB\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x00000000\n"
);
