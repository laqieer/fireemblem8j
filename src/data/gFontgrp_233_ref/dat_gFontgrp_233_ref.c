#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_233_ref, \"a\", %progbits\n"
"\t.global gFontgrp_233\n"
"gFontgrp_233:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x5A0\n"
"\t.4byte 0x00000B8D\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000BF0B\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000B000\n"
"\t.4byte 0x0000BC2F\n"
"\t.4byte 0x0000BC2C\n"
"\t.4byte 0x0002EC2C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x000B02EC\n"
"\t.4byte 0x000B02EC\n"
"\t.4byte 0x0000002C\n"
"\t.4byte 0x000002FB\n"
"\t.4byte 0x000BFF0B\n"
);
