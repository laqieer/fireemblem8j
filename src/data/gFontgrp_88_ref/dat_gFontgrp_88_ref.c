#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_88_ref, \"a\", %progbits\n"
"\t.global gFontgrp_88\n"
"gFontgrp_88:\n"
"\t.4byte frontier_df4_uistuff_005_57DFCC + 0x288\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x0000CFB0\n"
"\t.4byte 0x0003BAAC\n"
"\t.4byte 0x0003BFB0\n"
"\t.4byte 0x0000FAAC\n"
"\t.4byte 0x0000EFBB\n"
"\t.4byte 0x0000EFBB\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00000C30\n"
"\t.4byte 0x00000000\n"
);
