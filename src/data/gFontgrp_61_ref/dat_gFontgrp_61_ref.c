#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_61_ref, \"a\", %progbits\n"
"\t.global gFontgrp_61\n"
"gFontgrp_61:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0x318\n"
"\t.4byte 0x00000683\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x0000003B\n"
"\t.4byte 0x00000C3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00003B3B\n"
"\t.4byte 0x00000EFB\n"
"\t.4byte 0x00000EFB\n"
"\t.4byte 0x000003BB\n"
"\t.4byte 0x000000EB\n"
"\t.4byte 0x0000003C\n"
"\t.4byte 0x00000000\n"
);
