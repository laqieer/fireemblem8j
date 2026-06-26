#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_246_ref, \"a\", %progbits\n"
"\t.global gFontgrp_246\n"
"gFontgrp_246:\n"
"\t.4byte data_0859A0AC + 0x48\n"
"\t.4byte 0x00000982\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000002C0\n"
"\t.4byte 0x00002EC0\n"
"\t.4byte 0x00000BFC\n"
"\t.4byte 0x000002E8\n"
"\t.4byte 0x0000BF80\n"
"\t.4byte 0x00002BFF\n"
"\t.4byte 0x00000EAA\n"
"\t.4byte 0x00002FFC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x0000200B\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000AAC\n"
"\t.4byte 0x00000FF0\n"
);
