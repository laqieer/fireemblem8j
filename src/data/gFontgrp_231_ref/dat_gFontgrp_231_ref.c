#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_231_ref, \"a\", %progbits\n"
"\t.global gFontgrp_231\n"
"gFontgrp_231:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x52F8\n"
"\t.4byte 0x00000B95\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x000BFF2C\n"
"\t.4byte 0x000002CB\n"
"\t.4byte 0x0002FFBB\n"
"\t.4byte 0x0002CBB0\n"
"\t.4byte 0x0002FF2C\n"
"\t.4byte 0x0002CB2F\n"
"\t.4byte 0x0002FF2F\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x0002FC2C\n"
"\t.4byte 0x0002CB2C\n"
"\t.4byte 0x0002EEEC\n"
"\t.4byte 0x0000B02C\n"
"\t.4byte 0x0000BC2C\n"
"\t.4byte 0x000BCBEC\n"
);
