#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_278_ref, \"a\", %progbits\n"
"\t.global gFontgrp_278\n"
"gFontgrp_278:\n"
"\t.4byte frontier_fontgrp_ui_000_59D4FC + 0x7B30\n"
"\t.4byte 0x00000B94\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00002C2C\n"
"\t.4byte 0x000BFFFC\n"
"\t.4byte 0x0002EEEC\n"
"\t.4byte 0x0002C0CB\n"
"\t.4byte 0x000BFCB0\n"
"\t.4byte 0x000B2CB0\n"
"\t.4byte 0x000B2EFF\n"
"\t.4byte 0x000BFCB0\n"
"\t.4byte 0x000B2CB0\n"
"\t.4byte 0x000B2EFC\n"
"\t.4byte 0x000BFFBC\n"
"\t.4byte 0x000B2FBB\n"
"\t.4byte 0x000B2CB0\n"
"\t.4byte 0x000BFCB0\n"
"\t.4byte 0x000B2CB0\n"
);
