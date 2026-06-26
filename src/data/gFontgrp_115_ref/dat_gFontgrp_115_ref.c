#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_115_ref, \"a\", %progbits\n"
"\t.global gFontgrp_115\n"
"gFontgrp_115:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0x90\n"
"\t.4byte 0x00000882\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FC00\n"
"\t.4byte 0x00036700\n"
"\t.4byte 0x0003BBC0\n"
"\t.4byte 0x00036EBC\n"
"\t.4byte 0x0000F3AB\n"
"\t.4byte 0x0000ECEC\n"
"\t.4byte 0x0003ACEC\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x0000EC3B\n"
"\t.4byte 0x00003BEC\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x000003C0\n"
"\t.4byte 0x00000000\n"
);
