#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_31_ref, \"a\", %progbits\n"
"\t.global gFontgrp_31\n"
"gFontgrp_31:\n"
"\t.4byte data_0857DCB4 + 0x1B0\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000C30\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x0000E7EC\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x00039CEC\n"
"\t.4byte 0x0003B03B\n"
"\t.4byte 0x0003B03B\n"
"\t.4byte 0x0003B03B\n"
"\t.4byte 0x0000C00F\n"
"\t.4byte 0x00000000\n"
);
