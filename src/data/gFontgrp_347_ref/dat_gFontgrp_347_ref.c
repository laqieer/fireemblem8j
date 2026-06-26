#include "global.h"

/* De-pointered gFontgrp Glyph table: struct Glyph.sjisNext (offset 0, record
 * stride 0x48) is the Shift-JIS next-glyph pointer -> emitted as a .4byte sym
 * relocation so the JP font linked list is shiftable. Bitmap/metadata words kept
 * raw (coincidental). Byte-identical to baserom (gated by make compare). */

__asm__(
"\t.section .rodata.dat_gFontgrp_347_ref, \"a\", %progbits\n"
"\t.global gFontgrp_347\n"
"gFontgrp_347:\n"
"\t.4byte frontier_df3_fontgrp_se_007_581A04 + 0x948\n"
"\t.4byte 0x00000782\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000033F0\n"
"\t.4byte 0x0000EEAC\n"
"\t.4byte 0x0000EBEB\n"
"\t.4byte 0x0000ECEB\n"
"\t.4byte 0x000030EB\n"
"\t.4byte 0x00000FAC\n"
"\t.4byte 0x00003AF0\n"
"\t.4byte 0x0000EB0C\n"
"\t.4byte 0x0000EB3B\n"
"\t.4byte 0x0000EBFB\n"
"\t.4byte 0x00003AAB\n"
"\t.4byte 0x00000FFC\n"
"\t.4byte 0x00000000\n"
);
