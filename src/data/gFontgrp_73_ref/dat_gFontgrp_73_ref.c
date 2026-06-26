#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_73_ref, \"a\", %progbits\n"
"\t.global gFontgrp_73\n"
"gFontgrp_73:\n"
"\t.4byte frontier_df3_fontgrp_se_009_582F1C + 0xC18\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000303C\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x00003BAC\n"
"\t.4byte 0x00003BAC\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00000EB0\n"
"\t.4byte 0x00003AEC\n"
"\t.4byte 0x00003AEC\n"
"\t.4byte 0x0000EB3B\n"
"\t.4byte 0x00003C0C\n"
"\t.4byte 0x00000000\n"
);
