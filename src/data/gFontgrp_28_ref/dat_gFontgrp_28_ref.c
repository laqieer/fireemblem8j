#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_28_ref, \"a\", %progbits\n"
"\t.global gFontgrp_28\n"
"gFontgrp_28:\n"
"\t.4byte data_0857DCB4 + 0xD8\n"
"\t.4byte 0x00000683\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00003BFC\n"
"\t.4byte 0x00003B30\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00003BBC\n"
"\t.4byte 0x00003CEB\n"
"\t.4byte 0x0000003C\n"
"\t.4byte 0x00000000\n"
);
