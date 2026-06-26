#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_110_ref, \"a\", %progbits\n"
"\t.global gFontgrp_110\n"
"gFontgrp_110:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0x120\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000000C0\n"
"\t.4byte 0x000003B0\n"
"\t.4byte 0x00000FBC\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x0000FFBC\n"
"\t.4byte 0x0003ABEC\n"
"\t.4byte 0x0003BCEC\n"
"\t.4byte 0x0000C0EC\n"
"\t.4byte 0x0000033B\n"
"\t.4byte 0x0000FEFB\n"
"\t.4byte 0x0003AB3B\n"
"\t.4byte 0x0000FC0C\n"
"\t.4byte 0x00000000\n"
);
