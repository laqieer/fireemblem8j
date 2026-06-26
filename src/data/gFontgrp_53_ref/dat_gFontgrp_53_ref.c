#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_53_ref, \"a\", %progbits\n"
"\t.global gFontgrp_53\n"
"gFontgrp_53:\n"
"\t.4byte frontier_df4_uistuff_004_57CF7C + 0xD8\n"
"\t.4byte 0x00000883\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000030\n"
"\t.4byte 0x0000C0EC\n"
"\t.4byte 0x0003BCEC\n"
"\t.4byte 0x0003AB6C\n"
"\t.4byte 0x00039E9C\n"
"\t.4byte 0x0000EFAB\n"
"\t.4byte 0x0000EFBC\n"
"\t.4byte 0x000033B0\n"
"\t.4byte 0x00000E70\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000EC0\n"
"\t.4byte 0x00000300\n"
"\t.4byte 0x00000000\n"
);
