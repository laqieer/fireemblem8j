#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_107_ref, \"a\", %progbits\n"
"\t.global gFontgrp_107\n"
"gFontgrp_107:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0x798\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000CC00\n"
"\t.4byte 0x0003BB30\n"
"\t.4byte 0x0003BBEC\n"
"\t.4byte 0x0000CCEC\n"
"\t.4byte 0x0000FBEC\n"
"\t.4byte 0x0003AAAB\n"
"\t.4byte 0x0000FBEC\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00003AEC\n"
"\t.4byte 0x00000FEC\n"
"\t.4byte 0x00003FEC\n"
"\t.4byte 0x0000EAB0\n"
"\t.4byte 0x00003FC0\n"
"\t.4byte 0x00000000\n"
);
