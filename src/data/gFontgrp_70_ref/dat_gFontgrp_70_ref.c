#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_70_ref, \"a\", %progbits\n"
"\t.global gFontgrp_70\n"
"gFontgrp_70:\n"
"\t.4byte frontier_df3_fontgrp_se_000_57E884 + 0xB40\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000F3C\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x00003AEB\n"
"\t.4byte 0x0000EEAB\n"
"\t.4byte 0x0000F3FC\n"
"\t.4byte 0x00000000\n"
);
