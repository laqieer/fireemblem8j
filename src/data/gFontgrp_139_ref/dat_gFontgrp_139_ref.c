#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_139_ref, \"a\", %progbits\n"
"\t.global gFontgrp_139\n"
"gFontgrp_139:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0x360\n"
"\t.4byte 0x00000893\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00003030\n"
"\t.4byte 0x0000E0EC\n"
"\t.4byte 0x0000EFAB\n"
"\t.4byte 0x0003AAFC\n"
"\t.4byte 0x0000EFAB\n"
"\t.4byte 0x0000ECFC\n"
"\t.4byte 0x0000EBAB\n"
"\t.4byte 0x0000EBFC\n"
"\t.4byte 0x0000EFAB\n"
"\t.4byte 0x0000EFBB\n"
"\t.4byte 0x0000EFBB\n"
"\t.4byte 0x0000DBAB\n"
"\t.4byte 0x00003CFC\n"
"\t.4byte 0x00000000\n"
);
